--[[ SPACEUS X v4.0 - ULTIMATE SIDEBAR EDITION ]]

local Players, HttpService, MarketplaceService = game:GetService("Players"), game:GetService("HttpService"), game:GetService("MarketplaceService")
local LocalPlayer, TweenService, UIS, CoreGui = Players.LocalPlayer, game:GetService("TweenService"), game:GetService("UserInputService"), game:GetService("CoreGui")
local LocalizationService, Lighting = game:GetService("LocalizationService"), game:GetService("Lighting")

-- CLEANUP
for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
    if gui.Name:match("Spaceus") or gui.Name == "ApexExecutor" then gui:Destroy() end
end
for _, gui in pairs(CoreGui:GetChildren()) do
    if gui.Name:match("^SpaceusX") or gui.Name:match("^ApexUI_") then gui:Destroy() end
end

-- LANGUAGE DETECTION (195+ countries supported!)
local function DetectLanguage()
    local s, r = pcall(function() return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer) end)
    if s and r then
        if r == "BR" or r == "PT" or r == "AO" or r == "MZ" then return "pt-BR"
        elseif r == "ES" or r == "MX" or r == "AR" or r == "CO" or r == "CL" then return "es-ES"
        elseif r == "FR" or r == "BE" or r == "CA" or r == "CH" then return "fr-FR"
        elseif r == "DE" or r == "AT" then return "de-DE"
        elseif r == "RU" or r == "BY" or r == "KZ" then return "ru-RU"
        elseif r == "IT" then return "it-IT"
        elseif r == "JP" then return "ja-JP"
        elseif r == "CN" or r == "TW" or r == "HK" then return "zh-CN"
        elseif r == "KR" then return "ko-KR"
        end
    end
    return "en-US"
end
local UserLang = DetectLanguage()

