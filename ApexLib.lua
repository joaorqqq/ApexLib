--[[
    APEX LIBRARY - EMBEDDED VERSION (NO EXTERNAL LOADING)
    This version has the library code built-in
--]]

-- [[ APEX LIB EMBEDDED ]]
local Apex = {}
Apex.__index = Apex

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local info = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Color Map
local ColorMap = {
    ["white"] = Color3.fromRGB(255, 255, 255), ["black"] = Color3.fromRGB(15, 15, 15),
    ["gray"] = Color3.fromRGB(128, 128, 128), ["silver"] = Color3.fromRGB(192, 192, 192),
    ["red"] = Color3.fromRGB(255, 0, 0), ["blue"] = Color3.fromRGB(0, 120, 255),
    ["green"] = Color3.fromRGB(0, 255, 0), ["yellow"] = Color3.fromRGB(255, 255, 0),
    ["orange"] = Color3.fromRGB(255, 165, 0), ["purple"] = Color3.fromRGB(128, 0, 128),
    ["pink"] = Color3.fromRGB(255, 192, 203), ["cyan"] = Color3.fromRGB(0, 255, 255),
    ["emerald"] = Color3.fromRGB(80, 220, 100), ["gold"] = Color3.fromRGB(255, 215, 0),
    ["turquoise"] = Color3.fromRGB(64, 224, 208), ["celeste"] = Color3.fromRGB(135, 206, 235),
    ["graphite"] = Color3.fromRGB(56, 56, 56), ["navy"] = Color3.fromRGB(0, 0, 128),
}

-- Make Draggable
local function MakeDraggable(topbar, object)
    local dragging, dragStart, startPos
    
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = object.Position
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                        input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            object.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X, 
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Create Window
function Apex:CreateWindow(config)
    local self = setmetatable({}, Apex)
    self.Title = config.Title or "Apex Window"
    self.Keybind = config.Keybind or Enum.KeyCode.RightControl

    local UI = Instance.new("ScreenGui")
    UI.Name = "ApexUI_" .. math.random(1000, 9999)
    UI.ResetOnSpawn = false
    UI.Parent = CoreGui

    local Main = Instance.new("Frame", UI)
    Main.Size = UDim2.new(0, 550, 0, 420)
    Main.Position = UDim2.new(0.5, -275, 0.5, -210)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
    
    -- Keybind toggle
    UIS.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == self.Keybind then 
            Main.Visible = not Main.Visible 
        end
    end)

    -- Top Bar
    local TopBar = Instance.new("Frame", Main)
    TopBar.Size = UDim2.new(1, 0, 0, 35)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", TopBar)
    MakeDraggable(TopBar, Main)

    -- Title
    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.Text = "  " .. self.Title
    TitleLabel.Size = UDim2.new(1, -40, 1, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Close Button
    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -32, 0, 2.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    Instance.new("UICorner", CloseBtn)
    CloseBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
    end)

    -- Tab Bar
    local TabBar = Instance.new("Frame", Main)
    TabBar.Size = UDim2.new(1, -20, 0, 30)
    TabBar.Position = UDim2.new(0, 10, 0, 45)
    TabBar.BackgroundTransparency = 1
    
    local TabLayout = Instance.new("UIListLayout", TabBar)
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.Padding = UDim.new(0, 5)

    -- Container
    local Container = Instance.new("Frame", Main)
    Container.Position = UDim2.new(0, 10, 0, 85)
    Container.Size = UDim2.new(1, -20, 1, -95)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true

    -- Add Tab Function
    function self:AddTab(name)
        local tabObj = {}
        
        local Page = Instance.new("ScrollingFrame", Container)
        Page.Name = name
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 4
        Page.BorderSizePixel = 0
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        
        local PageLayout = Instance.new("UIListLayout", Page)
        PageLayout.Padding = UDim.new(0, 6)
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
        end)

        local TabBtn = Instance.new("TextButton", TabBar)
        TabBtn.Size = UDim2.new(0, 100, 1, 0)
        TabBtn.Text = name
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TabBtn.TextColor3 = Color3.new(1, 1, 1)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize = 12
        Instance.new("UICorner", TabBtn)

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do 
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            for _, b in pairs(TabBar:GetChildren()) do 
                if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end
            end
            Page.Visible = true
            TabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)

        -- Add Button
        function tabObj:AddButton(data)
            local col = ColorMap[string.lower(data.Color or "graphite")] or ColorMap["graphite"]
            local btn = Instance.new("TextButton", Page)
            btn.Size = UDim2.new(1, -5, 0, 35)
            btn.BackgroundColor3 = col
            btn.Text = data.Title
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 13
            Instance.new("UICorner", btn)
            btn.MouseButton1Click:Connect(function()
                if data.Callback then pcall(data.Callback) end
            end)
        end

        -- Add Toggle
        function tabObj:AddToggle(data)
            local state = data.Default or false
            local tFrame = Instance.new("Frame", Page)
            tFrame.Size = UDim2.new(1, -5, 0, 40)
            tFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", tFrame)
            
            local label = Instance.new("TextLabel", tFrame)
            label.Text = "  " .. data.Title
            label.Size = UDim2.new(1, -55, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 1, 1)
            label.Font = Enum.Font.GothamMedium
            label.TextSize = 12
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local switch = Instance.new("TextButton", tFrame)
            switch.Size = UDim2.new(0, 40, 0, 20)
            switch.Position = UDim2.new(1, -45, 0.5, -10)
            switch.Text = ""
            switch.BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)
            Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)
            
            switch.MouseButton1Click:Connect(function()
                state = not state
                TweenService:Create(switch, info, {
                    BackgroundColor3 = state and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(45, 45, 45)
                }):Play()
                if data.Callback then pcall(function() data.Callback(state) end) end
            end)
        end

        -- Add Slider
        function tabObj:AddSlider(data)
            local val = data.Default or data.Min
            local sFrame = Instance.new("Frame", Page)
            sFrame.Size = UDim2.new(1, -5, 0, 50)
            sFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", sFrame)
            
            local title = Instance.new("TextLabel", sFrame)
            title.Text = "  " .. data.Title .. ": " .. val
            title.Size = UDim2.new(1, 0, 0.5, 0)
            title.BackgroundTransparency = 1
            title.TextColor3 = Color3.new(1, 1, 1)
            title.Font = Enum.Font.GothamMedium
            title.TextSize = 12
            title.TextXAlignment = Enum.TextXAlignment.Left
            
            local bar = Instance.new("Frame", sFrame)
            bar.Size = UDim2.new(0.9, 0, 0, 6)
            bar.Position = UDim2.new(0.05, 0, 0.7, 0)
            bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Instance.new("UICorner", bar)
            
            local fill = Instance.new("Frame", bar)
            fill.Size = UDim2.new((val - data.Min) / (data.Max - data.Min), 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
            Instance.new("UICorner", fill)
            
            local function update(input)
                local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                val = math.floor(data.Min + (data.Max - data.Min) * pos)
                fill.Size = UDim2.new(pos, 0, 1, 0)
                title.Text = "  " .. data.Title .. ": " .. val
                if data.Callback then pcall(function() data.Callback(val) end) end
            end
            
            bar.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or 
                   i.UserInputType == Enum.UserInputType.Touch then
                    local conn = UIS.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement or 
                           input.UserInputType == Enum.UserInputType.Touch then
                            update(input)
                        end
                    end)
                    UIS.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
                           input.UserInputType == Enum.UserInputType.Touch then
                            conn:Disconnect()
                        end
                    end)
                end
            end)
        end

        -- Add Input
        function tabObj:AddInput(data)
            local box = Instance.new("TextBox", Page)
            box.Size = UDim2.new(1, -5, 0, data.Height or 40)
            box.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            box.Text = ""
            box.PlaceholderText = data.Placeholder or "Enter text..."
            box.TextColor3 = Color3.new(1, 1, 1)
            box.Font = Enum.Font.Code
            box.TextSize = 12
            box.TextXAlignment = Enum.TextXAlignment.Left
            box.TextYAlignment = (data.Height or 40) > 60 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
            box.MultiLine = (data.Height or 40) > 60
            box.ClearTextOnFocus = false
            Instance.new("UICorner", box)
            
            local padding = Instance.new("UIPadding", box)
            padding.PaddingLeft = UDim.new(0, 8)
            padding.PaddingRight = UDim.new(0, 8)
            padding.PaddingTop = UDim.new(0, 8)
            padding.PaddingBottom = UDim.new(0, 8)
            
            box.FocusLost:Connect(function()
                if data.Callback then pcall(function() data.Callback(box.Text) end) end
            end)
        end

        if not self.CurrentTab then 
            Page.Visible = true
            self.CurrentTab = Page
            TabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end
        
        return tabObj
    end
    
    return self
