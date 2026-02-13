--[[
    APEX EXECUTOR - FINAL BLUE EDITION
    Recursos: Neon Intro, Glow Effect, TDS, Human TTS
    Desenvolvido por: joaorqqq
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- [[ MOTOR DE VOZ HUMANA (TTS) ]]
local function Say(text)
    local url = "https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=en-US&q=" .. game:GetService("HttpService"):UrlEncode(text)
    local sound = Instance.new("Sound", game:GetService("SoundService"))
    sound.SoundId = url
    sound.Volume = 3
    sound:Play()
    sound.Ended:Connect(function() sound:Destroy() end)
end

-- [[ INTRO COMPLETA COM NEON GLOW & TDS ]]
local function RunApexIntro()
    local sg = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    sg.Name = "ApexIntroUI"
    sg.DisplayOrder = 1000
    
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(1, 0, 1, 0)
    main.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
    main.ZIndex = 10
    
    -- Efeito de Brilho (Neon Glow) no fundo
    local glow = Instance.new("ImageLabel", main)
    glow.Name = "Glow"
    glow.Size = UDim2.new(0, 0, 0, 0)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://13426210452" -- Textura de luz suave
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
    title.TextTransparency = 1
    
    local grad = Instance.new("UIGradient", title)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    })
    
    local tds = Instance.new("TextLabel", main)
    tds.Size = UDim2.new(1, 0, 0.05, 0)
    tds.Position = UDim2.new(0.5, 0, 0.6, 0)
    tds.AnchorPoint = Vector2.new(0.5, 0.5)
    tds.BackgroundTransparency = 1
    tds.Text = "SYSTEM INITIALIZED: " .. os.date("%H:%M:%S")
    tds.Font = Enum.Font.SourceSansLight
    tds.TextSize = 20
    tds.TextColor3 = Color3.fromRGB(255, 255, 255)
    tds.TextTransparency = 1

    -- Sequência de Animação
    task.spawn(function()
        -- Entrada
        TweenService:Create(title, TweenInfo.new(1.5), {TextTransparency = 0, TextSize = 130}):Play()
        TweenService:Create(glow, TweenInfo.new(1.5), {Size = UDim2.new(0, 600, 0, 600), ImageTransparency = 0.2}):Play()
        Say("Welcome, Apex Tool Executor")
        
        task.wait(0.5)
        TweenService:Create(tds, TweenInfo.new(1), {TextTransparency = 0}):Play()
        
        -- Efeito de Pulsar Neon
        for i = 1, 3 do
            TweenService:Create(glow, TweenInfo.new(0.5), {ImageTransparency = 0.6}):Play()
            task.wait(0.5)
            TweenService:Create(glow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
            task.wait(0.5)
        end
        
        -- Saída
        TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
        TweenService:Create(tds, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
        TweenService:Create(main, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        TweenService:Create(glow, TweenInfo.new(1), {ImageTransparency = 1}):Play()
        task.wait(1.1)
        sg:Destroy()
    end)
end

-- Inicia o Caos
RunApexIntro()
task.wait(2)

-- [[ CARREGAMENTO DA INTERFACE ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/loader.lua"))()
end)

if not Success then return end

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
