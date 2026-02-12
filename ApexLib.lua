--[[
    
    ██████╗ ██████╗ ███████╗██╗  ██╗    ███████╗██╗     ██╗████████╗███████╗
    ██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝██║     ██║╚══██╔══╝██╔════╝
    ███████║██████╔╝█████╗   ╚███╔╝     █████╗  ██║     ██║   ██║   █████╗  
    ██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ██╔══╝  ██║     ██║   ██║   ██╔══╝  
    ██║  ██║██║     ███████╗██╔╝ ██╗    ███████╗███████╗██║   ██║   ███████╗
    ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝   ╚═╝   ╚══════╝
    
    ==========================================================================
    [ PROJECT INFO ]
    --------------------------------------------------------------------------
    ● Name:       Apex Elite Library
    ● Version:    v1 (Official Release)
    ● Status:     Universal Support (Mobilianos & Robloxianos)
    ● Creator:    joaorqqq
    ● Location:   Salvador, Bahia, Brazil
    --------------------------------------------------------------------------
    [ COMMUNITY & SUPPORT ]
    --------------------------------------------------------------------------
    ● Discord:    https://discord.gg/H6pWukrA7
    ● GitHub:     github.com/joaorqqq/ApexLib
    ==========================================================================
    
    "A library built by a user, for the users. Breaking the limits of UI."
--]]

local Apex = {}
Apex.__index = Apex

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local info = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- [[ SISTEMA DE PERSISTÊNCIA ]]
local function SaveConfig(name, data)
    if writefile and isfolder then
        if not isfolder("Apex_Configs") then makefolder("Apex_Configs") end
        writefile("Apex_Configs/" .. name .. ".json", HttpService:JSONEncode(data))
    end
end

local function LoadConfig(name)
    if isfile and isfile("Apex_Configs/" .. name .. ".json") then
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(readfile("Apex_Configs/" .. name .. ".json"))
        end)
        return success and decoded or nil
    end
    return nil
end

-- [[ POETIC COLOR MOTOR (v1) ]]
local ColorMap = {
    ["white"] = Color3.fromRGB(255, 255, 255), ["black"] = Color3.fromRGB(15, 15, 15),
    ["gray"] = Color3.fromRGB(128, 128, 128), ["silver"] = Color3.fromRGB(192, 192, 192),
    ["beige"] = Color3.fromRGB(245, 245, 220), ["ivory"] = Color3.fromRGB(255, 255, 240),
    ["graphite"] = Color3.fromRGB(56, 56, 56), ["pearl"] = Color3.fromRGB(240, 234, 214),
    ["red"] = Color3.fromRGB(255, 0, 0), ["scarlet"] = Color3.fromRGB(255, 36, 0),
    ["crimson"] = Color3.fromRGB(220, 20, 60), ["orange"] = Color3.fromRGB(255, 165, 0),
    ["amber"] = Color3.fromRGB(255, 191, 0), ["yellow"] = Color3.fromRGB(255, 255, 0),
    ["gold"] = Color3.fromRGB(255, 215, 0), ["bronze"] = Color3.fromRGB(205, 127, 50),
    ["wine"] = Color3.fromRGB(128, 0, 32), ["green"] = Color3.fromRGB(0, 255, 0),
    ["emerald"] = Color3.fromRGB(80, 220, 100), ["olive"] = Color3.fromRGB(128, 128, 0),
    ["cyan"] = Color3.fromRGB(0, 255, 255), ["turquoise"] = Color3.fromRGB(64, 224, 208),
    ["blue"] = Color3.fromRGB(0, 120, 255), ["navy"] = Color3.fromRGB(0, 0, 128),
    ["celeste"] = Color3.fromRGB(135, 206, 235), ["indigo"] = Color3.fromRGB(75, 0, 130),
    ["teal"] = Color3.fromRGB(0, 128, 128), ["violet"] = Color3.fromRGB(238, 130, 238),
    ["purple"] = Color3.fromRGB(128, 0, 128), ["lavender"] = Color3.fromRGB(230, 230, 250),
    ["magenta"] = Color3.fromRGB(255, 0, 255), ["fuchsia"] = Color3.fromRGB(255, 0, 255),
    ["pink"] = Color3.fromRGB(255, 192, 203), ["salmon"] = Color3.fromRGB(250, 128, 114),
    ["coral"] = Color3.fromRGB(255, 127, 80), ["brown"] = Color3.fromRGB(139, 69, 19),
    ["chocolate"] = Color3.fromRGB(210, 105, 30), ["terraccota"] = Color3.fromRGB(226, 114, 91),
    ["sepia"] = Color3.fromRGB(112, 66, 20), ["khaki"] = Color3.fromRGB(195, 176, 145),
    ["ochre"] = Color3.fromRGB(204, 119, 34)
}

