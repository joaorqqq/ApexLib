--[[
    ██████╗ ██████╗ ███████╗██╗  ██╗    ███████╗██╗  ██╗███████╗ ██████╗
    ██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚██╗██╔╝██╔════╝██╔════╝
    ███████║██████╔╝█████╗   ╚███╔╝     █████╗   ╚███╔╝ █████╗  ██║     
    ██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ██╔══╝   ██╔██╗ ██╔══╝  ██║     
    ██║  ██║██║     ███████╗██╔╝ ██╗    ███████╗██╔╝ ██╗███████╗╚██████╗
    ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝
    
    ═══════════════════════════════════════════════════════════════════════
    [ APEX UNIVERSAL EXECUTOR - FIXED FOR ARCEUS X ]
    ───────────────────────────────────────────────────────────────────────
    ● Executor:    Arceus X
    ● Fixed URL:   refs/heads/main/ApexLib.lua
    ● Status:      ✅ WORKING
    ═══════════════════════════════════════════════════════════════════════
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ CORRECT APEX LIB URL ]]
local ApexLib
local Success, Error = pcall(function()
    ApexLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexLib.lua"))()
end)

if not Success then
    warn("⚠️ Failed to load ApexLib: " .. tostring(Error))
    
    -- Try alternative method for Arceus X
    local altSuccess, altError = pcall(function()
        local response = game:HttpGetAsync("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexLib.lua")
        ApexLib = loadstring(response)()
    end)
    
    if not altSuccess then
        warn("⚠️ Alternative method also failed: " .. tostring(altError))
        
        -- Create error notification
        local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
        screenGui.Name = "ApexError"
        
        local frame = Instance.new("Frame", screenGui)
        frame.Size = UDim2.new(0, 400, 0, 200)
        frame.Position = UDim2.new(0.5, -200, 0.5, -100)
        frame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        Instance.new("UICorner", frame)
        
        local title = Instance.new("TextLabel", frame)
        title.Size = UDim2.new(1, 0, 0.3, 0)
        title.BackgroundTransparency = 1
        title.Text = "❌ APEX LIBRARY ERROR"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 18
        
        local message = Instance.new("TextLabel", frame)
        message.Size = UDim2.new(1, -20, 0.7, 0)
        message.Position = UDim2.new(0, 10, 0.3, 0)
        message.BackgroundTransparency = 1
        message.Text = "Failed to load ApexLib from GitHub.\n\nPossible fixes:\n1. Check your internet\n2. Restart Arceus X\n3. Try embedded version\n\nError: " .. tostring(Error)
        message.TextColor3 = Color3.new(1, 1, 1)
        message.Font = Enum.Font.Gotham
        message.TextSize = 12
        message.TextWrapped = true
        message.TextYAlignment = Enum.TextYAlignment.Top
        
        return
    end
end

print("✅ Apex Library Loaded Successfully!")

-- [[ NOTIFICATION SYSTEM ]]
local function Notify(text, type)
    type = type or "info"
    
    local screenGui = LocalPlayer.PlayerGui:FindFirstChild("ApexNotifications")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ApexNotifications"
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
        success = "✅",
        error = "❌",
        warning = "⚠️",
        info = "ℹ️"
    }
    
    local colors = {
        success = Color3.fromRGB(0, 255, 136),
        error = Color3.fromRGB(255, 50, 50),
        warning = Color3.fromRGB(255, 191, 0),
        info = Color3.fromRGB(0, 170, 255)
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

-- [[ CREATE MAIN WINDOW ]]
local Window = ApexLib:CreateWindow({
    Title = "⚡ Apex Universal Executor",
    Name = "Apex_Executor_Fixed",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ HOME TAB ]]
local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "✅ Apex Library Loaded!",
    Color = "emerald",
    Callback = function()
        Notify("Apex is working perfectly!", "success")
    end
})