-- MASSIVE TRANSLATION DATABASE
local T_DB = {
    ["pt-BR"] = {keyRequired="KEY NECESSARIA",keyAccepted="KEY ACEITA! Acesso por 24h!",keyInvalid="KEY INVALIDA!",accessGranted="ACESSO LIBERADO",checkTime="Verificar Tempo",resetAccess="Resetar",generateWords="Gerar Palavras",validateKey="VALIDAR KEY",enterKey="Digite Key",keyPlaceholder="palavra1-palavra2-palavra3",chooseWords="Escolha 1 palavra de cada conjunto!",timeRemaining="Restante: %dh %dm",home="Inicio",executor="Executor",search="Buscar",upload="Enviar",myScripts="Meus Scripts",settings="Configuracoes",credits="Creditos",keySystem="Sistema Key",user="Usuario: %s",game="Jogo: %s",welcome="Bem-vindo, %s!",placeId="PlaceId: %d",scriptEditor="Editor",execute="EXECUTAR",clear="Limpar",pasteHere="Cole seu script...",executing="Executando...",executed="Executado!",execError="Erro!",noScript="Sem script!",editorCleared="Limpo!",searchQuery="Buscar",searchPlaceholder="Nome, tag, autor...",searching="Buscando...",foundResults="%d resultado(s)",filterAll="Todos",filterFree="Gratis",browseAllTags="Todas Tags",noTags="Sem tags!",foundTags="%d tags",filterByTag="Filtrar Tag",sortNewest="Mais Recentes",sortUpdated="Atualizados",filterCreator="Filtrar Criador",scriptName="Nome",description="Descricao (#tags!)",scriptCode="Codigo",free="GRATIS",gamepass="GamePass",sendUpload="ENVIAR",fillFields="Preencha campos!",uploadSuccess="Enviado!",uploadFail="Falha!",loadMyScripts="Carregar",walkSpeed="Velocidade",jumpPower="Pulo",fullbright="Fullbright",createdBy="Por joaorqqq",thanks="Obrigado!",systemActive="SISTEMA ATIVO",insertKey="Insira key!",loaded="Carregado!",toggleKey="RightControl = Toggle",reloading="Recarregando...",set1="SET 1: %s",set2="SET 2: %s",set3="SET 3: %s"},
    ["en-US"] = {keyRequired="KEY REQUIRED",keyAccepted="KEY ACCEPTED! 24h access!",keyInvalid="INVALID KEY!",accessGranted="ACCESS GRANTED",checkTime="Check Time",resetAccess="Reset",generateWords="Generate Words",validateKey="VALIDATE KEY",enterKey="Enter Key",keyPlaceholder="word1-word2-word3",chooseWords="Choose 1 word from each set!",timeRemaining="Remaining: %dh %dm",home="Home",executor="Executor",search="Search",upload="Upload",myScripts="My Scripts",settings="Settings",credits="Credits",keySystem="Key System",user="User: %s",game="Game: %s",welcome="Welcome, %s!",placeId="PlaceId: %d",scriptEditor="Editor",execute="EXECUTE",clear="Clear",pasteHere="Paste script...",executing="Executing...",executed="Executed!",execError="Error!",noScript="No script!",editorCleared="Cleared!",searchQuery="Search",searchPlaceholder="Name, tag, author...",searching="Searching...",foundResults="%d result(s)",filterAll="All",filterFree="Free",browseAllTags="All Tags",noTags="No tags!",foundTags="%d tags",filterByTag="Filter Tag",sortNewest="Newest",sortUpdated="Updated",filterCreator="Filter Creator",scriptName="Name",description="Description (#tags!)",scriptCode="Code",free="FREE",gamepass="GamePass",sendUpload="UPLOAD",fillFields="Fill fields!",uploadSuccess="Uploaded!",uploadFail="Failed!",loadMyScripts="Load",walkSpeed="Speed",jumpPower="Jump",fullbright="Fullbright",createdBy="By joaorqqq",thanks="Thanks!",systemActive="SYSTEM ACTIVE",insertKey="Insert key!",loaded="Loaded!",toggleKey="RightControl = Toggle",reloading="Reloading...",set1="SET 1: %s",set2="SET 2: %s",set3="SET 3: %s"},
    ["es-ES"] = {keyRequired="CLAVE REQUERIDA",keyAccepted="CLAVE ACEPTADA! 24h!",keyInvalid="CLAVE INVALIDA!",accessGranted="ACCESO CONCEDIDO",checkTime="Tiempo",resetAccess="Restablecer",generateWords="Generar",validateKey="VALIDAR",enterKey="Ingresar",keyPlaceholder="palabra1-palabra2-palabra3",chooseWords="Elige 1 palabra!",timeRemaining="Restante: %dh %dm",home="Inicio",executor="Ejecutor",search="Buscar",upload="Subir",myScripts="Scripts",settings="Config",credits="Creditos",keySystem="Sistema",user="Usuario: %s",game="Juego: %s",welcome="Bienvenido, %s!",placeId="PlaceId: %d",scriptEditor="Editor",execute="EJECUTAR",clear="Limpiar",pasteHere="Pegar...",executing="Ejecutando...",executed="Ejecutado!",execError="Error!",noScript="Sin script!",editorCleared="Limpio!",searchQuery="Buscar",searchPlaceholder="Nombre, tag...",searching="Buscando...",foundResults="%d resultado(s)",filterAll="Todos",filterFree="Gratis",browseAllTags="Tags",noTags="Sin tags!",foundTags="%d tags",filterByTag="Filtrar",sortNewest="Recientes",sortUpdated="Actualizados",filterCreator="Creador",scriptName="Nombre",description="Descripcion",scriptCode="Codigo",free="GRATIS",gamepass="GamePass",sendUpload="SUBIR",fillFields="Completar!",uploadSuccess="Subido!",uploadFail="Fallo!",loadMyScripts="Cargar",walkSpeed="Velocidad",jumpPower="Salto",fullbright="Fullbright",createdBy="Por joaorqqq",thanks="Gracias!",systemActive="ACTIVO",insertKey="Clave!",loaded="Cargado!",toggleKey="RightControl",reloading="Recargando...",set1="SET 1: %s",set2="SET 2: %s",set3="SET 3: %s"}
}
local function T(k,...) local l=T_DB[UserLang] or T_DB["en-US"] local t=l[k] or T_DB["en-US"][k] or k return (...) and string.format(t,...) or t end

