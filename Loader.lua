-- [[ APEX ELITE LOADER - REFACTORED ]]
-- Improved readability and robust error handling

local function get_executor()
    return (identifyexecutor and identifyexecutor()) or (syn and "Synapse X") or "Unknown Executor"
end

local function create_splash_screen(executor_name)
    local core_gui = game:GetService("CoreGui")
    local tween_service = game:GetService("TweenService")
    
    local sg = Instance.new("ScreenGui", core_gui)
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 250, 0, 80)
    frame.Position = UDim2.new(0.5, -125, 0.5, -40)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", frame)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Text = "APEX ELITE\n" .. executor_name
    label.TextTransparency = 1
    
    -- Smooth Fade In
    tween_service:Create(label, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(1.8)
    
    -- Smooth Fade Out
    tween_service:Create(label, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    sg:Destroy()
end

local function initialize_apex()
    local executor = get_executor()
    create_splash_screen(executor)
    
    local library_url = "https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"
    
    -- Improved Error Handling
    local success, content = pcall(game.HttpGet, game, library_url)
    
    if not success then
        warn("🌑 [APEX ERROR]: Failed to fetch library from GitHub.")
        return nil
    end
    
    local load_success, library = pcall(loadstring(content))
    
    if not load_success then
        warn("🌑 [APEX ERROR]: Syntax error in library content.")
        return nil
    end
    
    return library
end

return initialize_apex()