Home:AddButton({
    Title = "👤 User: " .. LocalPlayer.Name,
    Color = "blue",
    Callback = function()
        Notify("Welcome, " .. LocalPlayer.Name, "info")
    end
})

Home:AddButton({
    Title = "🎮 Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    Color = "purple",
    Callback = function()
        Notify("PlaceId: " .. game.PlaceId, "info")
    end
})

-- [[ GAME HUBS TAB ]]
local Hubs = Window:AddTab("Game Hubs")

Hubs:AddButton({
    Title = "🌪️ Load FTAP Hub",
    Color = "blue",
    Callback = function()
        Notify("Loading FTAP Hub...", "info")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/FTAPHub.lua"))()
        end)
        if success then
            Notify("FTAP Hub Loaded!", "success")
        else
            Notify("Failed to load FTAP Hub", "error")
        end
    end
})

Hubs:AddButton({
    Title = "👻 Load Ghost Hub",
    Color = "purple",
    Callback = function()
        Notify("Loading Ghost Hub...", "info")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/Ghosthub.lua"))()
        end)
        if success then
            Notify("Ghost Hub Loaded!", "success")
        else
            Notify("Failed to load Ghost Hub", "error")
        end
    end
})

Hubs:AddButton({
    Title = "🚪 Load DOORS Hub",
    Color = "graphite",
    Callback = function()
        Notify("Loading DOORS Hub...", "info")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/DoorsHub.lua"))()
        end)
        if success then
            Notify("DOORS Hub Loaded!", "success")
        else
            Notify("Failed to load DOORS Hub", "error")
        end
    end
})

Hubs:AddButton({
    Title = "👋 Load Slap Battles Hub",
    Color = "orange",
    Callback = function()
        Notify("Loading Slap Battles Hub...", "info")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/SlapBattlesHub.lua"))()
        end)
        if success then
            Notify("Slap Battles Hub Loaded!", "success")
        else
            Notify("Failed to load Slap Battles Hub", "error")
        end
    end
})

Hubs:AddButton({
    Title = "🌊 Load Meme Sea Hub",
    Color = "turquoise",
    Callback = function()
        Notify("Loading Meme Sea Hub...", "info")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/MemeSeaHub.lua"))()
        end)
        if success then
            Notify("Meme Sea Hub Loaded!", "success")
        else
            Notify("Failed to load Meme Sea Hub", "error")
        end
    end
})