-- [[ ARRASTE HÍBRIDO (PC & MOBILE) ]]
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

-- [[ WATERMARK & ANTI-TAMPER ]]
local function CreateWatermark(parentUI)
    local Watermark = Instance.new("TextButton")
    Watermark.Name = "Apex_Elite_Watermark"
    Watermark.Parent = parentUI
    Watermark.Size = UDim2.new(0, 220, 0, 25)
    Watermark.Position = UDim2.new(0, 10, 1, -35)
    Watermark.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Watermark.BackgroundTransparency = 0.3
    Watermark.Text = "🌑 Apex Elite | Click to Copy Discord"
    Watermark.TextColor3 = Color3.new(1, 1, 1)
    Watermark.Font = "GothamMedium"
    Watermark.TextSize = 11
    Instance.new("UICorner", Watermark).CornerRadius = UDim.new(0, 5)
    
    Watermark.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/H6pWukrA7")
            Watermark.Text = "✅ Discord Link Copied!"
            task.wait(2)
            Watermark.Text = "🌑 Apex Elite | Click to Copy Discord"
        end
    end)

    task.spawn(function()
        while task.wait(3) do
            if not Watermark or not Watermark.Parent or Watermark.Visible == false then
                parentUI:Destroy()
                error("APEX ERROR: Watermark tampering detected.")
                break
            end
        end
    end)
end

