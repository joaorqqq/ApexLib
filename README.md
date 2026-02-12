# 🌑 Apex Elite Library v1.0

A **Apex Elite** é uma biblioteca de interface (UI) premium desenvolvida para ser leve, moderna e extremamente funcional. Projetada especificamente para o ecossistema do Roblox, ela oferece suporte total para **Mobilianos** (Mobile) e **Robloxianos** (PC).

---

## 🚀 Como Usar

Para utilizar a biblioteca no seu script, basta usar o carregador oficial (Loader):

```lua
local Apex = loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Loader.lua"))()

local Window = Apex:CreateWindow({
    Title = "Apex Elite Hub"
})

local MainTab = Window:AddTab("Principal")

-- 🔘 Botões com Cores Customizadas
MainTab:AddButton({
    Title = "Matar Todos",
    Color = "Carmesim",
    Callback = function()
        print("Comando executado!")
    end
})

-- 🔘 Campo de Script (Input)
MainTab:AddInput({
    Placeholder = "-- Cole seu script aqui...",
    Height = 180,
    Callback = function(texto)
        loadstring(texto)()
    end
})
```
 FAQ - Perguntas Frequentes
1. Como eu abro/fecho o menu? Atualmente, a Apex Elite permanece aberta. Em atualizações futuras, traremos um botão de minimizar exclusivo para mobilianos.
2. A UI causa banimento? Não. A UI é apenas visual. O banimento ocorre pelo que você faz com ela (os scripts que você executa). Use com responsabilidade.
Desenvolvido por joaorqqq. Focado em trazer a melhor experiência para a comunidade de mobilianos e robloxianos.