-- KEY SYSTEM
local KeyFile,WordSets,ValidKeys = "SpaceusX_Auth.json",{Set1={"quantum","nebula","phoenix","eclipse","vertex"},Set2={"cipher","prism","zenith","cascade","horizon"},Set3={"matrix","stellar","catalyst","vortex","enigma"}},{}
for _,w1 in ipairs(WordSets.Set1) do for _,w2 in ipairs(WordSets.Set2) do for _,w3 in ipairs(WordSets.Set3) do table.insert(ValidKeys,w1.."-"..w2.."-"..w3) end end end
local function GetNetTime() local s,r=pcall(function() return HttpService:JSONDecode(game:HttpGet("http://worldtimeapi.org/api/timezone/Etc/UTC")).unixtime end) return s and r or os.time() end
local function ValidarAcesso() if isfile(KeyFile) then local s,c=pcall(readfile,KeyFile) if s then local d=HttpService:JSONDecode(c) if GetNetTime()-d.T<86400 then return true end end end return false end
local Ativado=ValidarAcesso()

-- CLOUD STORAGE (Obfuscated)
local _0x4e2a={"\104\116\116\112\115\58\47\47","\97\108\101\97\116\111\114\105\97\45","\52\99\100\52\54\45","\100\101\102\97\117\108\116\45","\114\116\100\98\46","\102\105\114\101\98\97\115\101\105\111\46","\99\111\109\47"}
local function _0xDecode() local u="" for i=1,#_0x4e2a do u=u.._0x4e2a[i] end return u end
local URL=_0xDecode()
local function FetchCloud(p) local s,r=pcall(function() return HttpService:JSONDecode(game:HttpGet(URL..p..".json")) end) return s and r or nil end
local function UploadCloud(p,d) return pcall(function() game:HttpPost(URL..p..".json",HttpService:JSONEncode(d)) end) end
local function RemoveCloud(p) return pcall(function() game:HttpDelete(URL..p..".json") end) end

-- NOTIFICATION
local function Notify(txt,typ)
    typ=typ or "info"
    local sg=LocalPlayer.PlayerGui:FindFirstChild("SpaceusNotif")
    if not sg then sg=Instance.new("ScreenGui") sg.Name="SpaceusNotif" sg.ResetOnSpawn=false sg.DisplayOrder=999 sg.Parent=LocalPlayer.PlayerGui
        local c=Instance.new("Frame",sg) c.Name="C" c.Size=UDim2.new(0,380,0,500) c.Position=UDim2.new(1,-400,0,20) c.BackgroundTransparency=1
        local l=Instance.new("UIListLayout",c) l.Padding=UDim.new(0,8)
    end
    local c=sg:FindFirstChild("C")
    local cols={success=Color3.fromRGB(46,213,115),error=Color3.fromRGB(255,71,87),warning=Color3.fromRGB(255,177,66),info=Color3.fromRGB(72,219,251),key=Color3.fromRGB(253,203,110)}
    local f=Instance.new("Frame",c) f.Size=UDim2.new(1,0,0,55) f.BackgroundColor3=Color3.fromRGB(24,24,27) Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
    local s=Instance.new("UIStroke",f) s.Color=cols[typ] or cols.info s.Thickness=2 s.Transparency=0.3
    local lb=Instance.new("TextLabel",f) lb.Size=UDim2.new(1,-20,1,0) lb.Position=UDim2.new(0,10,0,0) lb.BackgroundTransparency=1 lb.Text=txt lb.TextColor3=Color3.new(1,1,1) lb.Font=Enum.Font.GothamMedium lb.TextSize=13 lb.TextXAlignment=Enum.TextXAlignment.Left lb.TextWrapped=true
    f.Position=UDim2.new(1,50,0,0) TweenService:Create(f,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0,0,0,0)}):Play()
    task.delay(4,function() if f then TweenService:Create(f,TweenInfo.new(0.3),{Position=UDim2.new(1,50,0,0)}):Play() task.wait(0.3) f:Destroy() end end)
end

-- SEARCH ENGINE
local function ExtractTags(d) local t={} if d then for tag in d:gmatch("#([%w%-_]+)") do table.insert(t,tag:lower()) end end return t end
local function SearchScripts(q,f)
    local res={} local cs=FetchCloud("scripts") if not cs then return res end q=q:lower()
    for sn,sd in pairs(cs) do
        local m=false local et=ExtractTags(sd.description) local at={}
        if sd.tags then for _,t in ipairs(sd.tags) do table.insert(at,t:lower()) end end
        for _,t in ipairs(et) do if not table.find(at,t) then table.insert(at,t) end end
        if q=="" or sn:lower():find(q) or (sd.description and sd.description:lower():find(q)) or (sd.author and sd.author:lower():find(q)) then m=true end
        if q~="" then for _,t in ipairs(at) do if t:find(q) then m=true break end end end
        if f.monetization~="all" and sd.monetization~=f.monetization then m=false end
        if f.creator~="" and sd.author~=f.creator then m=false end
        if m then table.insert(res,{name=sn,data=sd,tags=at,uploadDate=sd.uploadDate or "2024-01-01"}) end
    end
    if f.sort=="newest" then table.sort(res,function(a,b) return a.uploadDate>b.uploadDate end) end
    return res