function Apex:CreateWindow(config)
    local self = setmetatable({}, Apex)
    self.Title = config.Title or "Apex Elite v1"
    self.ConfigName = config.Name or "ApexConfig"
    self.SavedData = LoadConfig(self.ConfigName) or {}
    self.Keybind = config.Keybind or Enum.KeyCode.LeftControl

    local UI = Instance.new("ScreenGui", CoreGui); UI.Name = "Apex_Elite_" .. math.random(100,999)
    CreateWatermark(UI)

    local Main = Instance.new("Frame", UI)
    Main.Size = UDim2.new(0, 550, 0, 420); Main.Position = UDim2.new(0.5, -275, 0.5, -210)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12); Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
    
    UIS.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == self.Keybind then Main.Visible = not Main.Visible end
    end)

    local TopBar = Instance.new("Frame", Main)
    TopBar.Size = UDim2.new(1, 0, 0, 35); TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", TopBar); MakeDraggable(TopBar, Main)

    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.Text = "  " .. self.Title; TitleLabel.Size = UDim2.new(1, 0, 1, 0); TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.new(1,1,1); TitleLabel.Font = "GothamBold"; TitleLabel.TextXAlignment = "Left"

    local SearchBar = Instance.new("TextBox", Main)
    SearchBar.Size = UDim2.new(1, -20, 0, 30); SearchBar.Position = UDim2.new(0, 10, 0, 45)
    SearchBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18); SearchBar.PlaceholderText = "🔍 Search components..."
    SearchBar.TextColor3 = Color3.new(1, 1, 1); SearchBar.Font = "GothamItalic"; Instance.new("UICorner", SearchBar)

    local TabBar = Instance.new("Frame", Main)
    TabBar.Size = UDim2.new(1, -20, 0, 30); TabBar.Position = UDim2.new(0, 10, 0, 85); TabBar.BackgroundTransparency = 1
    local TabLayout = Instance.new("UIListLayout", TabBar); TabLayout.FillDirection = "Horizontal"; TabLayout.Padding = UDim.new(0, 5)

    local Container = Instance.new("Frame", Main)
    Container.Position = UDim2.new(0, 10, 0, 120); Container.Size = UDim2.new(1, -20, 1, -130); Container.BackgroundTransparency = 1

    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local txt = SearchBar.Text:lower()
        for _, page in pairs(Container:GetChildren()) do
            for _, item in pairs(page:GetChildren()) do
                if item:IsA("Frame") or item:IsA("TextButton") then
                    local label = item:FindFirstChildOfClass("TextLabel") or item
                    item.Visible = label.Text:lower():find(txt) ~= nil
                end
            end
        end
    end)

    function self:AddTab(name)
        local tabObj = {}
        local Page = Instance.new("ScrollingFrame", Container)
        Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false; Page.ScrollBarThickness = 2
        local PageLayout = Instance.new("UIListLayout", Page); PageLayout.Padding = UDim.new(0, 6)
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y) end)

        local TBtn = Instance.new("TextButton", TabBar)
        TBtn.Size = UDim2.new(0, 100, 1, 0); TBtn.Text = name; TBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TBtn.TextColor3 = Color3.new(1,1,1); TBtn.Font = "GothamMedium"; Instance.new("UICorner", TBtn)

        TBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            for _, b in pairs(TabBar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end end
            Page.Visible = true; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)

        function tabObj:AddButton(data)
            local cor = ColorMap[string.lower(data.Color or "graphite")] or ColorMap["graphite"]
            local b = Instance.new("TextButton", Page)
            b.Size = UDim2.new(1, -5, 0, 35); b.BackgroundColor3 = cor; b.Text = data.Title
            b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(data.Callback)
        end

        function tabObj:AddToggle(data)
            local flag = data.Flag or data.Title
            local state = self.SavedData[flag] ~= nil and self.SavedData[flag] or data.Default or false
            local tFrame = Instance.new("Frame", Page)
            tFrame.Size = UDim2.new(1, -5, 0, 40); tFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", tFrame)
            local label = Instance.new("TextLabel", tFrame)
            label.Text = "  " .. data.Title; label.Size = UDim2.new(1, 0, 1, 0); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamMedium"; label.TextXAlignment = "Left"
            local switch = Instance.new("TextButton", tFrame)
            switch.Size = UDim2.new(0, 35, 0, 18); switch.Position = UDim2.new(1, -45, 0.25, 0); switch.Text = ""
            switch.BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45); Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)
            switch.MouseButton1Click:Connect(function()
                state = not state
                TweenService:Create(switch, info, {BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)}):Play()
                self.SavedData[flag] = state; SaveConfig(self.ConfigName, self.SavedData); data.Callback(state)
            end)
            if state then task.spawn(function() data.Callback(true) end) end
        end

        function tabObj:AddSlider(data)
            local flag = data.Flag or data.Title
            local savedVal = self.SavedData[flag] or data.Default
            local sFrame = Instance.new("Frame", Page)
            sFrame.Size = UDim2.new(1, -5, 0, 50); sFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", sFrame)
            local title = Instance.new("TextLabel", sFrame)
            title.Text = "  " .. data.Title .. ": " .. savedVal; title.Size = UDim2.new(1, 0, 0.5, 0); title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1,1,1); title.TextXAlignment = "Left"
            local bar = Instance.new("Frame", sFrame)
            bar.Size = UDim2.new(0.9, 0, 0, 4); bar.Position = UDim2.new(0.05, 0, 0.75, 0); bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Instance.new("UICorner", bar)
            local fill = Instance.new("Frame", bar)
            fill.Size = UDim2.new((savedVal - data.Min) / (data.Max - data.Min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 255, 136); Instance.new("UICorner", fill)
            local function update(input)
                local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(data.Min + (data.Max - data.Min) * pos)
                fill.Size = UDim2.new(pos, 0, 1, 0); title.Text = "  " .. data.Title .. ": " .. val
                self.SavedData[flag] = val; SaveConfig(self.ConfigName, self.SavedData); data.Callback(val)
            end
            bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                local conn = UIS.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end end)
                UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then conn:Disconnect() end end)
            end end)
        end

        function tabObj:AddInput(data)
            local box = Instance.new("TextBox", Page)
            box.Size = UDim2.new(1, -5, 0, data.Height or 40); box.BackgroundColor3 = Color3.fromRGB(18, 18, 18); box.Text = ""
            box.PlaceholderText = data.Placeholder or "Type script here..."; box.MultiLine = true; box.Font = "Code"; box.TextColor3 = Color3.new(1,1,1); box.TextXAlignment = "Left"; box.TextYAlignment = "Top"; Instance.new("UICorner", box)
            box.FocusLost:Connect(function() data.Callback(box.Text) end)
        end

        if not self.CurrentTab then Page.Visible = true; self.CurrentTab = Page; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45) end
        return tabObj
    end
    return self
