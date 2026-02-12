-- [[ APEX ELITE LIBRARY v1.0 ]]
-- [[ Desenvolvido por joaorqqq ]]

local Apex = {}
Apex.__index = Apex

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local info = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- O GRANDE CATÁLOGO DE CORES APEX
local ColorMap = {
    ["branco"] = Color3.fromRGB(255, 255, 255), ["preto"] = Color3.fromRGB(15, 15, 15),
    ["cinza"] = Color3.fromRGB(128, 128, 128), ["prata"] = Color3.fromRGB(192, 192, 192),
    ["bege"] = Color3.fromRGB(245, 245, 220), ["marfim"] = Color3.fromRGB(255, 255, 240),
    ["grafite"] = Color3.fromRGB(56, 56, 56), ["perola"] = Color3.fromRGB(240, 234, 214),
    ["vermelho"] = Color3.fromRGB(255, 0, 0), ["escarlate"] = Color3.fromRGB(255, 36, 0),
    ["carmesim"] = Color3.fromRGB(220, 20, 60), ["laranja"] = Color3.fromRGB(255, 165, 0),
    ["ambar"] = Color3.fromRGB(255, 191, 0), ["amarelo"] = Color3.fromRGB(255, 255, 0),
    ["dourado"] = Color3.fromRGB(255, 215, 0), ["bronze"] = Color3.fromRGB(205, 127, 50),
    ["vinho"] = Color3.fromRGB(128, 0, 32), ["verde"] = Color3.fromRGB(0, 255, 0),
    ["esmeralda"] = Color3.fromRGB(80, 220, 100), ["oliva"] = Color3.fromRGB(128, 128, 0),
    ["ciano"] = Color3.fromRGB(0, 255, 255), ["turquesa"] = Color3.fromRGB(64, 224, 208),
    ["azul"] = Color3.fromRGB(0, 120, 255), ["marinho"] = Color3.fromRGB(0, 0, 128),
    ["celeste"] = Color3.fromRGB(135, 206, 235), ["anil"] = Color3.fromRGB(75, 0, 130),
    ["teal"] = Color3.fromRGB(0, 128, 128), ["violeta"] = Color3.fromRGB(238, 130, 238),
    ["roxo"] = Color3.fromRGB(128, 0, 128), ["lavanda"] = Color3.fromRGB(230, 230, 250),
    ["magenta"] = Color3.fromRGB(255, 0, 255), ["fucsia"] = Color3.fromRGB(255, 0, 255),
    ["rosa"] = Color3.fromRGB(255, 192, 203), ["salmao"] = Color3.fromRGB(250, 128, 114),
    ["coral"] = Color3.fromRGB(255, 127, 80), ["marrom"] = Color3.fromRGB(139, 69, 19),
    ["chocolate"] = Color3.fromRGB(210, 105, 30), ["terracota"] = Color3.fromRGB(226, 114, 91),
    ["sepia"] = Color3.fromRGB(112, 66, 20), ["caqui"] = Color3.fromRGB(195, 176, 145),
    ["ocre"] = Color3.fromRGB(204, 119, 34)
}

local function MakeDraggable(topbar, object)
    local dragging, dragStart, startPos
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = object.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            object.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
end

