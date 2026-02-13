--[[
    APEXBLUE.LUA (BOOTSTRAPPER)
    Nome do Executor: ApexExecutor
    Author: joaorqqq
    Location: Salvador, BA
--]]

-- Carregando a sua Library base
local ApexLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexLib.lua"))()

-- Criando a Janela do ApexExecutor
local Window = ApexLib:CreateWindow({
    Title = "ApexExecutor | Blue Edition",
    Name = "ApexExecutor_Config",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ ABA DO EDITOR ]]
local MainTab = Window:AddTab("Executor")
local currentScript = ""

MainTab:AddInput({
    Title = "Script Editor",
    Placeholder = "Cole seu script aqui...",
    Height = 150,
    Callback = function(text)
        currentScript = text
    end
})

MainTab:AddButton({
    Title = "EXECUTE",
    Color = "blue", 
    Callback = function()
        if currentScript ~= "" then
            local success, err = pcall(function()
                loadstring(currentScript)()
            end)
            if not success then warn("Erro: " .. err) end
        end
    end
})

-- [[ ABA DE SCRIPTS (NOSSO GHOSTHUB) ]]
local ScriptTab = Window:AddTab("Scripts")

-- Seu Ghost Hub de Blox Fruit
ScriptTab:AddButton({
    Title = "👻 Nosso GhostHub (Blox Fruit)",
    Color = "celeste",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/Ghosthub.lua"))()
    end
})

-- Infinite Yield
ScriptTab:AddButton({
    Title = "☁️ Infinite Yield",
    Color = "navy",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
    end
})

-- [[ ABA DE INFO ]]
local Credits = Window:AddTab("Credits")
Credits:AddButton({
    Title = "Discord: joaorqqq",
    Color = "blue",
    Callback = function()
        if setclipboard then setclipboard("https://discord.gg/H6pWukrA7") end
    end
})

print("ApexExecutor carregado com GhostHub.lua próprio!")