end

return Apex
    TabBar.Size = UDim2.new(1, -20, 0, 30); TabBar.Position = UDim2.new(0, 10, 0, 85); TabBar.BackgroundTransparency = 1
    local TabLayout = Instance.new("UIListLayout", TabBar); TabLayout.FillDirection = "Horizontal"; TabLayout.Padding = UDim.new(0, 5)

    local Container = Instance.new("Frame", Main)
    Container.Position = UDim2.new(0, 10, 0, 120); Container.Size = UDim2.new(1, -20, 1, -130); Container.BackgroundTransparency = 1

    -- Busca Lógica
    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local txt = SearchBar.Text:lower()
        for _, page in pairs(Container:GetChildren()) do
            for _, item in pairs(page:GetChildren()) do
                if item:IsA("Frame") or item:IsA("TextButton") then
                    local label = item:FindFirstChildOfClass("TextLabel") or item
                    item.Visible = label.Text:lower():find(txt) ~= nil
                end
            end
        end
    end)

    function self:AddTab(name)
        local tabObj = {}
        local Page = Instance.new("ScrollingFrame", Container)
        Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false; Page.ScrollBarThickness = 2
        local PageLayout = Instance.new("UIListLayout", Page); PageLayout.Padding = UDim.new(0, 6)
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y) end)

        local TBtn = Instance.new("TextButton", TabBar)
        TBtn.Size = UDim2.new(0, 100, 1, 0); TBtn.Text = name; TBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TBtn.TextColor3 = Color3.new(1,1,1); TBtn.Font = "GothamMedium"; Instance.new("UICorner", TBtn)

        TBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            for _, b in pairs(TabBar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end end
            Page.Visible = true; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)

        function tabObj:AddButton(data)
            local cor = ColorMap[string.lower(data.Color or "grafite")] or ColorMap["grafite"]
            local b = Instance.new("TextButton", Page)
            b.Size = UDim2.new(1, -5, 0, 35); b.BackgroundColor3 = cor; b.Text = data.Title
            b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(data.Callback)
        end

        function tabObj:AddToggle(data)
            local flag = data.Flag or data.Title
            local state = self.SavedData[flag] ~= nil and self.SavedData[flag] or data.Default or false
            local tFrame = Instance.new("Frame", Page)
            tFrame.Size = UDim2.new(1, -5, 0, 40); tFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", tFrame)
            local label = Instance.new("TextLabel", tFrame)
            label.Text = "  " .. data.Title; label.Size = UDim2.new(1, 0, 1, 0); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamMedium"; label.TextXAlignment = "Left"
            local switch = Instance.new("TextButton", tFrame)
            switch.Size = UDim2.new(0, 35, 0, 18); switch.Position = UDim2.new(1, -45, 0.25, 0); switch.Text = ""
            switch.BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45); Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)
            switch.MouseButton1Click:Connect(function()
                state = not state
                TweenService:Create(switch, info, {BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)}):Play()
                self.SavedData[flag] = state; SaveConfig(self.ConfigName, self.SavedData); data.Callback(state)
            end)
            if state then task.spawn(function() data.Callback(true) end) end
        end

        function tabObj:AddSlider(data)
            local flag = data.Flag or data.Title
            local savedVal = self.SavedData[flag] or data.Default
            local sFrame = Instance.new("Frame", Page)
            sFrame.Size = UDim2.new(1, -5, 0, 50); sFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", sFrame)
            local title = Instance.new("TextLabel", sFrame)
            title.Text = "  " .. data.Title .. ": " .. savedVal; title.Size = UDim2.new(1, 0, 0.5, 0); title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1,1,1); title.TextXAlignment = "Left"
            local bar = Instance.new("Frame", sFrame)
            bar.Size = UDim2.new(0.9, 0, 0, 4); bar.Position = UDim2.new(0.05, 0, 0.75, 0); bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Instance.new("UICorner", bar)
            local fill = Instance.new("Frame", bar)
            fill.Size = UDim2.new((savedVal - data.Min) / (data.Max - data.Min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 255, 136); Instance.new("UICorner", fill)
            local function update(input)
                local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(data.Min + (data.Max - data.Min) * pos)
                fill.Size = UDim2.new(pos, 0, 1, 0); title.Text = "  " .. data.Title .. ": " .. val
                self.SavedData[flag] = val; SaveConfig(self.ConfigName, self.SavedData); data.Callback(val)
            end
            bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                local conn = UIS.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end end)
                UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then conn:Disconnect() end end)
            end end)
        end

        function tabObj:AddInput(data)
            local box = Instance.new("TextBox", Page)
            box.Size = UDim2.new(1, -5, 0, data.Height or 40); box.BackgroundColor3 = Color3.fromRGB(18, 18, 18); box.Text = ""
            box.PlaceholderText = data.Placeholder or "Digite aqui..."; box.MultiLine = true; box.Font = "Code"; box.TextColor3 = Color3.new(1,1,1); box.TextXAlignment = "Left"; box.TextYAlignment = "Top"; Instance.new("UICorner", box)
            box.FocusLost:Connect(function() data.Callback(box.Text) end)
        end

        if not self.CurrentTab then Page.Visible = true; self.CurrentTab = Page; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45) end
        return tabObj
    end
    return self
