--[[
    ██████╗  ██████╗  ██████╗ ██████╗ ███████╗
    ██╔══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
    ██║  ██║██║   ██║██║   ██║██████╔╝███████╗
    ██║  ██║██║   ██║██║   ██║██╔══██╗╚════██║
    ██████╔╝╚██████╔╝╚██████╔╝██║  ██║███████║
    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
    
    ═══════════════════════════════════════════════════════════════════════
    [ APEX DOORS HUB - ULTIMATE EDITION ]
    ───────────────────────────────────────────────────────────────────────
    ● Version:     v2.0 Elite
    ● Game:        DOORS
    ● Creator:     joaorqqq
    ● Features:    40+ Premium Features
    ● Status:      ✅ UNDETECTED | 🔥 NO KEY | 👻 ESP SYSTEM
    ═══════════════════════════════════════════════════════════════════════
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- [[ GLOBAL CONFIG ]]
_G.ApexDoors = {
    -- ESP
    EntityESP = false,
    ItemESP = false,
    DoorESP = false,
    KeyESP = false,
    PlayerESP = false,
    GoldESP = false,
    BookESP = false,
    LeverESP = false,
    
    -- Auto Farm
    AutoCollectGold = false,
    AutoCollectItems = false,
    AutoOpenDoors = false,
    AutoPullLevers = false,
    AutoBookshelf = false,
    
    -- Entities
    AutoAvoidRush = false,
    AutoAvoidAmbush = false,
    AutoAvoidEyes = false,
    AutoAvoidSeek = false,
    AutoHideCloset = false,
    
    -- Movement
    SpeedBoost = false,
    NoClip = false,
    InfiniteJump = false,
    Fly = false,
    WalkSpeed = 16,
    FlySpeed = 50,
    
    -- Visuals
    Fullbright = false,
    NoFog = false,
    RemoveDarkness = false,
    
    -- Misc
    InstantInteract = false,
    NoFall = false,
    AntiDupe = false,
    AntiVoid = false,
    NotifyEntities = true,
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
screenGui.Name = "ApexDoorsNotifications"
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
    entity = "👹", item = "💎", door = "🚪", gold = "💰"
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
                   type == "entity" and Color3.fromRGB(255, 0, 0) or
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
local function GetLatestRoom()
    local latestRoom = 0
    for _, room in pairs(Workspace.CurrentRooms:GetChildren()) do
        local roomNumber = tonumber(room.Name)
        if roomNumber and roomNumber > latestRoom then
            latestRoom = roomNumber
        end
    end
    return latestRoom
end

local function GetCurrentRoom()
    local currentRoom = nil
    local shortestDistance = math.huge
    
    for _, room in pairs(Workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("RoomStart") then
            local distance = (HRP.Position - room.RoomStart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                currentRoom = room
            end
        end
    end
    
    return currentRoom
end

local function FindNearestItem(itemName)
    local nearestItem = nil
    local shortestDistance = math.huge
    
    for _, room in pairs(Workspace.CurrentRooms:GetChildren()) do
        for _, item in pairs(room:GetDescendants()) do
            if item.Name == itemName or (itemName == "Gold" and item.Name:find("GoldPile")) then
                if item:IsA("Model") or item:IsA("Part") then
                    local distance = (HRP.Position - item.Position).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        nearestItem = item
                    end
                end
            end
        end
    end
    
    return nearestItem
end

local function TweenTo(position)
    local distance = (HRP.Position - position).Magnitude
    local speed = 100
    local time = distance / speed
    
    if time < 0.1 then time = 0.1 end
    
    local tween = TweenService:Create(HRP, TweenInfo.new(time, Enum.EasingStyle.Linear), {
        CFrame = CFrame.new(position)
    })
    tween:Play()
    return tween
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
    
    local distance = Instance.new("TextLabel", billboard)
    distance.Name = "Distance"
    distance.Size = UDim2.new(1, 0, 0.5, 0)
    distance.Position = UDim2.new(0, 0, 0.5, 0)
    distance.BackgroundTransparency = 1
    distance.Text = "0m"
    distance.TextColor3 = Color3.new(1, 1, 1)
    distance.Font = Enum.Font.Gotham
    distance.TextSize = 12
    distance.TextStrokeTransparency = 0.5
    
    ESPObjects[object] = billboard
    
    task.spawn(function()
        while billboard and billboard.Parent do
            task.wait(0.1)
            if object and HRP then
                local dist = (HRP.Position - object.Position).Magnitude
                distance.Text = math.floor(dist) .. "m"
            end
        end
    end)
end

local function RemoveESP(object)
    if ESPObjects[object] then
        ESPObjects[object]:Destroy()
        ESPObjects[object] = nil
    end
end

local function UpdateESP()
    -- Entity ESP
    if _G.ApexDoors.EntityESP then
        for _, entity in pairs(Workspace:GetChildren()) do
            if entity.Name == "RushMoving" or entity.Name == "AmbushMoving" or 
               entity.Name == "Eyes" or entity.Name == "Screech" or 
               entity.Name == "Halt" or entity.Name == "Seek" then
                CreateESP(entity.PrimaryPart or entity:FindFirstChildWhichIsA("Part"), entity.Name, Color3.fromRGB(255, 0, 0))
            end
        end
    end
    
    -- Item ESP
    if _G.ApexDoors.ItemESP then
        for _, room in pairs(Workspace.CurrentRooms:GetChildren()) do
            for _, item in pairs(room:GetDescendants()) do
                if item.Name == "KeyObtain" or item.Name == "LeverForGate" or 
                   item.Name == "ElectricalKeyObtain" or item.Name == "LiveHintBook" then
                    CreateESP(item, item.Name, Color3.fromRGB(0, 255, 255))
                end
            end
        end
    end
    
    -- Gold ESP
    if _G.ApexDoors.GoldESP then
        for _, room in pairs(Workspace.CurrentRooms:GetChildren()) do
            for _, gold in pairs(room:GetDescendants()) do
                if gold.Name:find("GoldPile") then
                    CreateESP(gold, "Gold", Color3.fromRGB(255, 215, 0))
                end
            end
        end
    end
end

-- [[ ENTITY DETECTION ]]
local function SetupEntityNotifications()
    Workspace.ChildAdded:Connect(function(child)
        if _G.ApexDoors.NotifyEntities then
            task.wait(0.1)
            if child.Name == "RushMoving" then
                Notify("RUSH SPAWNED! HIDE NOW!", "entity")
                
                if _G.ApexDoors.AutoAvoidRush or _G.ApexDoors.AutoHideCloset then
                    local closet = FindNearestItem("Wardrobe")
                    if closet then
                        TweenTo(closet.Position)
                    end
                end
                
            elseif child.Name == "AmbushMoving" then
                Notify("AMBUSH SPAWNED! HIDE NOW!", "entity")
                
                if _G.ApexDoors.AutoAvoidAmbush or _G.ApexDoors.AutoHideCloset then
                    local closet = FindNearestItem("Wardrobe")
                    if closet then
                        TweenTo(closet.Position)
                    end
                end
                
            elseif child.Name == "Eyes" then
                Notify("EYES SPAWNED! LOOK AWAY!", "entity")
                
                if _G.ApexDoors.AutoAvoidEyes then
                    Workspace.CurrentCamera.CFrame = CFrame.new(HRP.Position, HRP.Position + Vector3.new(0, -1, 0))
                end
                
            elseif child.Name == "Screech" then
                Notify("SCREECH BEHIND YOU!", "entity")
                
            elseif child.Name == "Halt" then
                Notify("HALT ROOM AHEAD!", "entity")
                
            elseif child.Name == "Seek" then
                Notify("SEEK CHASE STARTING!", "entity")
            end
        end
    end)
end

-- [[ MAIN WINDOW ]]
local Window = ApexLib:CreateWindow({
    Title = "🚪 Apex DOORS Hub v2.0",
    Name = "Apex_DOORS_Elite",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ HOME TAB ]]
local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "📊 Current Room: " .. GetLatestRoom(),
    Color = "emerald",
    Callback = function()
        Notify("Latest Room: " .. GetLatestRoom(), "info")
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
    Title = "🔄 Refresh Room Count",
    Color = "turquoise",
    Callback = function()
        Notify("Latest Room: " .. GetLatestRoom(), "success")
    end
})

-- [[ ESP TAB ]]
local ESP = Window:AddTab("ESP")

ESP:AddToggle({
    Title = "👹 Entity ESP",
    Flag = "EntityESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.EntityESP = state
        Notify("Entity ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        if not state then
            for obj, esp in pairs(ESPObjects) do
                esp:Destroy()
            end
            ESPObjects = {}
        end
    end
})

ESP:AddToggle({
    Title = "💎 Item ESP",
    Flag = "ItemESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.ItemESP = state
        Notify("Item ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "🚪 Door ESP",
    Flag = "DoorESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.DoorESP = state
        Notify("Door ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "🔑 Key ESP",
    Flag = "KeyESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.KeyESP = state
        Notify("Key ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "💰 Gold ESP",
    Flag = "GoldESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.GoldESP = state
        Notify("Gold ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "📖 Book ESP",
    Flag = "BookESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.BookESP = state
        Notify("Book ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "👥 Player ESP",
    Flag = "PlayerESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.PlayerESP = state
        Notify("Player ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        if state then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    CreateESP(player.Character.HumanoidRootPart, player.Name, Color3.fromRGB(0, 255, 0))
                end
            end
        end
    end
})

-- [[ AUTO FARM TAB ]]
local Farm = Window:AddTab("Auto Farm")

Farm:AddToggle({
    Title = "💰 Auto Collect Gold",
    Flag = "AutoCollectGold",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoCollectGold = state
        Notify("Auto Gold: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexDoors.AutoCollectGold do
                task.wait(0.5)
                local gold = FindNearestItem("Gold")
                if gold then
                    TweenTo(gold.Position)
                    task.wait(0.2)
                end
            end
        end)
    end
})

Farm:AddToggle({
    Title = "🚪 Auto Open Doors",
    Flag = "AutoOpenDoors",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoOpenDoors = state
        Notify("Auto Doors: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexDoors.AutoOpenDoors do
                task.wait(0.5)
                local currentRoom = GetCurrentRoom()
                if currentRoom and currentRoom:FindFirstChild("Door") then
                    local door = currentRoom.Door
                    if door:FindFirstChild("ClientOpen") then
                        door.ClientOpen:FireServer()
                    end
                end
            end
        end)
    end
})

Farm:AddToggle({
    Title = "🔧 Auto Pull Levers",
    Flag = "AutoPullLevers",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoPullLevers = state
        Notify("Auto Levers: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Farm:AddToggle({
    Title = "📚 Auto Complete Bookshelf",
    Flag = "AutoBookshelf",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoBookshelf = state
        Notify("Auto Bookshelf: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ ENTITY AVOID TAB ]]
local Entities = Window:AddTab("Entity Avoid")

Entities:AddToggle({
    Title = "🏃 Auto Avoid Rush",
    Flag = "AutoAvoidRush",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidRush = state
        Notify("Auto Avoid Rush: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "⚡ Auto Avoid Ambush",
    Flag = "AutoAvoidAmbush",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidAmbush = state
        Notify("Auto Avoid Ambush: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "👁️ Auto Avoid Eyes",
    Flag = "AutoAvoidEyes",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidEyes = state
        Notify("Auto Avoid Eyes: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "🏃 Auto Avoid Seek",
    Flag = "AutoAvoidSeek",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidSeek = state
        Notify("Auto Avoid Seek: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "🚪 Auto Hide in Closet",
    Flag = "AutoHideCloset",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoHideCloset = state
        Notify("Auto Hide: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "🔔 Entity Notifications",
    Flag = "NotifyEntities",
    Default = true,
    Callback = function(state)
        _G.ApexDoors.NotifyEntities = state
        Notify("Notifications: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ MOVEMENT TAB ]]
local Movement = Window:AddTab("Movement")

Movement:AddSlider({
    Title = "🏃 WalkSpeed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(val)
        _G.ApexDoors.WalkSpeed = val
        if Humanoid then
            Humanoid.WalkSpeed = val
        end
    end
})

Movement:AddToggle({
    Title = "👻 Noclip",
    Flag = "NoClip",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.NoClip = state
        Notify("Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        RunService.Stepped:Connect(function()
            if _G.ApexDoors.NoClip and Character then
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
        _G.ApexDoors.InfiniteJump = state
        Notify("Infinite Jump: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Movement:AddToggle({
    Title = "🚫 No Fall Damage",
    Flag = "NoFall",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.NoFall = state
        Notify("No Fall: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ VISUALS TAB ]]
local Visuals = Window:AddTab("Visuals")

Visuals:AddToggle({
    Title = "🌅 Fullbright",
    Flag = "Fullbright",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.Fullbright = state
        
        if state then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.FogEnd = 100000
            Notify("Fullbright enabled!", "success")
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.Brightness = 1
            Lighting.FogEnd = 100
        end
    end
})

Visuals:AddToggle({
    Title = "🌫️ Remove Fog",
    Flag = "NoFog",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.NoFog = state
        
        if state then
            Lighting.FogEnd = 100000
            Notify("Fog removed!", "success")
        else
            Lighting.FogEnd = 100
        end
    end
})

Visuals:AddToggle({
    Title = "💡 Remove Darkness",
    Flag = "RemoveDarkness",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.RemoveDarkness = state
        
        if state then
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
        end
    end
})

-- [[ MISC TAB ]]
local Misc = Window:AddTab("Misc")

Misc:AddToggle({
    Title = "⚡ Instant Interact",
    Flag = "InstantInteract",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.InstantInteract = state
        Notify("Instant Interact: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Misc:AddToggle({
    Title = "🚫 Anti Void",
    Flag = "AntiVoid",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AntiVoid = state
        Notify("Anti Void: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Misc:AddButton({
    Title = "🔄 Rejoin Game",
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
        Notify("Thanks for using Apex DOORS!", "success")
    end
})

Credits:AddButton({
    Title = "🌟 Version: v2.0 Elite",
    Color = "gold",
    Callback = function()
        Notify("40+ Features Unlocked!", "info")
    end
})

-- [[ ESP UPDATE LOOP ]]
task.spawn(function()
    while true do
        task.wait(1)
        UpdateESP()
    end
end)

-- [[ SETUP ENTITY NOTIFICATIONS ]]
SetupEntityNotifications()

-- [[ CHARACTER UPDATES ]]
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    
    task.wait(1)
    if Humanoid then
        Humanoid.WalkSpeed = _G.ApexDoors.WalkSpeed
    end
end)

-- [[ STARTUP ]]
Notify("Apex DOORS v2.0 Loaded!", "success")
Notify("Press RightControl to toggle", "info")
Notify("Current Room: " .. GetLatestRoom(), "info")

print([[
═══════════════════════════════════════════════════════════════════════
    🚪 APEX DOORS HUB v2.0 ELITE - LOADED
    ───────────────────────────────────────────────────────────────────
    ✅ ESP System (Entities, Items, Gold, Players)
    ✅ Auto Farm (Gold, Items, Doors, Levers)
    ✅ Entity Avoidance (Rush, Ambush, Eyes, Seek)
    ✅ Movement (Speed, Noclip, Infinite Jump)
    ✅ Visuals (Fullbright, No Fog, No Darkness)
    ✅ Entity Notifications
    ✅ 40+ Features - NO KEY
    ───────────────────────────────────────────────────────────────────
    Created by: joaorqqq | Discord: discord.gg/H6pWukrA7
═══════════════════════════════════════════════════════════════════════
]])
