--[[
    APEX EXECUTOR - OFFICIAL BOOTSTRAPPER
    Design: Edição Azul (Salvador Edition)
    Base: Apex Elite Library v1
--]]

-- Carregando o seu Loader do GitHub
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/loader.lua"))()
end)

if not Success then
    warn("APEX ERROR: Não foi possível carregar o loader.lua. Verifique se o arquivo está no GitHub!")
    return
end

-- Criando a Janela do Executor
local Window = ApexLib:CreateWindow({
    Title = "ApexExecutor | Blue Edition",
    Name = "Apex_Config",
    Keybind = Enum.KeyCode.RightControl 
})

-- [[ ABA DO EXECUTOR ]]
local MainTab = Window:AddTab("Home")
local scriptToExecute = ""

MainTab:AddTextBox({
    Title = "Editor de Script",
    Placeholder = "Cole seu script aqui, robloxiano...",
    Height = 120,
    Callback = function(text)
        scriptToExecute = text
    end
})

MainTab:AddButton({
    Title = "EXECUTAR SCRIPT",
    Color = "blue",
    Callback = function()
        if scriptToExecute ~= "" then
            local success, err = pcall(function()
                loadstring(scriptToExecute)()
            end)
            if not success then warn("Erro no Script: " .. err) end
        else
            print("Apex: O editor está vazio!")
        end
    end
})

-- [[ ABA DE SCRIPTS (GHOSTHUB) ]]
local ScriptTab = Window:AddTab("Scripts")

ScriptTab:AddButton({
    Title = "👻 GhostHub (Blox Fruit)",
    Color = "celeste",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Ghosthub.lua"))()
    end
})

ScriptTab:AddButton({
    Title = "☁️ Infinite Yield",
    Color = "navy",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
    end
})

-- [[ ABA DE CONFIGURAÇÕES ]]
local ConfigTab = Window:AddTab("Ajustes")

ConfigTab:AddSlider({
    Title = "Velocidade (WalkSpeed)",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
})

-- [[ ABA DE CRÉDITOS ]]
local CreditsTab = Window:AddTab("Info")
CreditsTab:AddButton({
    Title = "Criador: joaorqqq",
    Color = "blue",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            print("Discord copiado!")
        end
    end
})

print("ApexExecutor carregado via loader.lua!")
