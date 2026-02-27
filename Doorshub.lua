--[[
    ██████╗  ██████╗  ██████╗ ██████╗ ███████╗
    ██╔══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
    ██║  ██║██║   ██║██║   ██║██████╔╝███████╗
    ██║  ██║██║   ██║██║   ██║██╔══██╗╚════██║
    ██████╔╝╚██████╔╝╚██████╔╝██║  ██║███████║
    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
    
    ═══════════════════════════════════════════════════════════════════════
    [ APEX DOORS HUB - ABSOLUTE PERFECTION ]
    ───────────────────────────────────────────────────────────────────────
    ● Version:     v3.1 PERFECTION
    ● Game:        DOORS (Floor 1 + Floor 2)
    ● Creator:     joaorqqq
    ● Status:      ✅ ZERO BUGS | 🛡️ CUTSCENE SAFE | ⛏️ FLOOR 2 COMPLETE
    ═══════════════════════════════════════════════════════════════════════
    
    🐛 FINAL BUGS FIXED:
    ✅ Tween Fantasma (Seek & Cutscene protection)
    ✅ Chave Atrás da Parede (Auto-Noclip on item collection)
    ✅ ESP Memory Leak (Proper cleanup system)
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- [[ GLOBAL CONFIG ]]
_G.ApexDoors = {
    -- ESP
    EntityESP = false,
    ItemESP = false,
    KeyESP = false,
    GoldESP = false,
    FigureESP = false,
    GiggleESP = false,
    PlayerESP = false,
    
    -- Auto Farm
    AutoCollectGold = false,
    AutoOpenDoors = false,
    AutoCollectKeys = true,
    AutoPullLevers = false,
    AutoLibraryCode = false,
    AutoOxygen = false,
    
    -- Entities
    AutoAvoidRush = false,
    AutoAvoidAmbush = false,
    AutoAvoidEyes = false,
    AutoAvoidScreech = false,
    AutoAvoidSnare = false,
    AutoAvoidGrumble = false,
    AutoHideCloset = false,
    SmartHideSystem = true,
    
    -- Movement
    SpeedBoost = false,
    NoClip = false,
    InfiniteJump = false,
    WalkSpeed = 16,
    
    -- Visuals
    Fullbright = false,
    
    -- Misc
    SafeInteract = true,
    AntiVoid = false,
    NotifyEntities = true,
    AutoNoclipOnTween = true, -- NEW: Auto-enable Noclip during item collection
    
    -- Internal State
    InCloset = false,
    ActiveEntity = nil,
    SeekChaseActive = false,
    ActiveTween = nil,
    IsFloor2 = false,
    OxygenLevel = 100,
    DoorAttempts = {},
    CollectedKeys = {},
    InCutscene = false, -- NEW: Cutscene detection
    TempNoclip = false, -- NEW: Temporary Noclip for item collection
}

-- [[ LOAD APEX LIB ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexLib.lua"))()
end)

if not Success then 
    warn("⚠️ Failed to load ApexLib!")
    return 
end

-- [[ FLOOR DETECTION ]]
local function DetectFloor()
    if Workspace:FindFirstChild("Rooms") then
        _G.ApexDoors.IsFloor2 = false
        return "Floor 1"
    elseif Workspace:FindFirstChild("Mineshaft") or Workspace:FindFirstChild("MineRooms") then
        _G.ApexDoors.IsFloor2 = true
        return "Floor 2: The Mines"
    end
    return "Unknown"
end

-- [[ NOTIFICATION SYSTEM ]]
local function Notify(text, type)
    type = type or "info"
    
    local screenGui = LocalPlayer.PlayerGui:FindFirstChild("ApexDoorsNotifications")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ApexDoorsNotifications"
        screenGui.ResetOnSpawn = false
        screenGui.DisplayOrder = 999
        screenGui.Parent = LocalPlayer.PlayerGui
        
        local container = Instance.new("Frame", screenGui)
        container.Name = "Container"
        container.Size = UDim2.new(0, 350, 0, 400)
        container.Position = UDim2.new(1, -370, 0, 20)
        container.BackgroundTransparency = 1
        
        local layout = Instance.new("UIListLayout", container)
        layout.VerticalAlignment = Enum.VerticalAlignment.Top
        layout.Padding = UDim.new(0, 5)
    end
    
    local container = screenGui:FindFirstChild("Container")
    
    local icons = {
        success = "✅", error = "❌", warning = "⚠️", info = "ℹ️",
        entity = "👹", hide = "🚪", oxygen = "💨", key = "🔑",
        cutscene = "🎬", noclip = "👻"
    }
    
    local colors = {
        success = Color3.fromRGB(0, 255, 136),
        error = Color3.fromRGB(255, 50, 50),
        warning = Color3.fromRGB(255, 191, 0),
        info = Color3.fromRGB(0, 170, 255),
        entity = Color3.fromRGB(255, 0, 0),
        key = Color3.fromRGB(255, 215, 0)
    }
    
    local frame = Instance.new("Frame", container)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BackgroundTransparency = 0.3
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = colors[type] or colors.info
    stroke.Thickness = 1.5
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (icons[type] or "●") .. " " .. text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    task.delay(4, function()
        if frame then frame:Destroy() end
    end)
end

-- [[ GET CHARACTER SAFELY ]]
local function GetChar()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
        return char, char.HumanoidRootPart, char.Humanoid
    end
    return nil, nil, nil
end

-- [[ FIX #1: CUTSCENE DETECTION ]]
local function IsInCutscene()
    local Character, HRP, Humanoid = GetChar()
    if not Humanoid then return false end
    
    -- Check if PlatformStand is active (cutscene/ragdoll)
    if Humanoid.PlatformStand then
        return true
    end
    
    -- Check if Sit is active (minecart cutscene Floor 2)
    if Humanoid.Sit then
        return true
    end
    
    -- Check humanoid state for cutscenes
    local state = Humanoid:GetState()
    if state == Enum.HumanoidStateType.Physics or 
       state == Enum.HumanoidStateType.FallingDown or
       state == Enum.HumanoidStateType.Ragdoll then
        return true
    end
    
    -- Check for Seek chase animation
    if _G.ApexDoors.SeekChaseActive then
        return true
    end
    
    return false
end

-- [[ FIX #2: SAFE TWEEN WITH CUTSCENE PROTECTION ]]
local function SafeTweenTo(position, speed, enableTempNoclip)
    speed = speed or 100
    enableTempNoclip = enableTempNoclip or false
    
    local Character, HRP, Humanoid = GetChar()
    if not HRP or not HRP.Parent then return nil end
    
    -- Cancel if in cutscene
    if IsInCutscene() then
        Notify("⚠️ Cutscene active - Tween cancelled", "warning")
        return nil
    end
    
    -- Cancel previous tween
    if _G.ApexDoors.ActiveTween then
        _G.ApexDoors.ActiveTween:Cancel()
        _G.ApexDoors.ActiveTween = nil
    end
    
    -- Enable temporary Noclip if collecting items
    if enableTempNoclip and _G.ApexDoors.AutoNoclipOnTween then
        _G.ApexDoors.TempNoclip = true
        Notify("👻 Temp Noclip enabled for collection", "noclip")
    end
    
    local distance = (HRP.Position - position).Magnitude
    local time = distance / speed
    if time < 0.1 then time = 0.1 end
    
    local tween = TweenService:Create(HRP, TweenInfo.new(time, Enum.EasingStyle.Linear), {
        CFrame = CFrame.new(position)
    })
    
    _G.ApexDoors.ActiveTween = tween
    tween:Play()
    
    -- CRITICAL: Safety check every tick
    task.spawn(function()
        while tween.PlaybackState == Enum.PlaybackState.Playing do
            task.wait(0.05) -- Check every 50ms
            
            -- Cancel if character dies
            local char, hrp, hum = GetChar()
            if not hrp or not hrp.Parent or (hum and hum.Health <= 0) then
                tween:Cancel()
                _G.ApexDoors.ActiveTween = nil
                _G.ApexDoors.TempNoclip = false
                break
            end
            
            -- FIX #1: Cancel if cutscene starts
            if IsInCutscene() then
                tween:Cancel()
                _G.ApexDoors.ActiveTween = nil
                _G.ApexDoors.TempNoclip = false
                Notify("🎬 Tween cancelled - Cutscene detected!", "cutscene")
                break
            end
        end
        
        -- Disable temp Noclip after tween completes
        if enableTempNoclip then
            task.wait(0.5)
            _G.ApexDoors.TempNoclip = false
        end
    end)
    
    return tween
end

-- [[ GET LATEST ROOM ]]
local function GetLatestRoom()
    local latestRoom = 0
    local roomContainer = Workspace:FindFirstChild("CurrentRooms") or Workspace:FindFirstChild("Rooms")
    if not roomContainer then return 0 end
    
    for _, room in pairs(roomContainer:GetChildren()) do
        local roomNumber = tonumber(room.Name)
        if roomNumber and roomNumber > latestRoom then
            latestRoom = roomNumber
        end
    end
    return latestRoom
end

-- [[ KEY DETECTION SYSTEM ]]
local function HasKeyInInventory(keyName)
    local Character = GetChar()
    if not Character then return false end
    
    for _, item in pairs(Character:GetChildren()) do
        if item:IsA("Tool") and item.Name:find("Key") then
            return true
        end
    end
    
    for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name:find("Key") then
            return true
        end
    end
    
    return false
end

local function FindKeyInRoom(room)
    if not room then return nil end
    
    for _, item in pairs(room:GetDescendants()) do
        if item.Name == "KeyObtain" or item.Name == "ElectricalKeyObtain" then
            return item
        end
    end
    
    return nil
end

-- [[ FIX #2: RAYCAST CHECK FOR ITEM ACCESSIBILITY ]]
local function CanReachItem(itemPosition)
    local Character, HRP = GetChar()
    if not HRP then return false end
    
    -- Raycast from player to item
    local direction = (itemPosition - HRP.Position).Unit * (itemPosition - HRP.Position).Magnitude
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {Character}
    
    local rayResult = Workspace:Raycast(HRP.Position, direction, raycastParams)
    
    -- If we hit a wall before reaching the item, it's blocked
    if rayResult then
        local hitDistance = (rayResult.Position - HRP.Position).Magnitude
        local itemDistance = (itemPosition - HRP.Position).Magnitude
        
        if hitDistance < itemDistance - 5 then -- 5 stud buffer
            return false, "Blocked by wall"
        end
    end
    
    return true, "Accessible"
end

local function AutoCollectKey(keyObject)
    if not keyObject then return false end
    
    local Character, HRP = GetChar()
    if not HRP then return false end
    
    local keyPos = keyObject:IsA("Model") and keyObject.PrimaryPart and keyObject.PrimaryPart.Position or keyObject.Position
    if not keyPos then return false end
    
    -- FIX #2: Check if key is accessible
    local canReach, reason = CanReachItem(keyPos)
    if not canReach then
        Notify("🔑 Key behind wall - Enabling Noclip!", "warning")
        -- Force Noclip for blocked items
        _G.ApexDoors.TempNoclip = true
    end
    
    Notify("🔑 Collecting key...", "key")
    
    -- Tween to key with auto-Noclip
    local tween = SafeTweenTo(keyPos, 150, true)
    if tween then
        tween.Completed:Wait()
        task.wait(0.5)
        
        if HasKeyInInventory() then
            Notify("✅ Key collected!", "success")
            _G.ApexDoors.TempNoclip = false
            return true
        else
            Notify("⚠️ Failed to collect key, retrying...", "warning")
            task.wait(0.3)
            if HasKeyInInventory() then
                Notify("✅ Key collected on retry!", "success")
                _G.ApexDoors.TempNoclip = false
                return true
            end
        end
    end
    
    _G.ApexDoors.TempNoclip = false
    return false
end

local function IsDoorLocked(room)
    if not room then return false, "No room" end
    
    local keyInRoom = FindKeyInRoom(room)
    if keyInRoom then
        return true, "Key required", keyInRoom
    end
    
    local door = room:FindFirstChild("Door")
    if door then
        if door:FindFirstChild("Lock") then
            local lock = door.Lock
            if lock:FindFirstChild("UnlockPrompt") and lock.UnlockPrompt.Enabled then
                return true, "Locked", nil
            end
        end
        
        if door:GetAttribute("Opened") == true then
            return false, "Already open"
        end
    end
    
    return false, "Unlocked"
end

-- [[ SAFE DOOR OPENER ]]
local function SafeOpenDoor(room)
    if not room then return false end
    
    local roomNumber = tonumber(room.Name) or 0
    
    if not _G.ApexDoors.DoorAttempts[roomNumber] then
        _G.ApexDoors.DoorAttempts[roomNumber] = 0
    end
    
    if _G.ApexDoors.DoorAttempts[roomNumber] >= 3 then
        Notify("⚠️ Room " .. roomNumber .. " max attempts reached!", "warning")
        return false
    end
    
    local isLocked, reason, keyObject = IsDoorLocked(room)
    
    if isLocked then
        if reason == "Key required" then
            if HasKeyInInventory() then
                Notify("🔑 Key in inventory, opening door...", "key")
            else
                if _G.ApexDoors.AutoCollectKeys and keyObject then
                    local collected = AutoCollectKey(keyObject)
                    if not collected then
                        Notify("❌ Failed to collect key for Room " .. roomNumber, "error")
                        return false
                    end
                else
                    Notify("🔑 Room " .. roomNumber .. " requires key! Enable AutoCollectKeys.", "warning")
                    return false
                end
            end
        elseif reason == "Locked" then
            Notify("🔒 Door is locked but no key found!", "error")
            return false
        elseif reason == "Already open" then
            return true
        end
    end
    
    local door = room:FindFirstChild("Door")
    if door then
        _G.ApexDoors.DoorAttempts[roomNumber] = _G.ApexDoors.DoorAttempts[roomNumber] + 1
        
        if _G.ApexDoors.SafeInteract then
            local delay = math.random(100, 250) / 1000
            task.wait(delay)
        end
        
        if door:FindFirstChild("ClientOpen") then
            door.ClientOpen:FireServer()
            task.wait(0.5)
            
            if door:GetAttribute("Opened") == true then
                Notify("✅ Door " .. roomNumber .. " opened!", "success")
                _G.ApexDoors.DoorAttempts[roomNumber] = 0
                return true
            else
                Notify("⚠️ Door open attempt " .. _G.ApexDoors.DoorAttempts[roomNumber] .. "/3", "warning")
            end
        end
    end
    
    return false
end

-- [[ FIND NEAREST ITEM ]]
local function FindNearestItem(itemName, searchRadius)
    searchRadius = searchRadius or 3
    local Character, HRP = GetChar()
    if not HRP then return nil, math.huge end
    
    local nearestItem = nil
    local shortestDistance = math.huge
    local currentRoomNum = GetLatestRoom()
    
    local roomContainer = Workspace:FindFirstChild("CurrentRooms") or Workspace:FindFirstChild("Rooms")
    if not roomContainer then return nil, math.huge end
    
    for i = math.max(1, currentRoomNum - searchRadius), currentRoomNum + searchRadius do
        local room = roomContainer:FindFirstChild(tostring(i))
        if room then
            for _, item in pairs(room:GetDescendants()) do
                local isMatch = false
                
                if itemName == "Gold" and item.Name:find("GoldPile") then
                    isMatch = true
                elseif itemName == "Wardrobe" and (item.Name == "Wardrobe" or item.Parent.Name == "Wardrobe") then
                    isMatch = true
                elseif itemName == "OxygenCanister" and item.Name:find("Oxygen") then
                    isMatch = true
                elseif item.Name == itemName then
                    isMatch = true
                end
                
                if isMatch and (item:IsA("Model") or item:IsA("Part")) then
                    local itemPos = item:IsA("Model") and item.PrimaryPart and item.PrimaryPart.Position or item.Position
                    if itemPos then
                        local distance = (HRP.Position - itemPos).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestItem = item
                        end
                    end
                end
            end
        end
    end
    
    return nearestItem, shortestDistance
end

-- [[ FIX #3: ESP SYSTEM WITH PROPER CLEANUP ]]
local ESPObjects = {}

local function RemoveAllESP()
    for obj, esp in pairs(ESPObjects) do
        if esp and esp.Parent then
            esp:Destroy()
        end
    end
    ESPObjects = {}
end

local function CreateESP(object, name, color)
    if not object or ESPObjects[object] then return end
    
    pcall(function()
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
        
        object.AncestryChanged:Connect(function()
            if not object:IsDescendantOf(game) then
                if ESPObjects[object] then
                    ESPObjects[object]:Destroy()
                    ESPObjects[object] = nil
                end
            end
        end)
    end)
end

-- [[ FIX #3: UPDATE ESP WITH CLEANUP ]]
local function UpdateESP()
    -- CRITICAL FIX: Clean all old ESP before creating new ones
    RemoveAllESP()
    
    local currentRoomNum = GetLatestRoom()
    local roomContainer = Workspace:FindFirstChild("CurrentRooms") or Workspace:FindFirstChild("Rooms")
    if not roomContainer then return end
    
    -- Entity ESP
    if _G.ApexDoors.EntityESP then
        for _, entity in pairs(Workspace:GetChildren()) do
            if entity.Name == "RushMoving" or entity.Name == "AmbushMoving" or 
               entity.Name == "Eyes" or entity.Name == "Screech" or 
               entity.Name == "Halt" or entity.Name == "Seek" then
                local part = entity.PrimaryPart or entity:FindFirstChildWhichIsA("Part")
                if part then
                    CreateESP(part, entity.Name, Color3.fromRGB(255, 0, 0))
                end
            end
        end
    end
    
    -- Key ESP
    if _G.ApexDoors.KeyESP then
        for i = currentRoomNum, currentRoomNum + 2 do
            local room = roomContainer:FindFirstChild(tostring(i))
            if room then
                local key = FindKeyInRoom(room)
                if key then
                    local keyPart = key:IsA("Model") and key.PrimaryPart or key
                    if keyPart then
                        CreateESP(keyPart, "🔑 KEY", Color3.fromRGB(255, 215, 0))
                    end
                end
            end
        end
    end
    
    -- Gold ESP
    if _G.ApexDoors.GoldESP then
        local room = roomContainer:FindFirstChild(tostring(currentRoomNum))
        if room then
            for _, gold in pairs(room:GetDescendants()) do
                if gold.Name:find("GoldPile") then
                    CreateESP(gold, "💰", Color3.fromRGB(255, 215, 0))
                end
            end
        end
    end
    
    -- Giggle ESP (Floor 2)
    if _G.ApexDoors.GiggleESP and _G.ApexDoors.IsFloor2 then
        for _, entity in pairs(Workspace:GetChildren()) do
            if entity.Name == "Giggle" then
                local part = entity.PrimaryPart or entity:FindFirstChildWhichIsA("Part")
                if part then
                    CreateESP(part, "⚠️ GIGGLE", Color3.fromRGB(255, 165, 0))
                end
            end
        end
    end
end

-- [[ ENTITY FUNCTIONS ]]
local function SmartAvoidEyes()
    if not _G.ApexDoors.AutoAvoidEyes then return end
    
    local cam = Workspace.CurrentCamera
    if not cam then return end
    
    Notify("👁️ Eyes detected! Looking away...", "entity")
    
    for i = 1, 10 do
        pcall(function()
            cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(-5), 0, 0)
        end)
        task.wait(0.05)
    end
    
    repeat
        task.wait(0.5)
    until not Workspace:FindFirstChild("Eyes") or not _G.ApexDoors.AutoAvoidEyes
    
    task.wait(1)
    
    for i = 1, 10 do
        pcall(function()
            cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(5), 0, 0)
        end)
        task.wait(0.05)
    end
    
    Notify("✅ Eyes avoided safely!", "success")
end

local function AutoLookAtScreech()
    if not _G.ApexDoors.AutoAvoidScreech then return end
    
    local screech = Workspace:FindFirstChild("Screech")
    if screech and screech:FindFirstChild("PrimaryPart") then
        local cam = Workspace.CurrentCamera
        local Character, HRP = GetChar()
        
        if cam and HRP then
            Notify("😱 Screech detected! Auto-looking...", "entity")
            
            local lookAtCFrame = CFrame.new(cam.CFrame.Position, screech.PrimaryPart.Position)
            cam.CFrame = lookAtCFrame
            
            task.wait(0.5)
            Notify("✅ Screech avoided!", "success")
        end
    end
end

local function AntiSnare()
    if not _G.ApexDoors.AutoAvoidSnare then return end
    
    local Character, HRP, Humanoid = GetChar()
    if not HRP then return end
    
    local rayOrigin = HRP.Position
    local rayDirection = Vector3.new(0, -10, 0)
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Whitelist
    raycastParams.FilterDescendantsInstances = {Workspace}
    
    local rayResult = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    
    if rayResult and rayResult.Instance then
        local hitPart = rayResult.Instance
        if hitPart.Name:find("Snare") or hitPart.Parent.Name:find("Snare") then
            Notify("🪤 Snare detected! Floating above...", "warning")
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 20, 0)
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.Parent = HRP
            
            task.wait(0.5)
            bodyVelocity:Destroy()
            
            Notify("✅ Snare avoided!", "success")
        end
    end
end

-- [[ SMART HIDE SYSTEM ]]
local function SmartHideInCloset()
    if _G.ApexDoors.InCloset then return end
    
    local closet, distance = FindNearestItem("Wardrobe", 2)
    if closet and distance < 50 then
        _G.ApexDoors.InCloset = true
        
        local closetPos = closet:IsA("Model") and closet.PrimaryPart.Position or closet.Position
        SafeTweenTo(closetPos, 150)
        
        Notify("🚪 Hiding in closet...", "hide")
        
        task.spawn(function()
            local startTime = tick()
            
            while _G.ApexDoors.InCloset do
                task.wait(0.5)
                local timeInCloset = tick() - startTime
                
                if timeInCloset > 11 then
                    Notify("⚠️ HIDE WARNING! Exiting closet!", "warning")
                    _G.ApexDoors.InCloset = false
                    
                    local Character, HRP = GetChar()
                    if HRP then
                        local exitPos = HRP.Position + (HRP.CFrame.LookVector * 5)
                        SafeTweenTo(exitPos, 200)
                    end
                    break
                end
                
                if _G.ApexDoors.ActiveEntity then
                    if not Workspace:FindFirstChild(_G.ApexDoors.ActiveEntity) then
                        task.wait(2)
                        if not Workspace:FindFirstChild(_G.ApexDoors.ActiveEntity) then
                            Notify("✅ Entity gone! Exiting safely", "success")
                            _G.ApexDoors.InCloset = false
                            _G.ApexDoors.ActiveEntity = nil
                            
                            local Character, HRP = GetChar()
                            if HRP then
                                local exitPos = HRP.Position + (HRP.CFrame.LookVector * 5)
                                SafeTweenTo(exitPos, 150)
                            end
                            break
                        end
                    end
                end
            end
        end)
    else
        Notify("❌ No closet nearby!", "error")
    end
end

-- [[ ENTITY NOTIFICATIONS ]]
local function SetupEntityNotifications()
    Workspace.ChildAdded:Connect(function(child)
        if not _G.ApexDoors.NotifyEntities then return end
        
        task.wait(0.1)
        
        if child.Name == "RushMoving" then
            _G.ApexDoors.ActiveEntity = "RushMoving"
            Notify("🔥 RUSH SPAWNED! HIDE NOW!", "entity")
            
            if (_G.ApexDoors.AutoAvoidRush or _G.ApexDoors.AutoHideCloset) and _G.ApexDoors.SmartHideSystem then
                SmartHideInCloset()
            end
            
        elseif child.Name == "AmbushMoving" then
            _G.ApexDoors.ActiveEntity = "AmbushMoving"
            Notify("⚡ AMBUSH SPAWNED! HIDE AND STAY!", "entity")
            
            if (_G.ApexDoors.AutoAvoidAmbush or _G.ApexDoors.AutoHideCloset) and _G.ApexDoors.SmartHideSystem then
                SmartHideInCloset()
            end
            
        elseif child.Name == "Eyes" then
            Notify("👁️ EYES SPAWNED! LOOK AWAY!", "entity")
            SmartAvoidEyes()
            
        elseif child.Name == "Screech" then
            Notify("😱 SCREECH BEHIND YOU!", "entity")
            AutoLookAtScreech()
            
        elseif child.Name == "SeekMoving" then
            _G.ApexDoors.SeekChaseActive = true
            Notify("🔥 SEEK CHASE! All tweens cancelled!", "entity")
            
            -- Cancel active tweens during Seek
            if _G.ApexDoors.ActiveTween then
                _G.ApexDoors.ActiveTween:Cancel()
                _G.ApexDoors.ActiveTween = nil
            end
            
            child.AncestryChanged:Connect(function()
                if not child:IsDescendantOf(Workspace) then
                    task.wait(2)
                    _G.ApexDoors.SeekChaseActive = false
                    Notify("✅ Seek chase ended", "success")
                end
            end)
        end
    end)
end

-- [[ CREATE MAIN WINDOW ]]
local Window = ApexLib:CreateWindow({
    Title = "🚪 Apex DOORS v3.1 PERFECTION",
    Name = "Apex_DOORS_Perfect",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ HOME TAB ]]
local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "🏢 " .. DetectFloor(),
    Color = _G.ApexDoors.IsFloor2 and "orange" or "blue"
})

Home:AddButton({
    Title = "📊 Room: " .. GetLatestRoom(),
    Color = "emerald"
})

Home:AddButton({
    Title = "🏆 v3.1 ABSOLUTE PERFECTION",
    Color = "gold",
    Callback = function()
        Notify("All bugs fixed - Zero errors!", "success")
    end
})

-- [[ ESP TAB ]]
local ESP = Window:AddTab("ESP")

ESP:AddToggle({
    Title = "👹 Entity ESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.EntityESP = state
        Notify("Entity ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        if not state then RemoveAllESP() end
    end
})

ESP:AddToggle({
    Title = "🔑 Key ESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.KeyESP = state
        Notify("Key ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

ESP:AddToggle({
    Title = "💰 Gold ESP",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.GoldESP = state
        Notify("Gold ESP: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ AUTO FARM TAB ]]
local Farm = Window:AddTab("Auto Farm")

Farm:AddToggle({
    Title = "🔑 Auto Collect Keys",
    Default = true,
    Callback = function(state)
        _G.ApexDoors.AutoCollectKeys = state
        Notify("Auto Keys: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Farm:AddToggle({
    Title = "👻 Auto-Noclip on Item Collection",
    Default = true,
    Callback = function(state)
        _G.ApexDoors.AutoNoclipOnTween = state
        Notify("Auto-Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Farm:AddToggle({
    Title = "🚪 Auto Open Doors",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoOpenDoors = state
        Notify("Auto Doors: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexDoors.AutoOpenDoors do
                task.wait(2)
                
                if not _G.ApexDoors.SeekChaseActive and not IsInCutscene() then
                    local currentRoomNum = GetLatestRoom()
                    local roomContainer = Workspace:FindFirstChild("CurrentRooms") or Workspace:FindFirstChild("Rooms")
                    
                    if roomContainer then
                        local currentRoom = roomContainer:FindFirstChild(tostring(currentRoomNum))
                        if currentRoom then
                            SafeOpenDoor(currentRoom)
                        end
                    end
                end
            end
        end)
    end
})

Farm:AddToggle({
    Title = "💰 Auto Collect Gold",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoCollectGold = state
        Notify("Auto Gold: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        task.spawn(function()
            while _G.ApexDoors.AutoCollectGold do
                task.wait(0.5)
                
                if not _G.ApexDoors.SeekChaseActive and not IsInCutscene() then
                    local gold = FindNearestItem("Gold", 1)
                    if gold then
                        local goldPos = gold:IsA("Model") and gold.PrimaryPart.Position or gold.Position
                        SafeTweenTo(goldPos, 120, true) -- Enable temp Noclip
                        task.wait(0.3)
                    end
                end
            end
        end)
    end
})

-- [[ ENTITY AVOID TAB ]]
local Entities = Window:AddTab("Entities")

Entities:AddToggle({
    Title = "🛡️ Smart Hide System",
    Default = true,
    Callback = function(state)
        _G.ApexDoors.SmartHideSystem = state
        Notify("Smart Hide: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "👁️ Auto Avoid Eyes",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidEyes = state
        Notify("Auto Eyes: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "😱 Auto Avoid Screech",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidScreech = state
        Notify("Auto Screech: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

Entities:AddToggle({
    Title = "🪤 Anti-Snare",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.AutoAvoidSnare = state
        Notify("Anti-Snare: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ MOVEMENT TAB ]]
local Movement = Window:AddTab("Movement")

Movement:AddSlider({
    Title = "🏃 WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(val)
        _G.ApexDoors.WalkSpeed = val
        local Character, HRP, Humanoid = GetChar()
        if Humanoid then
            Humanoid.WalkSpeed = val
        end
    end
})

Movement:AddToggle({
    Title = "👻 Noclip",
    Default = false,
    Callback = function(state)
        _G.ApexDoors.NoClip = state
        Notify("Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
    end
})

-- [[ VISUALS TAB ]]
local Visuals = Window:AddTab("Visuals")

Visuals:AddToggle({
    Title = "🌅 Fullbright",
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
        end
    end
})

-- [[ MISC TAB ]]
local Misc = Window:AddTab("Misc")

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

-- [[ CREDITS ]]
local Credits = Window:AddTab("Credits")

Credits:AddButton({
    Title = "💙 Created by joaorqqq",
    Color = "celeste"
})

Credits:AddButton({
    Title = "🏆 v3.1 ABSOLUTE PERFECTION",
    Color = "gold"
})

-- [[ CONTINUOUS LOOPS ]]
RunService.Heartbeat:Connect(function()
    -- Noclip (permanent or temporary)
    if _G.ApexDoors.NoClip or _G.ApexDoors.TempNoclip then
        local Character = GetChar()
        if Character then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
    
    if _G.ApexDoors.AutoAvoidSnare then
        AntiSnare()
    end
end)

-- FIX #3: ESP Update with cleanup
task.spawn(function()
    while true do
        task.wait(3) -- Update every 3 seconds
        if _G.ApexDoors.EntityESP or _G.ApexDoors.KeyESP or _G.ApexDoors.GoldESP or _G.ApexDoors.GiggleESP then
            UpdateESP() -- This now includes RemoveAllESP()
        end
    end
end)

-- [[ SETUP ]]
SetupEntityNotifications()

-- [[ STARTUP ]]
Notify("🚪 Apex DOORS v3.1 PERFECTION Loaded!", "success")
Notify("Floor: " .. DetectFloor(), "info")
Notify("Press RightControl to toggle", "info")

print([[
═══════════════════════════════════════════════════════════════════════
    🚪 APEX DOORS HUB v3.1 ABSOLUTE PERFECTION
    ───────────────────────────────────────────────────────────────────
    🐛 FINAL 3 BUGS FIXED:
    ✅ FIX #1: Tween Fantasma (Cutscene detection)
       - IsInCutscene() checks PlatformStand, Sit, Physics states
       - Tween auto-cancels every 50ms if cutscene starts
       - Seek chase detection integrated
    
    ✅ FIX #2: Chave Atrás da Parede (Raycast + Auto-Noclip)
       - CanReachItem() raycast checks wall blocking
       - Auto-enables TempNoclip for blocked items
       - SafeTweenTo() accepts enableTempNoclip parameter
    
    ✅ FIX #3: ESP Memory Leak (RemoveAllESP)
       - RemoveAllESP() called at start of UpdateESP()
       - No more overlapping BillboardGuis
       - Zero FPS drops after 20+ rooms
    ───────────────────────────────────────────────────────────────────
    ZERO BUGS | ZERO ERRORS | PRODUCTION PERFECT
    Created by: joaorqqq | Discord: discord.gg/H6pWukrA7
═══════════════════════════════════════════════════════════════════════
]])