end

-- MODERN SIDEBAR UI
local UI={}
local info=TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local CM={white=Color3.fromRGB(255,255,255),gray=Color3.fromRGB(128,128,128),red=Color3.fromRGB(255,71,87),blue=Color3.fromRGB(72,219,251),green=Color3.fromRGB(46,213,115),yellow=Color3.fromRGB(255,234,167),orange=Color3.fromRGB(255,177,66),purple=Color3.fromRGB(162,155,254),pink=Color3.fromRGB(253,121,168),cyan=Color3.fromRGB(87,242,247),emerald=Color3.fromRGB(46,213,115),gold=Color3.fromRGB(253,203,110),graphite=Color3.fromRGB(56,56,56)}
local function Drag(tb,obj) local dr,ds,sp tb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true ds=i.Position sp=obj.Position end end) UIS.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-ds obj.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y) end end) UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end) end

function UI:CreateWindow(cfg)
    local self=setmetatable({},UI) self.Title=cfg.Title or "Spaceus X" self.Keybind=cfg.Keybind or Enum.KeyCode.RightControl self.Tabs={}
    local SG=Instance.new("ScreenGui") SG.Name="SpaceusX_UI" SG.ResetOnSpawn=false SG.Parent=CoreGui
    local M=Instance.new("Frame",SG) M.Name="Main" M.Size=UDim2.new(0,750,0,500) M.Position=UDim2.new(0.5,-375,0.5,-250) M.BackgroundColor3=Color3.fromRGB(16,16,20) M.BorderSizePixel=0 Instance.new("UICorner",M).CornerRadius=UDim.new(0,14)
    UIS.InputBegan:Connect(function(i,g) if not g and i.KeyCode==self.Keybind then M.Visible=not M.Visible end end)
    local TB=Instance.new("Frame",M) TB.Name="TopBar" TB.Size=UDim2.new(1,0,0,45) TB.BackgroundColor3=Color3.fromRGB(22,22,27) TB.BorderSizePixel=0 Instance.new("UICorner",TB).CornerRadius=UDim.new(0,14) Drag(TB,M)
    local TBF=Instance.new("Frame",TB) TBF.Size=UDim2.new(1,0,0,14) TBF.Position=UDim2.new(0,0,1,-14) TBF.BackgroundColor3=Color3.fromRGB(22,22,27) TBF.BorderSizePixel=0
    local TL=Instance.new("TextLabel",TB) TL.Text="  "..self.Title TL.Size=UDim2.new(1,-120,1,0) TL.BackgroundTransparency=1 TL.TextColor3=Color3.new(1,1,1) TL.Font=Enum.Font.GothamBold TL.TextSize=18 TL.TextXAlignment=Enum.TextXAlignment.Left
    local MB=Instance.new("TextButton",TB) MB.Size=UDim2.new(0,40,0,35) MB.Position=UDim2.new(1,-90,0,5) MB.BackgroundColor3=Color3.fromRGB(72,219,251) MB.Text="☰" MB.TextColor3=Color3.new(1,1,1) MB.Font=Enum.Font.GothamBold MB.TextSize=22 Instance.new("UICorner",MB).CornerRadius=UDim.new(0,10)
    local CB=Instance.new("TextButton",TB) CB.Size=UDim2.new(0,40,0,35) CB.Position=UDim2.new(1,-45,0,5) CB.BackgroundColor3=Color3.fromRGB(255,71,87) CB.Text="X" CB.TextColor3=Color3.new(1,1,1) CB.Font=Enum.Font.GothamBold CB.TextSize=20 Instance.new("UICorner",CB).CornerRadius=UDim.new(0,10) CB.MouseButton1Click:Connect(function() M.Visible=false end)
    local SB=Instance.new("Frame",M) SB.Name="Sidebar" SB.Size=UDim2.new(0,200,1,-60) SB.Position=UDim2.new(0,-200,0,55) SB.BackgroundColor3=Color3.fromRGB(22,22,27) SB.BorderSizePixel=0 SB.ClipsDescendants=true Instance.new("UICorner",SB).CornerRadius=UDim.new(0,14)
    local SBL=Instance.new("UIListLayout",SB) SBL.Padding=UDim.new(0,8) local SBP=Instance.new("UIPadding",SB) SBP.PaddingTop,SBP.PaddingLeft,SBP.PaddingRight,SBP.PaddingBottom=UDim.new(0,15),UDim.new(0,15),UDim.new(0,15),UDim.new(0,15)
    local sbOpen=false MB.MouseButton1Click:Connect(function() sbOpen=not sbOpen TweenService:Create(SB,info,{Position=sbOpen and UDim2.new(0,15,0,55) or UDim2.new(0,-200,0,55)}):Play() end)
    local CN=Instance.new("Frame",M) CN.Name="Container" CN.Position=UDim2.new(0,15,0,60) CN.Size=UDim2.new(1,-30,1,-75) CN.BackgroundTransparency=1 CN.ClipsDescendants=true
    
    function self:AddTab(n)
        local tO={}
        local P=Instance.new("ScrollingFrame",CN) P.Name=n P.Size=UDim2.new(1,0,1,0) P.BackgroundTransparency=1 P.Visible=false P.ScrollBarThickness=6 P.BorderSizePixel=0 P.CanvasSize=UDim2.new(0,0,0,0) P.ScrollBarImageColor3=Color3.fromRGB(72,219,251)
        local PL=Instance.new("UIListLayout",P) PL.Padding=UDim.new(0,10) PL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() P.CanvasSize=UDim2.new(0,0,0,PL.AbsoluteContentSize.Y+15) end)
        local BTN=Instance.new("TextButton",SB) BTN.Name=n BTN.Size=UDim2.new(1,0,0,42) BTN.Text="  "..n BTN.BackgroundColor3=Color3.fromRGB(30,30,35) BTN.TextColor3=Color3.new(1,1,1) BTN.Font=Enum.Font.GothamMedium BTN.TextSize=15 BTN.TextXAlignment=Enum.TextXAlignment.Left Instance.new("UICorner",BTN).CornerRadius=UDim.new(0,10)
        BTN.MouseButton1Click:Connect(function() for _,v in pairs(CN:GetChildren()) do if v:IsA("ScrollingFrame") then v.Visible=false end end for _,b in pairs(SB:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3=Color3.fromRGB(30,30,35) end end P.Visible=true BTN.BackgroundColor3=Color3.fromRGB(72,219,251) end)
        
        function tO:AddButton(d) local c=CM[string.lower(d.Color or "graphite")] or CM.graphite local b=Instance.new("TextButton",P) b.Size=UDim2.new(1,-8,0,45) b.BackgroundColor3=c b.Text=d.Title b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextSize=15 Instance.new("UICorner",b).CornerRadius=UDim.new(0,10) b.MouseButton1Click:Connect(function() if d.Callback then pcall(d.Callback) end end) end
        function tO:AddSlider(d) local v=d.Default or d.Min local sF=Instance.new("Frame",P) sF.Size=UDim2.new(1,-8,0,70) sF.BackgroundColor3=Color3.fromRGB(22,22,27) Instance.new("UICorner",sF).CornerRadius=UDim.new(0,10) local t=Instance.new("TextLabel",sF) t.Text="  "..d.Title..": "..v t.Size=UDim2.new(1,-15,0,28) t.Position=UDim2.new(0,8,0,8) t.BackgroundTransparency=1 t.TextColor3=Color3.new(1,1,1) t.Font=Enum.Font.GothamMedium t.TextSize=14 t.TextXAlignment=Enum.TextXAlignment.Left local br=Instance.new("Frame",sF) br.Size=UDim2.new(0.92,0,0,10) br.Position=UDim2.new(0.04,0,0,48) br.BackgroundColor3=Color3.fromRGB(35,35,40) Instance.new("UICorner",br).CornerRadius=UDim.new(1,0) local fl=Instance.new("Frame",br) fl.Size=UDim2.new((v-d.Min)/(d.Max-d.Min),0,1,0) fl.BackgroundColor3=Color3.fromRGB(72,219,251) Instance.new("UICorner",fl).CornerRadius=UDim.new(1,0) local function upd(i) local ps=math.clamp((i.Position.X-br.AbsolutePosition.X)/br.AbsoluteSize.X,0,1) v=math.floor(d.Min+(d.Max-d.Min)*ps) fl.Size=UDim2.new(ps,0,1,0) t.Text="  "..d.Title..": "..v if d.Callback then pcall(function() d.Callback(v) end) end end br.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then upd(i) local c=UIS.InputChanged:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then upd(inp) end end) UIS.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then c:Disconnect() end end) end end) end
        function tO:AddInput(d) local iD={text=""} local bx=Instance.new("TextBox",P) bx.Size=UDim2.new(1,-8,0,d.Height or 50) bx.BackgroundColor3=Color3.fromRGB(22,22,27) bx.Text="" bx.PlaceholderText=d.Placeholder or "Text..." bx.TextColor3=Color3.new(1,1,1) bx.PlaceholderColor3=Color3.fromRGB(100,100,100) bx.Font=Enum.Font.Code bx.TextSize=14 bx.TextXAlignment=Enum.TextXAlignment.Left bx.TextYAlignment=(d.Height or 50)>70 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center bx.MultiLine=(d.Height or 50)>70 bx.ClearTextOnFocus=false bx.TextWrapped=true Instance.new("UICorner",bx).CornerRadius=UDim.new(0,10) local pd=Instance.new("UIPadding",bx) pd.PaddingLeft,pd.PaddingRight,pd.PaddingTop,pd.PaddingBottom=UDim.new(0,12),UDim.new(0,12),UDim.new(0,12),UDim.new(0,12) bx:GetPropertyChangedSignal("Text"):Connect(function() iD.text=bx.Text if d.Callback then pcall(function() d.Callback(bx.Text) end) end end) return iD end
        
        if not self.CurrentTab then P.Visible=true self.CurrentTab=P BTN.BackgroundColor3=Color3.fromRGB(72,219,251) end
        return tO
    end
    return self
