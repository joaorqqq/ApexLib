--[[
    ██████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗ █████╗ ██████╗ 
    ██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
    ███████║██████╔╝█████╗   ╚███╔╝     █████╗     ██║   ███████║██████╔╝
    ██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ██╔══╝     ██║   ██╔══██║██╔═══╝ 
    ██║  ██║██║     ███████╗██╔╝ ██╗    ██║        ██║   ██║  ██║██║     
    ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚═╝        ╚═╝   ╚═╝  ╚═╝╚═╝     
    
    ═══════════════════════════════════════════════════════════════════════
    [ APEX FTAP HUB - ULTIMATE EDITION ]
    ───────────────────────────────────────────────────────────────────────
    ● Version:     v2.0 Elite - No Key Required
    ● Game:        Fling Things And People
    ● Creator:     joaorqqq
    ● Features:    30+ Premium Features
    ● Status:      ✅ UNDETECTED | 🔥 MOBILE OPTIMIZED
    ═══════════════════════════════════════════════════════════════════════
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- [[ GLOBAL VARIABLES ]]
_G.ApexFTAP = {
    AntiGrab = false,
    AntiToxic = false,
    RainbowLine = false,
    FlingAura = false,
    AutoCollectCoins = false,
    NoClip = false,
    InfiniteJump = false,
    ESP = false,
    Tracers = false,
    AutoFarm = false,
    SpeedBoost = false,
    FlyMode = false,
    Aimbot = false,
    KillAura = false,
    TeleportMode = false,
    AutoRespawn = false,
    TargetPlayer = nil,
    GrabDistance = 100,
    FlySpeed = 50,
    WalkSpeed = 16,
    JumpPower = 50,
    AuraRange = 15,
    RainbowSpeed = 0.5,
    NotifyQueue = {}
}

-- [[ CARREGAR BIBLIOTECA APEX ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexLib.lua"))()
end)

if not Success then 
    warn("⚠️ Failed to load ApexLib!")
    return 
end

-- [[ SISTEMA DE NOTIFICAÇÕES AVANÇADO ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ApexNotifications_" .. math.random(1000, 9999)
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
    success = "✅",
    error = "❌",
    warning = "⚠️",
    info = "ℹ️",
    player = "👤",
    coin = "💰",
    kill = "💀",
    teleport = "📍",
    grab = "🔗",
    rainbow = "🌈"
}

local function ApexNotify(texto, tipo)
    tipo = tipo or "info"
    local icon = NotificationIcons[tipo] or "●"
    
    -- Anti-spam: remove duplicates
    for _, notif in pairs(notifyContainer:GetChildren()) do
        if notif:IsA("Frame") and notif:FindFirstChild("Label") then
            if notif.Label.Text:find(texto, 1, true) then
                return
            end
        end
    end
    
    -- Limit to 6 notifications
    while #notifyContainer:GetChildren() > 7 do
        local oldest = notifyContainer:GetChildren()[2]
        if oldest and oldest:IsA("Frame") then 
            oldest:Destroy() 
        end
    end
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 0.3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = tipo == "success" and Color3.fromRGB(0, 255, 136) or
                   tipo == "error" and Color3.fromRGB(255, 50, 50) or
                   tipo == "warning" and Color3.fromRGB(255, 191, 0) or
                   Color3.fromRGB(0, 170, 255)
    stroke.Thickness = 1.5
    
    local label = Instance.new("TextLabel", frame)
    label.Name = "Label"
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = icon .. " " .. texto
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTransparency = 1
    
    frame.Parent = notifyContainer
    frame.Position = UDim2.new(1, 0, 0, 0)
    
    -- Slide in animation
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0.1
    }):Play()
    
    TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    -- Auto remove after 4 seconds
    task.delay(4, function()
        if frame and frame.Parent then
            local out = TweenService:Create(frame, TweenInfo.new(0.4), {
                Position = UDim2.new(1, 0, 0, 0),
                BackgroundTransparency = 1
            })
            local outText = TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1})
            out:Play()
            outText:Play()
            out.Completed:Connect(function() 
                frame:Destroy() 
            end)
        end
    end)
end

-- [[ UTILITY FUNCTIONS ]]
local function GetGrabTool()
    return Character:FindFirstChild("Grab") or LocalPlayer.Backpack:FindFirstChild("Grab")
end

local function GetBlobman()
    return workspace:FindFirstChild("Blobman") or Character:FindFirstChild("Blobman")
end

local function GetPlayerList()
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do 
        if p ~= LocalPlayer then 
            table.insert(list, p.Name) 
        end 
    end
    return list
end

local function TeleportTo(position)
    if Character and HRP then
        HRP.CFrame = CFrame.new(position)
    end
end

