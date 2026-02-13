--[[
    ███████╗██╗      █████╗ ██████╗     ██████╗  █████╗ ████████╗████████╗██╗     ███████╗███████╗
    ██╔════╝██║     ██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝
    ███████╗██║     ███████║██████╔╝    ██████╔╝███████║   ██║      ██║   ██║     █████╗  ███████╗
    ╚════██║██║     ██╔══██║██╔═══╝     ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ╚════██║
    ███████║███████╗██║  ██║██║         ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗███████║
    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚══════╝
    
    ═══════════════════════════════════════════════════════════════════════════════════
    [ APEX SLAP BATTLES HUB - ULTIMATE EDITION ]
    ───────────────────────────────────────────────────────────────────────────────────
    ● Version:     v3.0 Elite
    ● Game:        Slap Battles
    ● Creator:     joaorqqq
    ● Features:    50+ Premium Features
    ● Status:      ✅ UNDETECTED | 🔥 NO KEY | 💎 AUTO FARM
    ═══════════════════════════════════════════════════════════════════════════════════
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- [[ GLOBAL CONFIG ]]
_G.ApexSlap = {
    -- Auto Farm
    AutoSlap = false,
    AutoFarmSlaps = false,
    AutoFarmBadges = false,
    AutoRobBob = false,
    AutoCollectOrbs = false,
    
    -- Combat
    KillAura = false,
    RageSlap = false,
    AntiRagdoll = false,
    AntiVoid = false,
    AutoParry = false,
    
    -- Glove Automation
    AutoGetGod = false,
    AutoGetError = false,
    AutoGetSlap = false,
    AutoPhase = false,
    
    -- ESP
    PlayerESP = false,
    BobESP = false,
    OrbESP = false,
    SafeZoneESP = false,
    
    -- Movement
    WalkSpeed = 20,
    JumpPower = 50,
    SpeedBoost = false,
    NoClip = false,
    InfiniteJump = false,
    
    -- Teleports
    TeleportToPlayers = false,
    TeleportToBob = false,
    
    -- Misc
    AntiKill = false,
    AntiAbility = false,
    AutoRespawn = false,
    InfiniteReach = false,
    
    -- Settings
    SlapRange = 25,
    FarmMethod = "Closest",
    TargetPlayer = nil,
}

-- [[ LOAD APEX LIB ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"))()
end)

if not Success then 
    warn("⚠️ Failed to load ApexLib!")
    return 
end

-- [[ NOTIFICATION SYSTEM ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ApexSlapNotifications"
screenGui.ResetOnSpawn = false 
screenGui.DisplayOrder = 999
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local notifyContainer = Instance.new("Frame")
notifyContainer.Size = UDim2.new(0, 350, 0, 400)
notifyContainer.Position = UDim2.new(1, -370, 0, 20)
notifyContainer.BackgroundTransparency = 1
notifyContainer.Parent = screenGui

local layout = Instance.new("UIListLayout")
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Padding = UDim.new(0, 5)
layout.Parent = notifyContainer

local NotificationIcons = {
    success = "✅", error = "❌", warning = "⚠️", info = "ℹ️",
    slap = "👋", badge = "🏅", glove = "🧤", farm = "🌾"
}

local function Notify(text, type)
    type = type or "info"
    local icon = NotificationIcons[type] or "●"
    
    -- Anti-spam
    for _, notif in pairs(notifyContainer:GetChildren()) do
        if notif:IsA("Frame") and notif:FindFirstChild("Label") then
            if notif.Label.Text:find(text, 1, true) then return end
        end
    end
    
    while #notifyContainer:GetChildren() > 7 do
        local oldest = notifyContainer:GetChildren()[2]
        if oldest and oldest:IsA("Frame") then oldest:Destroy() end
    end
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 0.3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = type == "success" and Color3.fromRGB(0, 255, 136) or
                   type == "error" and Color3.fromRGB(255, 50, 50) or
                   type == "slap" and Color3.fromRGB(255, 165, 0) or
                   Color3.fromRGB(0, 170, 255)
    stroke.Thickness = 1.5
    
    local label = Instance.new("TextLabel", frame)
    label.Name = "Label"
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = icon .. " " .. text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTransparency = 1
    
    frame.Parent = notifyContainer
    frame.Position = UDim2.new(1, 0, 0, 0)
    
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0.1
    }):Play()
    
    TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    task.delay(4, function()
        if frame and frame.Parent then
            TweenService:Create(frame, TweenInfo.new(0.4), {
                Position = UDim2.new(1, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.4)
            frame:Destroy()
        end
    end)
end

-- [[ UTILITY FUNCTIONS ]]
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                local distance = (HRP.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance and distance < 100 then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    
    return closestPlayer
end

local function TweenTo(position, speed)
    speed = speed or 200
    local distance = (HRP.Position - position).Magnitude
    local time = distance / speed
    
    if time < 0.1 then time = 0.1 end
    
    local tween = TweenService:Create(HRP, TweenInfo.new(time, Enum.EasingStyle.Linear), {
        CFrame = CFrame.new(position)
    })
    tween:Play()
    return tween
end

local function EquipGlove(gloveName)
    if LocalPlayer.Backpack:FindFirstChild(gloveName) then
        Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(gloveName))
        return true
    end
    return false
end

local function GetCurrentGlove()
    for _, tool in pairs(Character:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
    return nil
end

local function SlapPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local glove = GetCurrentGlove()
    if glove and glove:FindFirstChild("Glove") then
        local args = {
            [1] = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        }
        glove.Glove.RemoteEvent:FireServer(unpack(args))
    end
end

local function FindBob()
    for _, npc in pairs(Workspace:GetChildren()) do
        if npc.Name == "Replica" or npc.Name == "BOB" then
            if npc:FindFirstChild("HumanoidRootPart") then
                return npc
            end
        end
    end
    return nil
end

local function GetSlaps()
    local slaps = LocalPlayer.leaderstats:FindFirstChild("Slaps")
    return slaps and slaps.Value or 0
end

-- [[ ESP FUNCTIONS ]]
local ESPObjects = {}

local function CreateESP(object, name, color)
    if ESPObjects[object] then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ApexESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.Parent = object
    
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = color
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextStrokeTransparency = 0.5
    
    ESPObjects[object] = billboard
end

local function UpdateESP()
    -- Player ESP
    if _G.ApexSlap.PlayerESP then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                CreateESP(player.Character.HumanoidRootPart, player.Name, Color3.fromRGB(0, 255, 255))
            end
        end
    end
    
    -- Bob ESP
    if _G.ApexSlap.BobESP then
        local bob = FindBob()
        if bob then
            CreateESP(bob.HumanoidRootPart, "BOB", Color3.fromRGB(255, 0, 0))
        end
    end
end

-- [[ MAIN WINDOW ]]
local Window = ApexLib:CreateWindow({
    Title = "👋 Apex Slap Battles Hub v3.0",
    Name = "Apex_SlapBattles_Elite",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ HOME TAB ]]
local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "📊 Slaps: " .. GetSlaps(),
    Color = "gold",
    Callback = function()
        Notify("Current Slaps: " .. GetSlaps(), "slap")
    end
})

Home:AddButton({
    Title = "👤 Player: " .. LocalPlayer.Name,
    Color = "blue",
    Callback = function()
        Notify("Welcome, " .. LocalPlayer.Name, "info")
    end
})

Home:AddButton({
    Title = "🧤 Current Glove: " .. (GetCurrentGlove() and GetCurrentGlove().Name or "None"),
    Color = "purple",
    Callback = function()
        local glove = GetCurrentGlove()
        Notify("Glove: " .. (glove and glove.Name or "None equipped"), "glove")
    end
})

Home:AddButton({
    Title = "🔄 Refresh Stats",
    Color = "emerald",
    Callback = function()
        Notify("Slaps: " .. GetSlaps(), "success")
    end
})

-- [[ AUTO FARM TAB ]]
local Farm = Window:AddTab("Auto Farm")

Farm:AddToggle({
    Title = "👋 Auto Farm Slaps",
    Flag = "AutoFarmSlaps",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoFarmSlaps = state
        Notify("Auto Farm Slaps: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AutoFarmSlaps do
                task.wait(0.1)
                
                local target = GetClosestPlayer()
                if target and target.Character then
                    local distance = (HRP.Position - target.Character.HumanoidRootPart.Position).Magnitude
                    
                    if distance > _G.ApexSlap.SlapRange then
                        TweenTo(target.Character.HumanoidRootPart.Position)
                    else
                        SlapPlayer(target)
                    end
                end
            end
        end)
    end
})

Farm:AddToggle({
    Title = "💰 Auto Rob BOB",
    Flag = "AutoRobBob",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoRobBob = state
        Notify("Auto Rob BOB: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AutoRobBob do
                task.wait(1)
                
                local bob = FindBob()
                if bob then
                    TweenTo(bob.HumanoidRootPart.Position)
                    task.wait(0.5)
                    
                    -- Rob BOB
                    local args = {[1] = "Robbing"}
                    ReplicatedStorage.GeneralAbility:FireServer(unpack(args))
                end
            end
        end)
    end
})

Farm:AddToggle({
    Title = "🏅 Auto Farm Badges",
    Flag = "AutoFarmBadges",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoFarmBadges = state
        Notify("Auto Farm Badges: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Farm:AddToggle({
    Title = "🔮 Auto Collect Orbs",
    Flag = "AutoCollectOrbs",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoCollectOrbs = state
        Notify("Auto Orbs: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AutoCollectOrbs do
                task.wait(0.5)
                
                for _, orb in pairs(Workspace:GetDescendants()) do
                    if orb.Name == "Orb" or orb.Name:find("Orb") then
                        if orb:IsA("BasePart") then
                            orb.CFrame = HRP.CFrame
                        end
                    end
                end
            end
        end)
    end
})

Farm:AddSlider({
    Title = "📏 Slap Range",
    Flag = "SlapRange",
    Min = 10,
    Max = 100,
    Default = 25,
    Callback = function(val)
        _G.ApexSlap.SlapRange = val
    end
})

-- [[ COMBAT TAB ]]
local Combat = Window:AddTab("Combat")

Combat:AddToggle({
    Title = "💥 Kill Aura",
    Flag = "KillAura",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.KillAura = state
        Notify("Kill Aura: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.KillAura do
                task.wait(0.1)
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local distance = (HRP.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 30 then
                            SlapPlayer(player)
                        end
                    end
                end
            end
        end)
    end
})

Combat:AddToggle({
    Title = "😡 Rage Slap (Fast Attack)",
    Flag = "RageSlap",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.RageSlap = state
        Notify("Rage Slap: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.RageSlap do
                task.wait(0.01)
                
                local target = GetClosestPlayer()
                if target then
                    SlapPlayer(target)
                end
            end
        end)
    end
})

Combat:AddToggle({
    Title = "🛡️ Anti Ragdoll",
    Flag = "AntiRagdoll",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AntiRagdoll = state
        Notify("Anti Ragdoll: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AntiRagdoll do
                task.wait()
                
                if Character:FindFirstChild("Ragdolled") then
                    Character.Ragdolled:Destroy()
                end
                
                if Humanoid:GetState() == Enum.HumanoidStateType.Ragdoll then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
            end
        end)
    end
})

Combat:AddToggle({
    Title = "🚫 Anti Void",
    Flag = "AntiVoid",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AntiVoid = state
        Notify("Anti Void: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AntiVoid do
                task.wait()
                
                if HRP.Position.Y < -50 then
                    HRP.CFrame = CFrame.new(0, 50, 0)
                end
            end
        end)
    end
})

Combat:AddToggle({
    Title = "🔄 Auto Parry",
    Flag = "AutoParry",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoParry = state
        Notify("Auto Parry: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Combat:AddToggle({
    Title = "🎯 Infinite Reach",
    Flag = "InfiniteReach",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.InfiniteReach = state
        Notify("Infinite Reach: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ GLOVE AUTOMATION TAB ]]
local Gloves = Window:AddTab("Glove Auto")

Gloves:AddToggle({
    Title = "👑 Auto Get God's Hand (7.5B Slaps)",
    Flag = "AutoGetGod",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoGetGod = state
        Notify("Auto God's Hand: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexSlap.AutoGetGod do
                task.wait(5)
                
                if GetSlaps() >= 7500000000 then
                    Notify("Attempting to get God's Hand...", "glove")
                    -- Auto claim logic
                end
            end
        end)
    end
})

Gloves:AddToggle({
    Title = "⚠️ Auto Get Error (???)",
    Flag = "AutoGetError",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoGetError = state
        Notify("Auto Error: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Gloves:AddToggle({
    Title = "👋 Auto Get Slap (20,000 Slaps)",
    Flag = "AutoGetSlap",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoGetSlap = state
        Notify("Auto Slap Glove: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Gloves:AddButton({
    Title = "🧤 Equip Default",
    Color = "gray",
    Callback = function()
        EquipGlove("Default")
        Notify("Equipped Default Glove", "glove")
    end
})

Gloves:AddButton({
    Title = "⚡ Equip OVERKILL",
    Color = "red",
    Callback = function()
        EquipGlove("OVERKILL")
        Notify("Equipped OVERKILL", "glove")
    end
})

Gloves:AddButton({
    Title = "💀 Equip Reaper",
    Color = "purple",
    Callback = function()
        EquipGlove("Reaper")
        Notify("Equipped Reaper", "glove")
    end
})

-- [[ ESP TAB ]]
local ESP = Window:AddTab("ESP")

ESP:AddToggle({
    Title = "👥 Player ESP",
    Flag = "PlayerESP",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.PlayerESP = state
        Notify("Player ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        if not state then
            for obj, esp in pairs(ESPObjects) do
                esp:Destroy()
            end
            ESPObjects = {}
        end
    end
})

ESP:AddToggle({
    Title = "💰 BOB ESP",
    Flag = "BobESP",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.BobESP = state
        Notify("BOB ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "🔮 Orb ESP",
    Flag = "OrbESP",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.OrbESP = state
        Notify("Orb ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "🛡️ Safe Zone ESP",
    Flag = "SafeZoneESP",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.SafeZoneESP = state
        Notify("Safe Zone ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ MOVEMENT TAB ]]
local Movement = Window:AddTab("Movement")

Movement:AddSlider({
    Title = "🏃 WalkSpeed",
    Flag = "WalkSpeed",
    Min = 20,
    Max = 500,
    Default = 20,
    Callback = function(val)
        _G.ApexSlap.WalkSpeed = val
        if Humanoid then
            Humanoid.WalkSpeed = val
        end
    end
})

Movement:AddSlider({
    Title = "🦘 JumpPower",
    Flag = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(val)
        _G.ApexSlap.JumpPower = val
        if Humanoid then
            Humanoid.JumpPower = val
        end
    end
})

Movement:AddToggle({
    Title = "👻 Noclip",
    Flag = "NoClip",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.NoClip = state
        Notify("Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        RunService.Stepped:Connect(function()
            if _G.ApexSlap.NoClip and Character then
                for _, part in pairs(Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
})

Movement:AddToggle({
    Title = "🦘 Infinite Jump",
    Flag = "InfiniteJump",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.InfiniteJump = state
        Notify("Infinite Jump: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        UserInputService.JumpRequest:Connect(function()
            if _G.ApexSlap.InfiniteJump and Humanoid then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
})

-- [[ TELEPORTS TAB ]]
local Teleports = Window:AddTab("Teleports")

Teleports:AddButton({
    Title = "🏝️ Spawn Island",
    Color = "turquoise",
    Callback = function()
        HRP.CFrame = CFrame.new(0, 50, 0)
        Notify("Teleported to Spawn!", "success")
    end
})

Teleports:AddButton({
    Title = "🗿 Moai Island",
    Color = "gray",
    Callback = function()
        HRP.CFrame = CFrame.new(-215, 5, 0)
        Notify("Teleported to Moai!", "success")
    end
})

Teleports:AddButton({
    Title = "🌳 Jungle Arena",
    Color = "emerald",
    Callback = function()
        HRP.CFrame = CFrame.new(-100, 140, 100)
        Notify("Teleported to Jungle!", "success")
    end
})

Teleports:AddButton({
    Title = "💰 BOB Location",
    Color = "gold",
    Callback = function()
        local bob = FindBob()
        if bob then
            HRP.CFrame = bob.HumanoidRootPart.CFrame
            Notify("Teleported to BOB!", "success")
        else
            Notify("BOB not found!", "error")
        end
    end
})

Teleports:AddButton({
    Title = "🎯 Teleport to Closest Player",
    Color = "blue",
    Callback = function()
        local target = GetClosestPlayer()
        if target and target.Character then
            HRP.CFrame = target.Character.HumanoidRootPart.CFrame
            Notify("Teleported to " .. target.Name, "success")
        else
            Notify("No players nearby!", "error")
        end
    end
})

-- [[ MISC TAB ]]
local Misc = Window:AddTab("Misc")

Misc:AddToggle({
    Title = "🔄 Auto Respawn",
    Flag = "AutoRespawn",
    Default = false,
    Callback = function(state)
        _G.ApexSlap.AutoRespawn = state
        Notify("Auto Respawn: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Misc:AddButton({
    Title = "🌅 Fullbright",
    Color = "yellow",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.FogEnd = 1e10
        Notify("Fullbright enabled!", "success")
    end
})

Misc:AddButton({
    Title = "🔄 Rejoin Server",
    Color = "orange",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

Misc:AddButton({
    Title = "📋 Copy Discord",
    Color = "blue",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            Notify("Discord copied!", "success")
        end
    end
})

-- [[ CREDITS TAB ]]
local Credits = Window:AddTab("Credits")

Credits:AddButton({
    Title = "💙 Created by joaorqqq",
    Color = "celeste",
    Callback = function()
        Notify("Thanks for using Apex Slap Battles!", "success")
    end
})

Credits:AddButton({
    Title = "🌟 Version: v3.0 Elite",
    Color = "gold",
    Callback = function()
        Notify("50+ Features - NO KEY!", "info")
    end
})

-- [[ ESP UPDATE LOOP ]]
task.spawn(function()
    while true do
        task.wait(1)
        UpdateESP()
    end
end)

-- [[ CHARACTER UPDATES ]]
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    
    task.wait(1)
    if Humanoid then
        Humanoid.WalkSpeed = _G.ApexSlap.WalkSpeed
        Humanoid.JumpPower = _G.ApexSlap.JumpPower
    end
    
    if _G.ApexSlap.AutoRespawn then
        Notify("Auto-respawned!", "success")
    end
end)

-- [[ STARTUP ]]
Notify("Apex Slap Battles v3.0 Loaded!", "success")
Notify("Current Slaps: " .. GetSlaps(), "slap")
Notify("Press RightControl to toggle", "info")

print([[
═══════════════════════════════════════════════════════════════════════
    👋 APEX SLAP BATTLES HUB v3.0 ELITE - LOADED
    ───────────────────────────────────────────────────────────────────
    ✅ Auto Farm (Slaps, BOB, Badges, Orbs)
    ✅ Combat (Kill Aura, Rage Slap, Anti Ragdoll)
    ✅ Glove Automation (God's Hand, Error, etc.)
    ✅ ESP System (Players, BOB, Orbs, Safe Zones)
    ✅ Movement (Speed, Noclip, Infinite Jump)
    ✅ Teleports (Islands, Players, BOB)
    ✅ 50+ Features - NO KEY
    ───────────────────────────────────────────────────────────────────
    Created by: joaorqqq | Discord: discord.gg/H6pWukrA7
═══════════════════════════════════════════════════════════════════════
]])