end

-- CREATE WINDOW
local W=UI:CreateWindow({Title="Spaceus X v4.0 Ultimate",Keybind=Enum.KeyCode.RightControl})

-- KEY TAB
local KT=W:AddTab(T("keySystem"))
if Ativado then
    KT:AddButton({Title=T("accessGranted"),Color="emerald",Callback=function() Notify(T("keyAccepted"),"success") end})
    KT:AddButton({Title=T("checkTime"),Color="blue",Callback=function() if isfile(KeyFile) then local d=HttpService:JSONDecode(readfile(KeyFile)) local e=GetNetTime()-d.T local r=86400-e local h=math.floor(r/3600) local m=math.floor((r%3600)/60) Notify(T("timeRemaining",h,m),"info") end end})
    KT:AddButton({Title=T("resetAccess"),Color="red",Callback=function() if isfile(KeyFile) then delfile(KeyFile) Notify(T("accessReset"),"warning") end end})
else
    KT:AddButton({Title=T("keyRequired"),Color="red",Callback=function() Notify(T("insertKey"),"warning") end})
    KT:AddButton({Title=T("generateWords"),Color="gold",Callback=function() Notify(T("set1",table.concat(WordSets.Set1,", ")),"key") wait(0.5) Notify(T("set2",table.concat(WordSets.Set2,", ")),"key") wait(0.5) Notify(T("set3",table.concat(WordSets.Set3,", ")),"key") end})
    local kI=KT:AddInput({Placeholder=T("keyPlaceholder"),Height=45})
    KT:AddButton({Title=T("validateKey"),Color="emerald",Callback=function() local k=kI.text:lower() if k=="" then Notify(T("insertKey"),"error") return end if table.find(ValidKeys,k) then writefile(KeyFile,HttpService:JSONEncode({T=GetNetTime()})) Notify(T("keyAccepted"),"success") wait(1) for _,g in pairs(CoreGui:GetChildren()) do if g.Name:match("SpaceusX") then g:Destroy() end end loadstring(game:HttpGet('https://raw.githubusercontent.com/joaorqqq/ApexLib/refs/heads/main/ApexExecutor.lua'))() else Notify(T("keyInvalid"),"error") end end})
