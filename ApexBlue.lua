--[[
    APEX EXECUTOR - BLUE EDITION (ELITE FULL)
    Powered by: Apex Elite Library v1 (Public)
    Add-ons: Combat, Visuals, Movement, TTS & Intro
    Desenvolvido por: joaorqqq
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- [[ VARIÁVEIS DE CONTROLE ]]
_G.AimbotEnabled = false
_G.AimbotSmoothness = 0.3
_G.ESPEnabled = false
_G.TeamCheck = true
_G.FlyEnabled = false
_G.NoclipEnabled = false
local FlySpeed = 50

-- [[ MOTOR DE VOZ HUMANA (A-PEX PRONUNCIATION) ]]
local function Say(text)
    if not game:GetService("SoundService"):FindFirstChild("ApexTTS") then
        local url = "https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=pt-br&q=" .. HttpService:UrlEncode(text)
        local sound = Instance.new("Sound", game:GetService("SoundService"))
        sound.Name = "ApexTTS"
        sound.SoundId = url
        sound.Volume = 0.5
        sound:Play()
        sound.Ended:Connect(function() sound:Destroy() end)
    end
end

-- [[ LÓGICA DE AIMBOT ]]
local function GetClosestPlayer()
    local shortestDistance = math.huge
    local closestPlayer = nil
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if _G.TeamCheck and v.Team == LocalPlayer.Team then continue end
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if _G.AimbotEnabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local lookAt = target.Character.Head.Position
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, lookAt), _G.AimbotSmoothness)
        end
    end
end)

-- [[ LÓGICA DE NOCLIP ]]
RunService.Stepped:Connect(function()
    if _G.NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then 
                part.CanCollide = false 
            end
        end
    end
end)

