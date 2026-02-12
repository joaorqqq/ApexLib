# ApexLib
# 🌑 Apex Elite Library v1.0

A **Apex Elite** é uma biblioteca de interface (UI) premium desenvolvida para ser leve, moderna e extremamente funcional. Projetada especificamente para o ecossistema do Roblox, ela oferece suporte total para **Mobilianos** (Mobile) e **Robloxianos** (PC).

---

## ✨ Diferenciais da Apex

* **🔍 Busca em Tempo Real:** Filtre comandos instantaneamente através da barra de busca integrada.
* **🎨 Motor de Cores Poético:** Utilize nomes de cores em português como `Esmeralda`, `Carmesim`, `Vinho`, `Dourado` e `Turquesa`.
* **📐 Interface Adaptável:** Sistema de redimensionamento dinâmico (Resize) e arraste (Draggable).
* **💻 Executor Hub:** Componente de Input otimizado para a criação de executores de scripts in-game.
* **⚡ Otimização:** Feita em TweenService para animações suaves sem causar lag.

---

## 🚀 Como Usar

Para utilizar a biblioteca no seu script, basta usar o carregador oficial (Loader):

```lua
local Apex = loadstring(game:HttpGet("[https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Loader.lua](https://raw.githubusercontent.com/joaorqqq/ApexLib/main/Loader.lua)"))()

local Window = Apex:CreateWindow({
    Title = "Apex Elite Hub"
})

local MainTab = Window:AddTab("Principal")

🛠️ Componentes e Exemplos
🔘 Botões com Cores Customizadas
Você não precisa de RGB. Use o nome da cor!
MainTab:AddButton({
    Title = "Matar Todos",
    Color = "Carmesim",
    Callback = function()
        print("Comando executado!")
    end
})
🔘 Interruptores (Toggle)
MainTab:AddToggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Status do Farm:", state)
    end
})
🔘 Ajustes (Slider)
MainTab:AddSlider({
    Title = "Velocidade",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(valor)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = valor
    end
})
🔘 Campo de Script (Input)
Ideal para fazer um executor interno no seu script.
MainTab:AddInput({
    Placeholder = "-- Cole seu script aqui...",
    Height = 180,
    Callback = function(texto)
        loadstring(texto)()
    end
})
🎨 Lista de Cores Suportadas
A Apex suporta mais de 40 cores. Algumas das favoritas:
Quentes: Escarlate, Carmesim, Âmbar, Dourado, Vinho.
Frias: Esmeralda, Turquesa, Marinho, Celeste, Teal.
Místicas: Violeta, Lavanda, Magenta, Coral.
Neutras: Grafite, Pérola, Marfim, Prata.
👨‍💻 Créditos
Desenvolvido por joaorqqq.
Focado em trazer a melhor experiência para a comunidade de mobilianos e robloxianos.