Hubs:AddButton({
    Title = "🔄 Auto-Detect Game Hub",
    Color = "gold",
    Callback = function()
        Notify("Auto-detecting game...", "info")
        
        local gameHubs = {
            [14279693118] = {name = "FTAP", url = "FTAPHub.lua"},
            [6516141723] = {name = "DOORS", url = "DoorsHub.lua"},
            [6403373529] = {name = "Slap Battles", url = "SlapBattlesHub.lua"},
        }
        
        local currentGame = gameHubs[game.PlaceId]
        if currentGame then
            Notify("Detected: " .. currentGame.name, "success")
            task.wait(0.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/" .. currentGame.url))()
        else
            Notify("No specific hub for this game", "warning")
        end
    end
})

-- [[ SCRIPT EXECUTOR TAB ]]
local Executor = Window:AddTab("Executor")

local scriptText = ""

Executor:AddInput({
    Title = "Script Editor",
    Placeholder = "-- Paste your script here...",
    Height = 200,
    Callback = function(text)
        scriptText = text
    end
})

Executor:AddButton({
    Title = "▶️ EXECUTE SCRIPT",
    Color = "emerald",
    Callback = function()
        if scriptText ~= "" then
            Notify("Executing script...", "info")
            local success, err = pcall(function()
                loadstring(scriptText)()
            end)
            if success then
                Notify("Script executed!", "success")
            else
                Notify("Script error!", "error")
            end
        else
            Notify("No script to execute!", "warning")
        end
    end
})

Executor:AddButton({
    Title = "🗑️ Clear Script",
    Color = "red",
    Callback = function()
        scriptText = ""
        Notify("Script cleared!", "info")
    end
})

-- [[ UNIVERSAL SCRIPTS TAB ]]
local Scripts = Window:AddTab("Scripts")

Scripts:AddButton({
    Title = "🌐 Infinite Yield",
    Color = "navy",
    Callback = function()
        Notify("Loading Infinite Yield...", "info")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

Scripts:AddButton({
    Title = "🔍 Dark Dex V3",
    Color = "purple",
    Callback = function()
        Notify("Loading Dark Dex...", "info")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
    end
})

Scripts:AddButton({
    Title = "🎮 Remote Spy",
    Color = "indigo",
    Callback = function()
        Notify("Loading Remote Spy...", "info")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
    end
})

Scripts:AddButton({
    Title = "👁️ Universal ESP",
    Color = "turquoise",
    Callback = function()
        Notify("Loading ESP...", "info")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
    end
})

-- [[ SETTINGS TAB ]]
local Settings = Window:AddTab("Settings")

Settings:AddSlider({
    Title = "🏃 WalkSpeed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = val
        end
    end
})

Settings:AddSlider({
    Title = "🦘 JumpPower",
    Flag = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = val
        end
    end
})

Settings:AddToggle({
    Title = "👻 Noclip",
    Flag = "Noclip",
    Default = false,
    Callback = function(state)
        _G.Noclip = state
        Notify("Noclip: " .. (state and "ON" or "OFF"), state and "success" or "warning")
        
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Noclip and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
})

Settings:AddButton({
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

-- [[ MISC TAB ]]
local Misc = Window:AddTab("Misc")

Misc:AddButton({
    Title = "🔄 Rejoin Server",
    Color = "orange",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

Misc:AddButton({
    Title = "🎮 Server Hop",
    Color = "purple",
    Callback = function()
        Notify("Finding new server...", "info")
        local HttpService = game:GetService("HttpService")
        local success, result = pcall(function()
            local servers = HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            )
            for _, server in pairs(servers.data) do
                if server.playing < server.maxPlayers - 5 then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    break
                end
            end
        end)
        if not success then
            Notify("Server hop failed", "error")
        end
    end
})

Misc:AddButton({
    Title = "📋 Copy Discord",
    Color = "blue",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            Notify("Discord link copied!", "success")
        else
            Notify("Clipboard not supported", "warning")
        end
    end
})

-- [[ CREDITS TAB ]]
local Credits = Window:AddTab("Credits")

Credits:AddButton({
    Title = "💙 Created by joaorqqq",
    Color = "celeste",
    Callback = function()
        Notify("Thanks for using Apex!", "success")
    end
})

Credits:AddButton({
    Title = "🌟 Version: v1.0 (Arceus X Fixed)",
    Color = "gold",
    Callback = function()
        Notify("All URLs corrected for Arceus X!", "success")
    end
})

Credits:AddButton({
    Title = "🎁 Join Discord",
    Color = "blue",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            Notify("discord.gg/H6pWukrA7", "success")
        end
    end
})

-- [[ STARTUP ]]
Notify("Apex Universal Executor Loaded!", "success")
Notify("Press RightControl to toggle UI", "info")
Notify("Optimized for Arceus X", "info")

print([[
═══════════════════════════════════════════════════════════════════════
    ⚡ APEX UNIVERSAL EXECUTOR - ARCEUS X FIXED
    ───────────────────────────────────────────────────────────────────
    ✅ Correct URL: refs/heads/main/ApexLib.lua
    ✅ All game hubs available
    ✅ Script executor included
    ✅ Universal scripts ready
    ✅ Press RightControl to toggle
    ───────────────────────────────────────────────────────────────────
    Created by: joaorqqq
    Discord: discord.gg/H6pWukrA7
    Executor: Arceus X Optimized
═══════════════════════════════════════════════════════════════════════
]])