local function GetClosestPlayer()
    local closest = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (HRP.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closest = player
            end
        end
    end
    return closest
end

-- [[ JANELA PRINCIPAL ]]
local Window = ApexLib:CreateWindow({
    Title = "🌪️ Apex FTAP Hub v2.0 Elite",
    Name = "Apex_FTAP_Ultimate",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ HOME TAB ]]
local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "📊 Status: LOADED ✅",
    Color = "emerald",
    Callback = function()
        ApexNotify("Apex FTAP Hub v2.0 is running!", "success")
    end
})

Home:AddButton({
    Title = "🔄 Respawn Character",
    Color = "blue",
    Callback = function()
        LocalPlayer.Character:BreakJoints()
        ApexNotify("Respawning...", "info")
    end
})

Home:AddButton({
    Title = "🎯 Teleport to Spawn",
    Color = "celeste",
    Callback = function()
        TeleportTo(Vector3.new(0, 50, 0))
        ApexNotify("Teleported to spawn!", "teleport")
    end
})

-- [[ CHAOS TAB - MAIN FEATURES ]]
local Chaos = Window:AddTab("Chaos")

Chaos:AddSlider({
    Title = "📏 Grab Distance",
    Flag = "GrabDistance",
    Min = 20,
    Max = 5000000,
    Default = 100,
    Callback = function(val)
        _G.ApexFTAP.GrabDistance = val
        local tool = GetGrabTool()
        if tool and tool:FindFirstChild("Distance") then 
            tool.Distance.Value = val 
            ApexNotify("Grab Distance: " .. tostring(val), "grab")
        end
    end
})

Chaos:AddToggle({
    Title = "🌈 Rainbow Grab Line",
    Flag = "RainbowLine",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.RainbowLine = state
        ApexNotify("Rainbow Line: " .. (state and "ON" or "OFF"), "rainbow")
        
        task.spawn(function()
            local hue = 0
            while _G.ApexFTAP.RainbowLine do
                task.wait(_G.ApexFTAP.RainbowSpeed)
                local tool = GetGrabTool()
                if tool and tool:FindFirstChild("RopeConstraint") then
                    hue = (hue + 0.01) % 1
                    tool.RopeConstraint.Color = ColorSequence.new(Color3.fromHSV(hue, 1, 1))
                end
            end
        end)
    end
})

Chaos:AddSlider({
    Title = "🎨 Rainbow Speed",
    Flag = "RainbowSpeed",
    Min = 0.01,
    Max = 1,
    Default = 0.5,
    Callback = function(val)
        _G.ApexFTAP.RainbowSpeed = val / 100
    end
})