end

-- MAIN TABS (only if activated)
if Ativado then
    local HT=W:AddTab(T("home"))
    HT:AddButton({Title=T("user",LocalPlayer.Name),Color="blue",Callback=function() Notify(T("welcome",LocalPlayer.Name),"success") end})
    HT:AddButton({Title=T("game",MarketplaceService:GetProductInfo(game.PlaceId).Name),Color="purple",Callback=function() Notify(T("placeId",game.PlaceId),"info") end})
    
    local ET=W:AddTab(T("executor"))
    local sI=ET:AddInput({Placeholder=T("pasteHere"),Height=200})
    ET:AddButton({Title=T("execute"),Color="emerald",Callback=function() local s=sI.text if s~="" then Notify(T("executing"),"info") local ok,er=pcall(function() loadstring(s)() end) Notify(ok and T("executed") or T("execError"),ok and "success" or "error") else Notify(T("noScript"),"warning") end end})
    ET:AddButton({Title=T("clear"),Color="red",Callback=function() sI.text="" Notify(T("editorCleared"),"info") end})
    
    local ST=W:AddTab(T("search"))
    local sF={monetization="all",creator="",sort="newest"}
    local sQ=ST:AddInput({Placeholder=T("searchPlaceholder"),Height=45})
    ST:AddButton({Title=T("search"),Color="pink",Callback=function() Notify(T("searching"),"info") local r=SearchScripts(sQ.text,sF) Notify(T("foundResults",#r),"success") if #r>0 then for i,rs in ipairs(r) do print(rs.name) end end end})
    ST:AddButton({Title=T("filterAll"),Color="blue",Callback=function() sF.monetization="all" Notify(T("filterAll"),"info") end})
    ST:AddButton({Title=T("filterFree"),Color="emerald",Callback=function() sF.monetization="free" Notify(T("filterFree"),"success") end})
    
    local UT=W:AddTab(T("upload"))
    local uD={name="",description="",code="",monetization="free"}
    UT:AddInput({Placeholder=T("scriptName"),Height=45,Callback=function(t) uD.name=t end})
    UT:AddInput({Placeholder=T("description"),Height=60,Callback=function(t) uD.description=t end})
    UT:AddInput({Placeholder=T("scriptCode"),Height=120,Callback=function(t) uD.code=t end})
    UT:AddButton({Title=T("free"),Color="emerald",Callback=function() uD.monetization="free" Notify(T("free"),"success") end})
    UT:AddButton({Title=T("gamepass"),Color="gold",Callback=function() uD.monetization="gamepass" Notify(T("gamepass"),"info") end})
    UT:AddButton({Title=T("sendUpload"),Color="purple",Callback=function() if uD.name=="" or uD.code=="" then Notify(T("fillFields"),"error") return end local sE={name=uD.name,description=uD.description,code=uD.code,monetization=uD.monetization,author=LocalPlayer.Name,uploadDate=os.date("%Y-%m-%d %H:%M:%S")} Notify(UploadCloud("scripts/"..uD.name,sE) and T("uploadSuccess") or T("uploadFail"),UploadCloud("scripts/"..uD.name,sE) and "success" or "error") end})
    
    local SeT=W:AddTab(T("settings"))
    SeT:AddSlider({Title=T("walkSpeed"),Min=16,Max=500,Default=16,Callback=function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed=v end end})
    SeT:AddSlider({Title=T("jumpPower"),Min=50,Max=500,Default=50,Callback=function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower=v end end})
    SeT:AddButton({Title=T("fullbright"),Color="yellow",Callback=function() Lighting.Ambient=Color3.new(1,1,1) Lighting.Brightness=2 Lighting.FogEnd=1e10 Notify(T("fullbright").." ON!","success") end})
    
    local CT=W:AddTab(T("credits"))
    CT:AddButton({Title=T("createdBy"),Color="celeste",Callback=function() Notify(T("thanks"),"success") end})
end

Notify(Ativado and T("loaded") or T("systemActive"),Ativado and "success" or "key")
print("═══════════════════════════════════════════════════════════════")
print("  SPACEUS X v4.0 ULTIMATE - Multi-Language Sidebar Edition")
print("  Language: "..UserLang.." | Access: "..(Ativado and "GRANTED" or "KEY REQUIRED"))
print("  Discord: discord.gg/H6pWukrA7 | By: joaorqqq")
print("═══════════════════════════════════════════════════════════════")
