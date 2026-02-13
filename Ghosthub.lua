--[[
    
     █████╗ ██╗    ██╗ ██████╗  █████╗ ██╗  ██╗
    ██╔══██╗██║    ██║██╔═══██╗██╔══██╗╚██╗██╔╝
    ███████║██║ █╗ ██║██║   ██║███████║ ╚███╔╝ 
    ██╔══██║██║███╗██║██║   ██║██╔══██║ ██╔██╗ 
    ██║  ██║╚███╔███╔╝╚██████╔╝██║  ██║██╔╝ ██╗
    ╚═╝  ╚═╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
    
    ==========================================================================
    [ BLOX APEX HUB - v1 ]
    --------------------------------------------------------------------------
    ● Powered by Apex Elite Library (Salvador, BA)
    ● Game: Blox Fruits
    ● Optimization: Mobilianos & Robloxianos
    ==========================================================================
--]]

-- Carregando sua biblioteca oficial
local Apex = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Loader.lua"))()

-- Criando a Janela do Hub
local Window = Apex:CreateWindow({
    Title = "Blox Apex Hub | Blox Fruits",
    Name = "BloxApex_Config", -- Salva as configs automaticamente
    Keybind = Enum.KeyCode.RightControl
})

-- [[ ABA: AUTO FARM ]]
local MainTab = Window:AddTab("Auto Farm")

MainTab:AddToggle({
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(state)
        _G.AutoFarm = state
        print("Auto Farm Level:", state)
        -- Aqui entraria sua lógica de farm (Tween para NPCs, etc)
    end
})

MainTab:AddToggle({
    Title = "Auto Farm Chests",
    Default = false,
    Callback = function(state)
        _G.AutoChests = state
        print("Auto Chests:", state)
    end
})

-- [[ ABA: WEAPONS (USANDO SEU POETIC COLOR MOTOR) ]]
local WeaponTab = Window:AddTab("Weapons")

WeaponTab:AddButton({
    Title = "Select Melee",
    Color = "Crimson", -- Cor do seu catálogo poético
    Callback = function()
        print("Arma selecionada: Estilo de Luta")
    end
})

WeaponTab:AddButton({
    Title = "Select Sword",
    Color = "Emerald", -- Cor do seu catálogo poético
    Callback = function()
        print("Arma selecionada: Espada")
    end
})

-- [[ ABA: TELEPORTS ]]
local TeleportTab = Window:AddTab("Teleports")

TeleportTab:AddButton({
    Title = "Sea 1 (Starter Island)",
    Color = "Blue",
    Callback = function()
        print("Teleportando para Sea 1...")
    end
})

TeleportTab:AddButton({
    Title = "Cafe (Sea 2)",
    Color = "Amber",
    Callback = function()
        print("Teleportando para o Café...")
    end
})

-- [[ ABA: SETTINGS ]]
local SettingsTab = Window:AddTab("Settings")

SettingsTab:AddSlider({
    Title = "WalkSpeed",
    Min = 16,
    Max = 250,
    Default = 16,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

SettingsTab:AddInput({
    Title = "Custom Script Runner",
    Placeholder = "Cole seu script aqui...",
    Callback = function(text)
        loadstring(text)()
    end
})

print("🌑 Blox Apex Hub carregado com sucesso!")

