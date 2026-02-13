--[[
    ██████╗ ██████╗ ███████╗██╗  ██╗    ███████╗██╗  ██╗███████╗ ██████╗
    ██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚██╗██╔╝██╔════╝██╔════╝
    ███████║██████╔╝█████╗   ╚███╔╝     █████╗   ╚███╔╝ █████╗  ██║     
    ██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ██╔══╝   ██╔██╗ ██╔══╝  ██║     
    ██║  ██║██║     ███████╗██╔╝ ██╗    ███████╗██╔╝ ██╗███████╗╚██████╗
    ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝
    
    [ APEX UNIVERSAL EXECUTOR ] - v1.1
    Supported: Blox Fruits (All Seas), Doors (Lobby/F1/F2), FTAP, Slap Battles
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ DATABASE DE LINKS ]]
local Links = {
    Ghost = "https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/Ghosthub.lua",
    Doors = "https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/Doorshub.lua",
    FTAP  = "https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/FTAPHub.lua",
    Slap  = "https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/SlapHub.lua"
}

-- [[ GAME DATABASE ]]
local GameScripts = {
    -- Blox Fruits
    [2753915549] = {Name = "Blox Fruits (Sea 1)", URL = Links.Ghost},
    [4442272183] = {Name = "Blox Fruits (Sea 2)", URL = Links.Ghost},
    [7449423635] = {Name = "Blox Fruits (Sea 3)", URL = Links.Ghost},
    
    -- Doors
    [6839590334] = {Name = "Doors (Lobby)", URL = Links.Doors},
    [6516141723] = {Name = "Doors (Floor 1)", URL = Links.Doors},
    [15339343207] = {Name = "Doors (Floor 2)", URL = "FLOOR2_LOCK"}, -- Trava Especial
    
    -- Outros
    [14279693118] = {Name = "FTAP Hub", URL = Links.FTAP},
    [6403330132] = {Name = "Slap Hub", URL = Links.Slap}
}

-- [[ CARREGAR APEX LIB ]]
local ApexLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"))()

-- [[ FUNÇÃO DE CARREGAMENTO ]]
local function LoadScript(data)
    if data.URL == "FLOOR2_LOCK" then
        -- Notificação estilizada para os mobilianos no Floor 2
        local notif = Instance.new("Message", game.CoreGui)
        notif.Text = "⚠️ Floor 2 is only available in script version 2.0. Coming Soon!"
        task.wait(5)
        notif:Destroy()
        return
    end
    
    loadstring(game:HttpGet(data.URL))()
end

-- [[ INTERFACE PRINCIPAL ]]
local Window = ApexLib:CreateWindow({
    Title = "⚡ Apex Universal",
    Name = "Apex_Universal",
    Keybind = Enum.KeyCode.RightControl
})

local Home = Window:AddTab("Home")
local Hubs = Window:AddTab("Game Hubs")

Home:AddButton({Title = "🎮 Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name})
Home:AddButton({Title = "📱 Device: Mobile (Mobiliano Detected)"})

Hubs:AddButton({
    Title = "🚀 Load Current Game Hub",
    Callback = function()
        local data = GameScripts[game.PlaceId]
        if data then
            LoadScript(data)
        end
    end
})

-- [[ AUTO-LOAD ]]
task.spawn(function()
    local data = GameScripts[game.PlaceId]
    if data then
        task.wait(1)
        LoadScript(data)
    end
end)
 