end

-- [[ TEST THE LIBRARY ]]
print("✅ Apex Library Embedded Successfully!")

local Window = Apex:CreateWindow({
    Title = "⚡ Apex Universal Executor",
    Keybind = Enum.KeyCode.RightControl
})

local Home = Window:AddTab("Home")

Home:AddButton({
    Title = "✅ Library Loaded Successfully!",
    Color = "emerald",
    Callback = function()
        print("Library is working!")
    end
})

Home:AddButton({
    Title = "🌪️ Load FTAP Hub",
    Color = "blue",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/main/FTAPHub.lua"))()
    end
})

Home:AddButton({
    Title = "👻 Load Ghost Hub",
    Color = "purple",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/Ghosthub.lua"))()
    end
})

Home:AddToggle({
    Title = "Test Toggle",
    Default = false,
    Callback = function(state)
        print("Toggle:", state)
    end
})

Home:AddSlider({
    Title = "Test Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(val)
        print("Slider:", val)
    end
})

Home:AddInput({
    Title = "Script Executor",
    Placeholder = "Paste code here...",
    Height = 100,
    Callback = function(text)
        loadstring(text)()
    end
})

print([[
═══════════════════════════════════════════════════════════════════════
    ⚡ APEX LIBRARY EMBEDDED VERSION
    ───────────────────────────────────────────────────────────────────
    ✅ Library embedded directly in script
    ✅ No external loading required
    ✅ Works offline
    ✅ Press RightControl to toggle
    ───────────────────────────────────────────────────────────────────
    If this works, the issue was with GitHub access
    Try the hubs now!
═══════════════════════════════════════════════════════════════════════
]])
