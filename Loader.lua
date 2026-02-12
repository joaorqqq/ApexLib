-- [[ APEX ELITE LOADER - joaorqqq ]]

local function GetExecutor()
    return (identifyexecutor and identifyexecutor()) or (syn and "Synapse X") or "Executor Desconhecido"
end

local function Init()
    local executor = GetExecutor()
    
    -- Splash Screen de Boas-vindas
    local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 250, 0, 80); frame.Position = UDim2.new(0.5, -125, 0.5, -40); frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", frame)
    local l = Instance.new("TextLabel", frame); l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(1, 1, 1); l.Font = "GothamBold"; l.TextSize = 14
    l.Text = "APEX ELITE\n" .. executor
    
    task.wait(1.2)
    sg:Destroy()

    -- Puxa o arquivo que acabaste de hospedar
    local link = "https://raw.githubusercontent.com/joaorqqq/ApexLib/main/ApexLib.lua"
    return loadstring(game:HttpGet(link))()
end

return Init()