function Apex:CreateWindow(config)
    local self = setmetatable({}, Apex)
    local UI = Instance.new("ScreenGui", CoreGui); UI.Name = "Apex_Elite"

    local Main = Instance.new("Frame", UI)
    Main.Size = UDim2.new(0, 550, 0, 400); Main.Position = UDim2.new(0.5, -275, 0.5, -200)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Main.ClipsDescendants = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
    
    local TabBar = Instance.new("Frame", Main)
    TabBar.Size = UDim2.new(1, 0, 0, 40); TabBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", TabBar); local TabLayout = Instance.new("UIListLayout", TabBar)
    TabLayout.FillDirection = Enum.FillDirection.Horizontal; TabLayout.Padding = UDim.new(0, 5)

    local SearchBar = Instance.new("TextBox", Main)
    SearchBar.Size = UDim2.new(1, -20, 0, 30); SearchBar.Position = UDim2.new(0, 10, 0, 45)
    SearchBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18); SearchBar.PlaceholderText = "🔍 Buscar comandos robloxianos..."
    SearchBar.TextColor3 = Color3.new(1, 1, 1); SearchBar.Font = Enum.Font.GothamItalic; Instance.new("UICorner", SearchBar)

    local Container = Instance.new("Frame", Main)
    Container.Position = UDim2.new(0, 0, 0, 85); Container.Size = UDim2.new(1, 0, 1, -85); Container.BackgroundTransparency = 1

    local ResizeBtn = Instance.new("ImageButton", Main)
    ResizeBtn.Size = UDim2.new(0, 20, 0, 20); ResizeBtn.Position = UDim2.new(1, -20, 1, -20)
    ResizeBtn.Image = "rbxassetid://10131102001"; ResizeBtn.BackgroundTransparency = 1; ResizeBtn.ZIndex = 10

    local resizing = false
    ResizeBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then resizing = true end end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end end)
    UIS.InputChanged:Connect(function(i)
        if resizing and i.UserInputType == Enum.UserInputType.MouseMovement then
            local mPos = UIS:GetMouseLocation()
            Main.Size = UDim2.new(0, math.max(400, mPos.X - Main.AbsolutePosition.X), 0, math.max(300, mPos.Y - Main.AbsolutePosition.Y - 36))
        end
    end)

    MakeDraggable(TabBar, Main)

    -- BOTÃO DE INFO E SEGURANÇA
    local InfoBtn = Instance.new("TextButton", Main)
    InfoBtn.Size = UDim2.new(0, 20, 0, 20); InfoBtn.Position = UDim2.new(1, -25, 0, 10)
    InfoBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); InfoBtn.Text = "i"; InfoBtn.TextColor3 = Color3.new(1, 1, 1)
    InfoBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", InfoBtn).CornerRadius = UDim.new(1, 0)

    local InfoFrame = Instance.new("Frame", Main)
    InfoFrame.Size = UDim2.new(0.8, 0, 0.6, 0); InfoFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
    InfoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); InfoFrame.Visible = false; InfoFrame.ZIndex = 20; Instance.new("UICorner", InfoFrame)

    local InfoText = Instance.new("TextLabel", InfoFrame)
    InfoText.Size = UDim2.new(1, -20, 1, -20); InfoText.Position = UDim2.new(0, 10, 0, 10); InfoText.BackgroundTransparency = 1; InfoText.TextColor3 = Color3.new(1, 1, 1); InfoText.Font = "GothamMedium"; InfoText.TextWrapped = true; InfoText.ZIndex = 21
    InfoText.Text = "🌑 APEX ELITE v1.0\n\nDesenvolvido por: joaorqqq\n\n⚠️ AVISO: A UI não causa banimento, mas sim o que você faz com ela. Use scripts de fontes confiáveis. O risco está nas funções ativadas, não na interface."

    InfoBtn.MouseButton1Click:Connect(function() InfoFrame.Visible = not InfoFrame.Visible end)
    local CloseInfo = Instance.new("TextButton", InfoFrame)
    CloseInfo.Size = UDim2.new(1, 0, 1, 0); CloseInfo.BackgroundTransparency = 1; CloseInfo.Text = ""; CloseInfo.ZIndex = 20
    CloseInfo.MouseButton1Click:Connect(function() InfoFrame.Visible = false end)

    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local txt = SearchBar.Text:lower()
        for _, item in pairs(Container:GetDescendants()) do
            if (item:IsA("TextButton") or item:IsA("Frame")) and item.Parent:IsA("ScrollingFrame") then
                local label = item:FindFirstChildOfClass("TextLabel")
                local targetText = label and label.Text or (item:IsA("TextButton") and item.Text or "")
                item.Visible = targetText:lower():find(txt) ~= nil
            end
        end
    end)

    function self:AddTab(name)
        local tabObj = {}
        local Page = Instance.new("ScrollingFrame", Container)
        Page.Size = UDim2.new(1, -20, 1, -10); Page.Position = UDim2.new(0, 10, 0, 0)
        Page.BackgroundTransparency = 1; Page.Visible = false; Page.ScrollBarThickness = 0
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 8)

        local TBtn = Instance.new("TextButton", TabBar)
        TBtn.Size = UDim2.new(0, 110, 1, 0); TBtn.Text = name; TBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TBtn.TextColor3 = Color3.new(1,1,1); TBtn.Font = Enum.Font.GothamMedium; Instance.new("UICorner", TBtn)

        TBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            for _, b in pairs(TabBar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end end
            Page.Visible = true; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)

        function tabObj:AddButton(data)
            local cor = ColorMap[string.lower(data.Color or "preto")] or ColorMap["preto"]
            local b = Instance.new("TextButton", Page)
            b.Size = UDim2.new(0.95, 0, 0, 45); b.BackgroundColor3 = cor; b.Text = data.Title
            b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
            local Aspect = Instance.new("UIAspectRatioConstraint", b); Aspect.AspectRatio = 8
            b.MouseButton1Click:Connect(data.Callback)
        end

        function tabObj:AddToggle(data)
            local state = data.Default or false
            local tFrame = Instance.new("Frame", Page)
            tFrame.Size = UDim2.new(0.95, 0, 0, 45); tFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", tFrame)
            local Aspect = Instance.new("UIAspectRatioConstraint", tFrame); Aspect.AspectRatio = 8
            local label = Instance.new("TextLabel", tFrame)
            label.Text = "  " .. data.Title; label.Size = UDim2.new(0.7, 0, 1, 0); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamMedium"; label.TextXAlignment = "Left"
            local switch = Instance.new("TextButton", tFrame)
            switch.Size = UDim2.new(0, 40, 0, 20); switch.Position = UDim2.new(0.85, 0, 0.25, 0); switch.Text = ""
            switch.BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45); Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)
            switch.MouseButton1Click:Connect(function()
                state = not state; TweenService:Create(switch, info, {BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)}):Play(); data.Callback(state)
            end)
        end

        function tabObj:AddSlider(data)
            local sFrame = Instance.new("Frame", Page)
            sFrame.Size = UDim2.new(0.95, 0, 0, 50); sFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", sFrame)
            local Aspect = Instance.new("UIAspectRatioConstraint", sFrame); Aspect.AspectRatio = 7
            local title = Instance.new("TextLabel", sFrame)
            title.Text = "  " .. data.Title .. ": " .. data.Default; title.Size = UDim2.new(1, 0, 0.5, 0); title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1,1,1); title.TextXAlignment = "Left"
            local bar = Instance.new("Frame", sFrame)
            bar.Size = UDim2.new(0.9, 0, 0, 6); bar.Position = UDim2.new(0.05, 0, 0.7, 0); bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Instance.new("UICorner", bar)
            local fill = Instance.new("Frame", bar)
            fill.Size = UDim2.new((data.Default - data.Min) / (data.Max - data.Min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 255, 136); Instance.new("UICorner", fill)
            local function update(input)
                local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(data.Min + (data.Max - data.Min) * pos); fill.Size = UDim2.new(pos, 0, 1, 0); title.Text = "  " .. data.Title .. ": " .. val; data.Callback(val)
            end
            bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                local conn = UIS.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end end)
                UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then conn:Disconnect() end end)
            end end)
        end

        function tabObj:AddInput(data)
            local box = Instance.new("TextBox", Page)
            box.Size = UDim2.new(0.95, 0, 0, data.Height or 150); box.BackgroundColor3 = Color3.fromRGB(18, 18, 18); box.Text = ""
            box.PlaceholderText = data.Placeholder or "Script aqui..."; box.MultiLine = true; box.Font = Enum.Font.Code; box.TextColor3 = Color3.new(1,1,1); box.TextYAlignment = "Top"; box.TextXAlignment = "Left"; Instance.new("UICorner", box)
            box.FocusLost:Connect(function() data.Callback(box.Text) end)
        end

        if not self.CurrentTab then Page.Visible = true; self.CurrentTab = Page; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45) end
        return tabObj
    end
    return self
end

return Apex