end

return Apex
    function self:AddTab(name)
        local tabObj = {}
        local Page = Instance.new("ScrollingFrame", Container)
        Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false; Page.ScrollBarThickness = 2; Page.CanvasSize = UDim2.new(0,0,0,0)
        local PageLayout = Instance.new("UIListLayout", Page); PageLayout.Padding = UDim.new(0, 6); PageLayout.SortOrder = "LayoutOrder"
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y) end)

        local TBtn = Instance.new("TextButton", TabBar)
        TBtn.Size = UDim2.new(0, 100, 1, 0); TBtn.Text = name; TBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TBtn.TextColor3 = Color3.fromRGB(200, 200, 200); TBtn.Font = "GothamMedium"; TBtn.TextSize = 13; Instance.new("UICorner", TBtn)

        TBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            for _, b in pairs(TabBar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end end
            Page.Visible = true; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)

        -- Botão
        function tabObj:AddButton(data)
            local cor = ColorMap[string.lower(data.Color or "grafite")] or ColorMap["grafite"]
            local b = Instance.new("TextButton", Page)
            b.Size = UDim2.new(1, -5, 0, 35); b.BackgroundColor3 = cor; b.Text = data.Title
            b.TextColor3 = Color3.new(1,1,1); b.Font = "GothamBold"; Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(data.Callback)
        end

        -- Toggle com Auto-Save
        function tabObj:AddToggle(data)
            local flag = data.Flag or data.Title
            local state = self.SavedData[flag] ~= nil and self.SavedData[flag] or data.Default or false
            
            local tFrame = Instance.new("Frame", Page)
            tFrame.Size = UDim2.new(1, -5, 0, 40); tFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", tFrame)
            local label = Instance.new("TextLabel", tFrame)
            label.Text = "  " .. data.Title; label.Size = UDim2.new(1, 0, 1, 0); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamMedium"; label.TextXAlignment = "Left"
            
            local switch = Instance.new("TextButton", tFrame)
            switch.Size = UDim2.new(0, 35, 0, 18); switch.Position = UDim2.new(1, -45, 0.25, 0); switch.Text = ""
            switch.BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45); Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)
            
            local function toggle(s)
                state = s
                TweenService:Create(switch, info, {BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)}):Play()
                self.SavedData[flag] = state; SaveConfig(self.ConfigName, self.SavedData); data.Callback(state)
            end

            switch.MouseButton1Click:Connect(function() toggle(not state) end)
            if state then task.spawn(function() data.Callback(true) end) end
        end

        -- Slider Suave (Híbrido)
        function tabObj:AddSlider(data)
            local flag = data.Flag or data.Title
            local savedVal = self.SavedData[flag] or data.Default
            
            local sFrame = Instance.new("Frame", Page)
            sFrame.Size = UDim2.new(1, -5, 0, 50); sFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Instance.new("UICorner", sFrame)
            local title = Instance.new("TextLabel", sFrame)
            title.Text = "  " .. data.Title .. ": " .. savedVal; title.Size = UDim2.new(1, 0, 0.5, 0); title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1,1,1); title.TextXAlignment = "Left"
            
            local bar = Instance.new("Frame", sFrame)
            bar.Size = UDim2.new(0.9, 0, 0, 4); bar.Position = UDim2.new(0.05, 0, 0.75, 0); bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Instance.new("UICorner", bar)
            local fill = Instance.new("Frame", bar)
            fill.Size = UDim2.new((savedVal - data.Min) / (data.Max - data.Min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 255, 136); Instance.new("UICorner", fill)
            
            local function update(input)
                local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(data.Min + (data.Max - data.Min) * pos)
                fill.Size = UDim2.new(pos, 0, 1, 0); title.Text = "  " .. data.Title .. ": " .. val
                self.SavedData[flag] = val; SaveConfig(self.ConfigName, self.SavedData); data.Callback(val)
            end
            
            bar.InputBegan:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    local conn = UIS.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end end)
                    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then conn:Disconnect() end end)
                end 
            end)
            if self.SavedData[flag] then task.spawn(function() data.Callback(savedVal) end) end
        end

        -- Input (Caixa de Texto)
        function tabObj:AddInput(data)
            local box = Instance.new("TextBox", Page)
            box.Size = UDim2.new(1, -5, 0, data.Height or 40); box.BackgroundColor3 = Color3.fromRGB(18, 18, 18); box.Text = ""
            box.PlaceholderText = data.Placeholder or "Digite aqui..."; box.MultiLine = true; box.Font = "Code"; box.TextColor3 = Color3.new(1,1,1); box.TextXAlignment = "Left"; box.TextYAlignment = "Top"; Instance.new("UICorner", box)
            box.FocusLost:Connect(function() data.Callback(box.Text) end)
        end

        if not self.CurrentTab then Page.Visible = true; self.CurrentTab = Page; TBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45) end
        return tabObj
    end

    return self
end

return Apex
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
