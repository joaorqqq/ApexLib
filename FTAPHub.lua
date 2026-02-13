--[[
    APEX EXECUTOR - FTAP Hub Official (Elite Chaos Edition)
    Desenvolvido por: joaorqqq
    Funcionalidades: 5000km, Blobman Kick, Rainbow Line, Aura, Notificações Anti-Spam
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- [[ CARREGAR BIBLIOTECA APEX ]]
local Success, ApexLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/loader.lua"))()
end)

if not Success then return end

-- [[ SISTEMA DE NOTIFICAÇÕES INTEGRADO ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ApexNotifications"
screenGui.ResetOnSpawn = false 
screenGui.DisplayOrder = 999
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local notifyContainer = Instance.new("Frame")
notifyContainer.Size = UDim2.new(0.3, 0, 0.5, 0)
notifyContainer.Position = UDim2.new(1, -20, 1, -20) 
notifyContainer.AnchorPoint = Vector2.new(1, 1)
notifyContainer.BackgroundTransparency = 1
notifyContainer.Parent = screenGui

local layout = Instance.new("UIListLayout")
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
layout.Padding = UDim.new(0, 5)
layout.Parent = notifyContainer

local function ApexNotify(texto, cor)
    if #notifyContainer:GetChildren() > 8 then
        local antiga = notifyContainer:GetChildren()[2]
        if antiga then antiga:Destroy() end
    end
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = "● " .. texto
    label.TextColor3 = cor
    label.Font = Enum.Font.Code
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Right
    label.TextTransparency = 1
    label.Parent = notifyContainer
    
    TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    task.delay(5, function()
        if label and label.Parent then
            local out = TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1, Position = UDim2.new(1.2,0,0,0)})
            out:Play()
            out.Completed:Connect(function() label:Destroy() end)
        end
    end)
end

-- [[ JANELA PRINCIPAL ]]
local Window = ApexLib:CreateWindow({
    Title = "Apex | FTAP Hub 🌪️",
    Name = "Apex_FTAP",
    Keybind = Enum.KeyCode.RightControl
})

-- [[ ABA ELITE - DEFESA E NOTIFICAÇÕES ]]
local Main = Window:AddTab("Elite")

Main:AddToggle({
    Title = "🛡️ Anti-Grab (Auto-Soltar)",
    Default = false,
    Callback = function(state)
        _G.AntiGrab = state
        task.spawn(function()
            while _G.AntiGrab do
                task.wait()
                local char = LocalPlayer.Character
                local grab = char and (char:FindFirstChild("Grabbing") or char:FindFirstChild("Grabbed"))
                if grab then grab:Destroy() end
            end
        end)
    end
})

Main:AddToggle({
    Title = "🧪 Anti-Líquido Roxo",
    Default = false,
    Callback = function(state)
        _G.AntiToxic = state
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Acid" or v.Name == "PoisonLiquid" then v.CanTouch = not state end
        end
    end
})

-- [[ ABA CHAOS - DISTÂNCIA E RAINBOW ]]
local Chaos = Window:AddTab("Chaos")

Chaos:AddSlider({
    Title = "📏 Grab Distance (5000km)",
    Min = 20,
    Max = 5000000,
    Default = 100,
    Callback = function(val)
        local tool = LocalPlayer.Character:FindFirstChild("Grab")
        if tool and tool:FindFirstChild("Distance") then tool.Distance.Value = val end
    end
})

Chaos:AddToggle({
    Title = "🌈 Rainbow Grab Line",
    Default = false,
    Callback = function(state)
        _G.RainbowLine = state
        task.spawn(function()
            local h = 0
            while _G.RainbowLine do
                task.wait()
                local tool = LocalPlayer.Character:FindFirstChild("Grab")
                if tool and tool:FindFirstChild("RopeConstraint") then
                    h = (h + 1/255) % 1
                    tool.RopeConstraint.Color = ColorSequence.new(Color3.fromHSV(h, 1, 1))
                end
            end
        end)
    end
})

Chaos:AddToggle({
    Title = "🌀 Fling Aura",
    Default = false,
    Callback = function(state)
        _G.FlingAura = state
        task.spawn(function()
            while _G.FlingAura do
                task.wait(0.1)
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude < 15 then
                            p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 5000, 0)
                        end
                    end
                end
            end
        end)
    end
})

-- [[ ABA MODERATION - BLOBMAN KICK ]]
local Mod = Window:AddTab("Moderation")
local selectedTarget = ""

local function getPlayers()
    local tbl = {}
    for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(tbl, p.Name) end end
    return tbl
end

local PlayerDrop = Mod:AddDropdown({
    Title = "Alvo do Kick",
    Values = getPlayers(),
    Callback = function(v) selectedTarget = v end
})

Mod:AddButton({
    Title = "🔥 EXECUTAR BLOBMAN KICK",
    Color = "red",
    Callback = function()
        local target = Players:FindFirstChild(selectedTarget)
        local blob = workspace:FindFirstChild("Blobman") or LocalPlayer.Character:FindFirstChild("Blobman")
        if target and blob then
            ApexNotify("KICKANDO: " .. selectedTarget, Color3.fromRGB(255, 0, 0))
            LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
            task.wait(0.1)
            target.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100000, 0)
        else
            ApexNotify("Erro: Cadê o Blobman?", Color3.fromRGB(255, 255, 0))
        end
    end
})

-- [[ EVENTOS DE JOGADORES ]]
Players.PlayerAdded:Connect(function(p)
    local cor = LocalPlayer:IsFriendsWith(p.UserId) and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(255, 255, 0)
    ApexNotify(p.Name .. " entrou no servidor.", cor)
    PlayerDrop:SetValues(getPlayers())
end)

Players.PlayerRemoving:Connect(function(p)
    ApexNotify(p.Name .. " saiu.", Color3.fromRGB(255, 0, 0))
    PlayerDrop:SetValues(getPlayers())
end)

ApexNotify("Apex FTAP Hub: Ativado!", Color3.fromRGB(0, 255, 0))