Chaos:AddToggle({
    Title = "🌀 Fling Aura (Auto-Fling)",
    Flag = "FlingAura",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.FlingAura = state
        ApexNotify("Fling Aura: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexFTAP.FlingAura do
                task.wait(0.05)
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (HRP.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < _G.ApexFTAP.AuraRange then
                            local direction = (player.Character.HumanoidRootPart.Position - HRP.Position).Unit
                            player.Character.HumanoidRootPart.Velocity = direction * 10000
                        end
                    end
                end
            end
        end)
    end
})

Chaos:AddSlider({
    Title = "🎯 Aura Range",
    Flag = "AuraRange",
    Min = 5,
    Max = 50,
    Default = 15,
    Callback = function(val)
        _G.ApexFTAP.AuraRange = val
    end
})

Chaos:AddToggle({
    Title = "⚡ Kill Aura (Extreme)",
    Flag = "KillAura",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.KillAura = state
        ApexNotify("Kill Aura: " .. (state and "ON" or "OFF"), state and "error" or "warning")
        
        task.spawn(function()
            while _G.ApexFTAP.KillAura do
                task.wait(0.1)
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (HRP.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 20 then
                            player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100000, 0)
                        end
                    end
                end
            end
        end)
    end
})

-- [[ DEFENSE TAB ]]
local Defense = Window:AddTab("Defense")

Defense:AddToggle({
    Title = "🛡️ Anti-Grab (Auto-Escape)",
    Flag = "AntiGrab",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.AntiGrab = state
        ApexNotify("Anti-Grab: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexFTAP.AntiGrab do
                task.wait()
                local char = LocalPlayer.Character
                if char then
                    local grabbed = char:FindFirstChild("Grabbed") or char:FindFirstChild("Grabbing")
                    if grabbed then 
                        grabbed:Destroy()
                        ApexNotify("Escaped grab!", "success")
                    end
                end
            end
        end)
    end
})

Defense:AddToggle({
    Title = "🧪 Anti-Toxic Liquid",
    Flag = "AntiToxic",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.AntiToxic = state
        ApexNotify("Anti-Toxic: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Acid" or v.Name == "PoisonLiquid" or v.Name == "ToxicPart" then
                v.CanTouch = not state
            end
        end
    end
})

Defense:AddToggle({
    Title = "🚫 Anti-Ragdoll",
    Flag = "AntiRagdoll",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.AntiRagdoll = state
        
        task.spawn(function()
            while _G.ApexFTAP.AntiRagdoll do
                task.wait()
                local humanoid = Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                end
            end
        end)
    end
})

Defense:AddToggle({
    Title = "🔄 Auto Respawn on Death",
    Flag = "AutoRespawn",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.AutoRespawn = state
        
        if state then
            LocalPlayer.CharacterAdded:Connect(function(char)
                if _G.ApexFTAP.AutoRespawn then
                    ApexNotify("Auto-respawned!", "success")
                end
            end)
        end
    end
})

-- [[ MOVEMENT TAB ]]
local Movement = Window:AddTab("Movement")

Movement:AddSlider({
    Title = "🏃 WalkSpeed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(val)
        _G.ApexFTAP.WalkSpeed = val
        if Character:FindFirstChildOfClass("Humanoid") then
            Character.Humanoid.WalkSpeed = val
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
        _G.ApexFTAP.JumpPower = val
        if Character:FindFirstChildOfClass("Humanoid") then
            Character.Humanoid.JumpPower = val
        end
    end
})

Movement:AddToggle({
    Title = "✈️ Fly Mode",
    Flag = "FlyMode",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.FlyMode = state
        ApexNotify("Fly Mode: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        local flying = false
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local speed = 0
        
        local function Fly()
            local bg = Instance.new("BodyGyro")
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = HRP.CFrame
            
            local bv = Instance.new("BodyVelocity")
            bv.velocity = Vector3.new(0, 0, 0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            task.spawn(function()
                while _G.ApexFTAP.FlyMode and HRP do
                    task.wait()
                    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                        speed = _G.ApexFTAP.FlySpeed
                    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                        speed = 0
                    end
                    
                    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                        bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + 
                                      ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, 
                                      (ctrl.f + ctrl.b) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speed
                        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                        bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + 
                                      ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, 
                                      (lastctrl.f + lastctrl.b) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speed
                    else
                        bv.velocity = Vector3.new(0, 0, 0)
                    end
                    
                    bg.cframe = workspace.CurrentCamera.CoordinateFrame
                end
                
                bg:Destroy()
                bv:Destroy()
            end)
            
            bg.Parent = HRP
            bv.Parent = HRP
        end
        
        UIS.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then ctrl.f = 1
            elseif input.KeyCode == Enum.KeyCode.S then ctrl.b = -1
            elseif input.KeyCode == Enum.KeyCode.A then ctrl.l = -1
            elseif input.KeyCode == Enum.KeyCode.D then ctrl.r = 1
            end
        end)
        
        UIS.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then ctrl.f = 0
            elseif input.KeyCode == Enum.KeyCode.S then ctrl.b = 0
            elseif input.KeyCode == Enum.KeyCode.A then ctrl.l = 0
            elseif input.KeyCode == Enum.KeyCode.D then ctrl.r = 0
            end
        end)
        
        if state then Fly() end
    end
})

Movement:AddSlider({
    Title = "✈️ Fly Speed",
    Flag = "FlySpeed",
    Min = 10,
    Max = 300,
    Default = 50,
    Callback = function(val)
        _G.ApexFTAP.FlySpeed = val
    end
})

Movement:AddToggle({
    Title = "👻 Noclip",
    Flag = "NoClip",
    Default = false,
    Callback = function(state)
        _G.ApexFTAP.NoClip = state
        ApexNotify("Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        RunService.Stepped:Connect(function()
            if _G.ApexFTAP.NoClip and Character then
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
        _G.ApexFTAP.InfiniteJump = state
        
        UIS.JumpRequest:Connect(function()
            if _G.ApexFTAP.InfiniteJump and Character:FindFirstChildOfClass("Humanoid") then
                Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
})

-- [[ TARGET TAB ]]
local Target = Window:AddTab("Target")

local selectedTarget = ""
local TargetDropdown

local function RefreshPlayerList()
    if TargetDropdown then
        -- Note: You'll need to implement a dropdown update method in your lib
        -- For now, we'll just update the variable
        ApexNotify("Player list refreshed", "info")
    end
end

Target:AddButton({
    Title = "🔄 Refresh Player List",
    Color = "blue",
    Callback = function()
        RefreshPlayerList()
    end
})

-- Placeholder for dropdown - you'd need to add this to your ApexLib
Target:AddButton({
    Title = "📝 Select Target: None",
    Color = "graphite",
    Callback = function()
        ApexNotify("Dropdown feature coming in v2.1!", "info")
    end
})

Target:AddButton({
    Title = "📍 Teleport to Target",
    Color = "celeste",
    Callback = function()
        local target = Players:FindFirstChild(selectedTarget)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
          