-- [[ INTRO COMPLETA (FADE FULLSCREEN) ]]
local function RunApexIntro()
    local sg = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 1000
    
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(1, 0, 1, 0)
    main.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
    main.BorderSizePixel = 0
    
    local glow = Instance.new("ImageLabel", main)
    glow.Size = UDim2.new(0, 0, 0, 0)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://13426210452"
    glow.ImageColor3 = Color3.fromRGB(0, 170, 255)
    glow.ImageTransparency = 0.5
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0.5, 0, 0.5, 0)
    title.AnchorPoint = Vector2.new(0.5, 0.5)
    title.BackgroundTransparency = 1
    title.Text = "APEX"
    title.Font = Enum.Font.Code
    title.TextSize = 100
    title.TextColor3 = Color3.new(1,1,1)
    title.TextTransparency = 1
    
    local grad = Instance.new("UIGradient", title)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    })

    task.spawn(function()
        Say("Welcome A-pex tool executor")
        TweenService:Create(title, TweenInfo.new(1.5), {TextTransparency = 0, TextSize = 130}):Play()
        TweenService:Create(glow, TweenInfo.new(1.5), {Size = UDim2.new(0, 800, 0, 800), ImageTransparency = 0.2}):Play()
        task.wait(3.5)
        TweenService:Create(main, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
        TweenService:Create(glow, TweenInfo.new(1), {ImageTransparency = 1}):Play()
        task.wait(1)
        sg:Destroy()
    end)
end

-- Iniciar Intro
RunApexIntro()

-- [[ CARREGAMENTO DA V1 PÚBLICA ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"))()
end)

if not Success then 
    warn("Failed to load ApexLib")
    return 
end

-- [[ CRIAÇÃO ÚNICA DA JANELA ]]
local Window = ApexLib:CreateWindow({
    Title = "ApexExecutor | Blue Edition 💙",
    Name = "Apex_Elite_v1",
    Keybind = Enum.KeyCode.RightControl 
})

-- [[ TABS ]]
local Home = Window:AddTab("Home")
local Combat = Window:AddTab("Combat")
local Visuals = Window:AddTab("Visuals")
local Player = Window:AddTab("Player")
local Scripts = Window:AddTab("Scripts")
local Settings = Window:AddTab("Settings")
local Info = Window:AddTab("Info")

-- [[ HOME TAB - SCRIPT EXECUTOR ]]
local scriptToExecute = ""

Home:AddInput({
    Title = "Script Editor",
    Placeholder = "Cole seu código aqui...",
    Height = 120,
    Callback = function(t) 
        scriptToExecute = t 
    end
})

Home:AddButton({
    Title = "EXECUTAR SCRIPT",
    Color = "blue",
    Callback = function()
        if scriptToExecute ~= "" then
            Say("Executing script")
            local success, err = pcall(function()
                loadstring(scriptToExecute)()
            end)
            if not success then
                warn("Script error:", err)
            end
        end
    end
})

-- [[ COMBAT TAB ]]
Combat:AddToggle({
    Title = "Aimbot Lock",
    Flag = "Aimbot",
    Callback = function(v) 
        _G.AimbotEnabled = v
        Say(v and "Aimbot on" or "Aimbot off") 
    end
})

Combat:AddSlider({
    Title = "Smoothness",
    Flag = "AimbotSmooth",
    Min = 1, 
    Max = 10, 
    Default = 3,
    Callback = function(v) 
        _G.AimbotSmoothness = v / 10 
    end
})

Combat:AddToggle({
    Title = "Team Check", 
    Flag = "TeamCheck",
    Default = true, 
    Callback = function(v) 
        _G.TeamCheck = v 
    end
})

-- [[ VISUALS TAB ]]
Visuals:AddToggle({
    Title = "ESP Highlight",
    Flag = "ESP",
    Callback = function(state)
        _G.ESPEnabled = state
        if state then
            task.spawn(function()
                while _G.ESPEnabled do
                    for _, v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and not v.Character:FindFirstChild("ApexESP") then
                            local h = Instance.new("Highlight", v.Character)
                            h.Name = "ApexESP"
                            h.FillColor = Color3.fromRGB(0, 120, 255)
                            h.OutlineTransparency = 0.5
                        end
                    end
                    task.wait(1)
                end
            end)
        else
            -- Remove all ESP
            for _, v in pairs(Players:GetPlayers()) do 
                if v.Character and v.Character:FindFirstChild("ApexESP") then 
                    v.Character.ApexESP:Destroy() 
                end 
            end
        end
    end
})

-- [[ PLAYER TAB ]]
Player:AddSlider({
    Title = "WalkSpeed", 
    Flag = "WalkSpeed",
    Min = 16, 
    Max = 500, 
    Default = 16, 
    Callback = function(v) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
            LocalPlayer.Character.Humanoid.WalkSpeed = v 
        end 
    end
})

Player:AddSlider({
    Title = "JumpPower", 
    Flag = "JumpPower",
    Min = 50, 
    Max = 300, 
    Default = 50, 
    Callback = function(v) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
            LocalPlayer.Character.Humanoid.JumpPower = v 
        end 
    end
})

Player:AddToggle({
    Title = "Noclip", 
    Flag = "Noclip",
    Callback = function(v) 
        _G.NoclipEnabled = v
        Say(v and "Noclip on" or "Noclip off") 
    end
})

-- [[ SCRIPTS TAB ]]
Scripts:AddButton({
    Title = "🌪️ FTAP Hub (5000km & Kick)",
    Color = "blue",
    Callback = function()
        Say("Loading FTAP Hub")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/FTAPHub.lua"))()
    end
})

Scripts:AddButton({
    Title = "☁️ Infinite Yield",
    Color = "navy",
    Callback = function()
        Say("Loading Infinite Yield")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
    end
})

Scripts:AddButton({
    Title = "🎯 Dark Dex V3",
    Color = "purple",
    Callback = function()
        Say("Loading Dark Dex")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
    end
})

-- [[ SETTINGS TAB ]]
Settings:AddButton({
    Title = "Rejoin Server",
    Color = "orange",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

Settings:AddButton({
    Title = "Server Hop (Low Players)",
    Color = "amber",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local servers = game:GetService("HttpService"):JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
        for _, server in pairs(servers.data) do
            if server.playing < server.maxPlayers - 5 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    end
})

-- [[ INFO TAB ]]
Info:AddButton({
    Title = "💙 Criador: joaorqqq",
    Color = "celeste",
    Callback = function() 
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            Say("Discord copied")
        end
    end
})

Info:AddButton({
    Title = "📋 Copy Discord Link",
    Color = "blue",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
        end
    end
})

print("✅ ApexExecutor Blue Edition loaded successfully!")
    task.spawn(function()
        Say("Welcome A-pex tool executor")
        TweenService:Create(title, TweenInfo.new(1.5), {TextTransparency = 0, TextSize = 130}):Play()
        TweenService:Create(glow, TweenInfo.new(1.5), {Size = UDim2.new(0, 800, 0, 800), ImageTransparency = 0.2}):Play()
        task.wait(3.5)
        TweenService:Create(main, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
        TweenService:Create(glow, TweenInfo.new(1), {ImageTransparency = 1}):Play()
        task.wait(1)
        sg:Destroy()
    end)
end

-- Iniciar Intro
RunApexIntro()

-- [[ CARREGAMENTO DA V1 PÚBLICA ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"))()
end)

if not Success then return end

local Window = ApexLib:CreateWindow({
    Title = "ApexExecutor | Blue Edition 💙",
    Name = "Apex_Elite_v1",
    Keybind = Enum.KeyCode.RightControl 
})

local Combat = Window:AddTab("Combat")
local Visuals = Window:AddTab("Visuals")
local PlayerTab = Window:AddTab("Player")
local Scripts = Window:AddTab("Scripts")

-- [[ COMBAT ]]
Combat:AddToggle({
    Title = "Aimbot Lock",
    Callback = function(v) _G.AimbotEnabled = v; Say(v and "Aimbot on" or "Aimbot off") end
})
Combat:AddSlider({
    Title = "Smoothness",
    Min = 1, Max = 10, Default = 3,
    Callback = function(v) _G.AimbotSmoothness = v/10 end
})
Combat:AddToggle({Title = "Team Check", Default = true, Callback = function(v) _G.TeamCheck = v end})

-- [[ VISUALS ]]
Visuals:AddToggle({
    Title = "ESP Highlight",
    Callback = function(state)
        _G.ESPEnabled = state
        task.spawn(function()
            while _G.ESPEnabled do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and not v.Character:FindFirstChild("ApexESP") then
                        local h = Instance.new("Highlight", v.Character)
                        h.Name = "ApexESP"; h.FillColor = Color3.fromRGB(0, 120, 255)
                    end
                end
                task.wait(1)
            end
            for _, v in pairs(Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("ApexESP") then v.Character.ApexESP:Destroy() end end
        end)
    end
})

-- [[ PLAYER MODS ]]
PlayerTab:AddSlider({Title = "WalkSpeed", Min = 16, Max = 500, Default = 16, Callback = function(v) if LocalPlayer.Character then LocalPlayer.Character.Humanoid.WalkSpeed = v end end})
PlayerTab:AddToggle({Title = "Noclip", Callback = function(v) _G.NoclipEnabled = v; Say(v and "Noclip on" or "Noclip off") end})
PlayerTab:AddToggle({Title = "Fly", Callback = function(v) _G.FlyEnabled = v; Say(v and "Fly on" or "Fly off") end})

-- [[ SCRIPTS TAB ]]
local scriptText = ""
Scripts:AddInput({Title = "Executor", Placeholder = "Script aqui...", Callback = function(t) scriptText = t end})
Scripts:AddButton({Title = "EXECUTAR", Color = "blue", Callback = function() if scriptText ~= "" then loadstring(scriptText)() end end})
Scripts:AddButton({Title = "🌪️ FTAP Hub", Color = "celeste", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/FTAPHub.lua"))() end})

print("Apex Elite carregado!")

local Window = ApexLib:CreateWindow({
    Title = "ApexExecutor | Blue Edition 💙",
    Name = "Apex_Main",
    Keybind = Enum.KeyCode.RightControl 
})

local Home = Window:AddTab("Home")
local Scripts = Window:AddTab("Scripts")
local Settings = Window:AddTab("Settings")

-- Home / Editor
local scriptToExecute = ""
Home:AddTextBox({
    Title = "Editor de Script",
    Placeholder = "Cole seu código aqui...",
    Height = 120,
    Callback = function(t) scriptToExecute = t end
})

Home:AddButton({
    Title = "EXECUTAR SCRIPT",
    Color = "blue",
    Callback = function()
        if scriptToExecute ~= "" then
            Say("Executing")
            pcall(loadstring(scriptToExecute))
        end
    end
})

-- Scripts Tab
Scripts:AddButton({
    Title = "🌪️ FTAP Hub (5000km & Kick)",
    Color = "blue",
    Callback = function()
        Say("Loading FTAP Hub")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/FTAPHub.lua"))()
    end
})

Scripts:AddButton({
    Title = "☁️ Infinite Yield",
    Color = "navy",
    Callback = function()
        Say("Loading Infinite Yield")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
    end
})

-- Settings Tab
Settings:AddSlider({
    Title = "WalkSpeed",
    Min = 16, Max = 350, Default = 16,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end
})

-- Info
local Info = Window:AddTab("Info")
Info:AddButton({
    Title = "Criador: joaorqqq",
    Callback = function() setclipboard("https://discord.gg/H6pWukrA7") end
})

print("ApexExecutor FULL carregado!")
