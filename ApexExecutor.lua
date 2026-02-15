--[[ Powered by GuardianLua ]]

(function(...)
local _0xzxCGTQlyVINfjVduFatU = game:GetService("\095\048\120\122\120\067\071\084\081\108\121\086\073\078\102\106\086\100\117\070\097\116\085")
local _0xdGOVNYhDuPEqudTFhTvr = game:GetService("\095\048\120\100\071\079\086\078\089\104\068\117\080\069\113\117\100\084\070\104\084\118\114")
local _0xcRvkCrPQFxWm8fJRaEWO = game:GetService("\095\048\120\099\082\118\107\067\114\080\081\070\120\087\109\056\102\074\082\097\069\087\079")
local _0xY6qjA8D0wmiZf2h7cPvs = game:GetService("\095\048\120\089\054\113\106\065\056\068\048\119\109\105\090\102\050\104\055\099\080\118\115")
local _0xei0hsxINqKXWlh89MnRQ = _0xzxCGTQlyVINfjVduFatU._0xei0hsxINqKXWlh89MnRQ
for _, gui in pairs(_0xei0hsxINqKXWlh89MnRQ.PlayerGui:GetChildren()) do
    if gui.Name == "\083\112\097\099\101\117\115\095\088\095\065\100\118\097\110\099\101\100\095\075\101\121" or gui.Name == "\065\112\101\120\069\120\101\099\117\116\111\114" or gui.Name == "\083\112\097\099\101\117\115\078\111\116\105\102\105\099\097\116\105\111\110\115" then
        gui:Destroy()
    end
end
local _0x7vj8eGnfdkbjxF1nPr0z = "\083\112\097\099\101\117\115\088\095\065\117\116\104\046\106\115\111\110"
local _0xsoieF3KOjm0BDm6rOezL = "\083\112\097\099\101\117\115\095" .. math.random(100, 999) .. "\088"
local _0xOf0y8F6ibDvhCWloJVKh = {
    Set1 = {"\113\117\097\110\116\117\109", "\110\101\098\117\108\097", "\112\104\111\101\110\105\120", "\101\099\108\105\112\115\101", "\118\101\114\116\101\120"},
    Set2 = {"\099\105\112\104\101\114", "\112\114\105\115\109", "\122\101\110\105\116\104", "\099\097\115\099\097\100\101", "\104\111\114\105\122\111\110"},
    Set3 = {"\109\097\116\114\105\120", "\115\116\101\108\108\097\114", "\099\097\116\097\108\121\115\116", "\118\111\114\116\101\120", "\101\110\105\103\109\097"}
}
local _0xkL0XOmakHtR9sJp3whbR = {}
for _, w1 in ipairs(_0xOf0y8F6ibDvhCWloJVKh.Set1) do
    for _, w2 in ipairs(_0xOf0y8F6ibDvhCWloJVKh.Set2) do
        for _, w3 in ipairs(_0xOf0y8F6ibDvhCWloJVKh.Set3) do
            table.insert(_0xkL0XOmakHtR9sJp3whbR, w1 .. "\045" .. w2 .. "\045" .. w3)
        end
    end
end
local function _0xuxw0cVSzaBs6reGb07QM()
    local _0xXE1MtbQ8Ldz9bTI8smID, result = pcall(function()
        return _0xdGOVNYhDuPEqudTFhTvr:JSONDecode(game:HttpGet("\104\116\116\112\058\047\047\119\111\114\108\100\116\105\109\101\097\112\105\046\111\114\103\047\097\112\105\047\116\105\109\101\122\111\110\101\047\069\116\099\047\085\084\067")).unixtime
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID and result or os.time()
end
local function _0xvijTcsCvFtyLDjnRWcIJ()
    if isfile(_0x7vj8eGnfdkbjxF1nPr0z) then
        local _0xXE1MtbQ8Ldz9bTI8smID, conteudo = pcall(readfile, _0x7vj8eGnfdkbjxF1nPr0z)
        if _0xXE1MtbQ8Ldz9bTI8smID then
            local _0xR8XZXXASjpx7KT1izaDe = _0xdGOVNYhDuPEqudTFhTvr:JSONDecode(conteudo)
            if _0xuxw0cVSzaBs6reGb07QM() - _0xR8XZXXASjpx7KT1izaDe.T < 86400 then
                return true
            end
        end
    end
    return false
end
local _0xLm2lRRdG3JSuNoZBQQIu = _0xvijTcsCvFtyLDjnRWcIJ()
local _0xwFLHkGwjC4ELondu2Qub, ApexLib = pcall(function()
    return loadstring(game:HttpGet("\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\106\111\097\111\114\113\113\113\047\065\112\101\120\076\105\098\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\065\112\101\120\076\105\098\046\108\117\097"))()
end)
if not _0xwFLHkGwjC4ELondu2Qub then
    warn("\9888\65039\032\070\097\105\108\101\100\032\116\111\032\108\111\097\100\032\065\112\101\120\076\105\098\033")
    return
end
local _0xN4EgTmR9dz0zU6j3DIXY = "\104\116\116\112\115\058\047\047\097\108\101\097\116\111\114\105\097\045\052\099\100\052\054\045\100\101\102\097\117\108\116\045\114\116\100\098\046\102\105\114\101\098\097\115\101\105\111\046\099\111\109\047"
local function _0xankeKvjTiE88pEiWgz1N(path)
    local _0xXE1MtbQ8Ldz9bTI8smID, result = pcall(function()
        return _0xdGOVNYhDuPEqudTFhTvr:JSONDecode(game:HttpGet(_0xN4EgTmR9dz0zU6j3DIXY .. path .. "\046\106\115\111\110"))
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID and result or nil
end
local function _0xU0sR0CrbEnWxeWvNo4IP(path, _0xR8XZXXASjpx7KT1izaDe)
    local _0xXE1MtbQ8Ldz9bTI8smID = pcall(function()
        local _0x5Xd8dPJcwEsFFLenwPxk = _0xdGOVNYhDuPEqudTFhTvr:JSONEncode(_0xR8XZXXASjpx7KT1izaDe)
        game:HttpPost(_0xN4EgTmR9dz0zU6j3DIXY .. path .. "\046\106\115\111\110", _0x5Xd8dPJcwEsFFLenwPxk)
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID
end
local function _0xoviN89PXy4hQFrmUwioH(path, _0xR8XZXXASjpx7KT1izaDe)
    local _0xXE1MtbQ8Ldz9bTI8smID = pcall(function()
        local _0x5Xd8dPJcwEsFFLenwPxk = _0xdGOVNYhDuPEqudTFhTvr:JSONEncode(_0xR8XZXXASjpx7KT1izaDe)
        game:HttpPatch(_0xN4EgTmR9dz0zU6j3DIXY .. path .. "\046\106\115\111\110", _0x5Xd8dPJcwEsFFLenwPxk)
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID
end
local function _0xioFavWGlAD8pFYweRlkE(path)
    local _0xXE1MtbQ8Ldz9bTI8smID = pcall(function()
        game:HttpDelete(_0xN4EgTmR9dz0zU6j3DIXY .. path .. "\046\106\115\111\110")
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID
end
local function _0x92hXlJqqFzsFZ90lk1KV(text, type)
    type = type or "\105\110\102\111"
    local _0xpqSbS2y39ytyXZm4tqZC = _0xei0hsxINqKXWlh89MnRQ.PlayerGui:FindFirstChild("\083\112\097\099\101\117\115\078\111\116\105\102\105\099\097\116\105\111\110\115")
    if not _0xpqSbS2y39ytyXZm4tqZC then
        _0xpqSbS2y39ytyXZm4tqZC = Instance.new("\083\099\114\101\101\110\071\117\105")
        _0xpqSbS2y39ytyXZm4tqZC.Name = "\083\112\097\099\101\117\115\078\111\116\105\102\105\099\097\116\105\111\110\115"
        _0xpqSbS2y39ytyXZm4tqZC.ResetOnSpawn = false
        _0xpqSbS2y39ytyXZm4tqZC.DisplayOrder = 999
        _0xpqSbS2y39ytyXZm4tqZC.Parent = _0xei0hsxINqKXWlh89MnRQ.PlayerGui
        local _0xFiFzSkWZwplPKjKuHT5h = Instance.new("\070\114\097\109\101", _0xpqSbS2y39ytyXZm4tqZC)
        _0xFiFzSkWZwplPKjKuHT5h.Name = "\067\111\110\116\097\105\110\101\114"
        _0xFiFzSkWZwplPKjKuHT5h.Size = UDim2.new(0, 350, 0, 400)
        _0xFiFzSkWZwplPKjKuHT5h.Position = UDim2.new(1, -370, 0, 20)
        _0xFiFzSkWZwplPKjKuHT5h.BackgroundTransparency = 1
        local _0xp1zwBTRlizzCgXzfY8cU = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116", _0xFiFzSkWZwplPKjKuHT5h)
        _0xp1zwBTRlizzCgXzfY8cU.VerticalAlignment = Enum.VerticalAlignment.Top
        _0xp1zwBTRlizzCgXzfY8cU.Padding = UDim.new(0, 5)
    end
    local _0xFiFzSkWZwplPKjKuHT5h = _0xpqSbS2y39ytyXZm4tqZC:FindFirstChild("\067\111\110\116\097\105\110\101\114")
    local _0x1l1g4NxNckhdz8rLnnuy = {
        _0xXE1MtbQ8Ldz9bTI8smID = "\9989", error = "\10060", warning = "\9888\65039", info = "\8505\65039",
        upload = "\55357\56548", script = "\55357\56540", edit = "\9999\65039", delete = "\55357\56785\65039",
        search = "\55357\56589", tag = "\55356\57335\65039", key = "\55357\56592"
    }
    local _0xzme7o3MPqYKkfQGcWyb5 = {
        _0xXE1MtbQ8Ldz9bTI8smID = Color3.fromRGB(0, 255, 136),
        error = Color3.fromRGB(255, 50, 50),
        warning = Color3.fromRGB(255, 191, 0),
        info = Color3.fromRGB(0, 170, 255),
        edit = Color3.fromRGB(138, 43, 226),
        key = Color3.fromRGB(255, 215, 0)
    }
    local _0xWKddgf4opHDWM56hBEg8 = Instance.new("\070\114\097\109\101", _0xFiFzSkWZwplPKjKuHT5h)
    _0xWKddgf4opHDWM56hBEg8.Size = UDim2.new(1, 0, 0, 40)
    _0xWKddgf4opHDWM56hBEg8.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _0xWKddgf4opHDWM56hBEg8.BackgroundTransparency = 0.3
    Instance.new("\085\073\067\111\114\110\101\114", _0xWKddgf4opHDWM56hBEg8).CornerRadius = UDim.new(0, 6)
    local _0xFcotHXgwsfDg97BJq1Ob = Instance.new("\085\073\083\116\114\111\107\101", _0xWKddgf4opHDWM56hBEg8)
    _0xFcotHXgwsfDg97BJq1Ob.Color = _0xzme7o3MPqYKkfQGcWyb5[type] or _0xzme7o3MPqYKkfQGcWyb5.info
    _0xFcotHXgwsfDg97BJq1Ob.Thickness = 1.5
    local _0xdwEihZfAX1tWyp6uIbzU = Instance.new("\084\101\120\116\076\097\098\101\108", _0xWKddgf4opHDWM56hBEg8)
    _0xdwEihZfAX1tWyp6uIbzU.Size = UDim2.new(1, -10, 1, 0)
    _0xdwEihZfAX1tWyp6uIbzU.Position = UDim2.new(0, 5, 0, 0)
    _0xdwEihZfAX1tWyp6uIbzU.BackgroundTransparency = 1
    _0xdwEihZfAX1tWyp6uIbzU.Text = (_0x1l1g4NxNckhdz8rLnnuy[type] or "\9679") .. "\032" .. text
    _0xdwEihZfAX1tWyp6uIbzU.TextColor3 = Color3.new(1, 1, 1)
    _0xdwEihZfAX1tWyp6uIbzU.Font = Enum.Font.GothamBold
    _0xdwEihZfAX1tWyp6uIbzU.TextSize = 13
    _0xdwEihZfAX1tWyp6uIbzU.TextXAlignment = Enum.TextXAlignment.Left
    task.delay(4, function()
        if _0xWKddgf4opHDWM56hBEg8 then _0xWKddgf4opHDWM56hBEg8:Destroy() end
    end)
end
local function _0xjAInuRPtp8Azmy1huFk8(gamepassId)
    local _0xXE1MtbQ8Ldz9bTI8smID, hasPass = pcall(function()
        return _0xcRvkCrPQFxWm8fJRaEWO:UserOwnsGamePassAsync(_0xei0hsxINqKXWlh89MnRQ.UserId, gamepassId)
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID and hasPass
end
local function _0xdlzlt2ZivG6HzmZjuuyt(badgeId)
    local _0xXE1MtbQ8Ldz9bTI8smID, hasBadge = pcall(function()
        return _0xY6qjA8D0wmiZf2h7cPvs:UserHasBadgeAsync(_0xei0hsxINqKXWlh89MnRQ.UserId, badgeId)
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID and hasBadge
end
local function _0x4hjFgFzUlSdAnxzkfWrN(groupId)
    local _0xXE1MtbQ8Ldz9bTI8smID, inGroup = pcall(function()
        return _0xei0hsxINqKXWlh89MnRQ:IsInGroup(groupId)
    end)
    return _0xXE1MtbQ8Ldz9bTI8smID and inGroup
end
local function _0xW47GzWZtA6ECbzy6kH5P(description)
    local _0xu30rstvsIHaQQgkMk4uP = {}
    if description then
        for tag in description:gmatch("\035\040\091\037\119\037\045\095\093\043\041") do
            table.insert(_0xu30rstvsIHaQQgkMk4uP, tag:lower())
        end
    end
    return _0xu30rstvsIHaQQgkMk4uP
end
local function _0xBX4HDr76SB3ylQMgu0Ex(query, filters)
    local _0xzf2KPwWXnnXFZuCmAetR = {}
    local _0xoJElwHFz8rp1qu3ZTNfw = _0xankeKvjTiE88pEiWgz1N("\115\099\114\105\112\116\115")
    if not _0xoJElwHFz8rp1qu3ZTNfw then return _0xzf2KPwWXnnXFZuCmAetR end
    query = query:lower()
    for scriptName, scriptData in pairs(_0xoJElwHFz8rp1qu3ZTNfw) do
        local _0xQJUcbOrMArZX4ROn9RhQ = false
        local _0xz7z1ATIPKLfq9SVPpC8Q = _0xW47GzWZtA6ECbzy6kH5P(scriptData.description)
        local _0xGSyM6XQCIc0TpQGxmBYn = {}
        if scriptData._0xu30rstvsIHaQQgkMk4uP then
            for _, tag in ipairs(scriptData._0xu30rstvsIHaQQgkMk4uP) do
                table.insert(_0xGSyM6XQCIc0TpQGxmBYn, tag:lower())
            end
        end
        for _, tag in ipairs(_0xz7z1ATIPKLfq9SVPpC8Q) do
            if not table.find(_0xGSyM6XQCIc0TpQGxmBYn, tag) then
                table.insert(_0xGSyM6XQCIc0TpQGxmBYn, tag)
            end
        end
        if query == "" or scriptName:lower():find(query) or (scriptData.description and scriptData.description:lower():find(query)) or (scriptData.author and scriptData.author:lower():find(query)) then
            _0xQJUcbOrMArZX4ROn9RhQ = true
        end
        if query ~= "" then
            for _, tag in ipairs(_0xGSyM6XQCIc0TpQGxmBYn) do
                if tag:find(query) then
                    _0xQJUcbOrMArZX4ROn9RhQ = true
                    break
                end
            end
        end
        if filters.monetization ~= "\097\108\108" and scriptData.monetization ~= filters.monetization then
            _0xQJUcbOrMArZX4ROn9RhQ = false
        end
        if filters.tag ~= "\097\108\108" then
            local _0xXNVqf945EGxE2UVrs7kR = false
            for _, tag in ipairs(_0xGSyM6XQCIc0TpQGxmBYn) do
                if tag == filters.tag then
                    _0xXNVqf945EGxE2UVrs7kR = true
                    break
                end
            end
            if not _0xXNVqf945EGxE2UVrs7kR then
                _0xQJUcbOrMArZX4ROn9RhQ = false
            end
        end
        if filters.creator ~= "" and scriptData.author ~= filters.creator then
            _0xQJUcbOrMArZX4ROn9RhQ = false
        end
        if _0xQJUcbOrMArZX4ROn9RhQ then
            table.insert(_0xzf2KPwWXnnXFZuCmAetR, {
                name = scriptName,
                _0xR8XZXXASjpx7KT1izaDe = scriptData,
                _0xu30rstvsIHaQQgkMk4uP = _0xGSyM6XQCIc0TpQGxmBYn,
                uploadDate = scriptData.uploadDate or "\050\048\050\052\045\048\049\045\048\049\032\048\048\058\048\048\058\048\048",
                lastUpdate = scriptData.lastUpdate or scriptData.uploadDate or "\050\048\050\052\045\048\049\045\048\049\032\048\048\058\048\048\058\048\048"
            })
        end
    end
    if filters.sort == "\110\101\119\101\115\116" then
        table.sort(_0xzf2KPwWXnnXFZuCmAetR, function(a, b) return a.uploadDate > b.uploadDate end)
    elseif filters.sort == "\111\108\100\101\115\116" then
        table.sort(_0xzf2KPwWXnnXFZuCmAetR, function(a, b) return a.uploadDate < b.uploadDate end)
    elseif filters.sort == "\114\101\099\101\110\116\108\121\095\117\112\100\097\116\101\100" then
        table.sort(_0xzf2KPwWXnnXFZuCmAetR, function(a, b) return a.lastUpdate > b.lastUpdate end)
    elseif filters.sort == "\111\108\100\101\115\116\095\117\112\100\097\116\101\100" then
        table.sort(_0xzf2KPwWXnnXFZuCmAetR, function(a, b) return a.lastUpdate < b.lastUpdate end)
    end
    return _0xzf2KPwWXnnXFZuCmAetR
end
local function _0x6wQymvVdD3BwqlgzSTvg()
    local _0xGSyM6XQCIc0TpQGxmBYn = {}
    local _0xoJElwHFz8rp1qu3ZTNfw = _0xankeKvjTiE88pEiWgz1N("\115\099\114\105\112\116\115")
    if _0xoJElwHFz8rp1qu3ZTNfw then
        for _, scriptData in pairs(_0xoJElwHFz8rp1qu3ZTNfw) do
            if scriptData._0xu30rstvsIHaQQgkMk4uP then
                for _, tag in ipairs(scriptData._0xu30rstvsIHaQQgkMk4uP) do
                    local _0xnEwLSByV5wXCvoQ7u8bE = tag:lower()
                    if not table.find(_0xGSyM6XQCIc0TpQGxmBYn, _0xnEwLSByV5wXCvoQ7u8bE) then
                        table.insert(_0xGSyM6XQCIc0TpQGxmBYn, _0xnEwLSByV5wXCvoQ7u8bE)
                    end
                end
            end
            local _0xz7z1ATIPKLfq9SVPpC8Q = _0xW47GzWZtA6ECbzy6kH5P(scriptData.description)
            for _, tag in ipairs(_0xz7z1ATIPKLfq9SVPpC8Q) do
                if not table.find(_0xGSyM6XQCIc0TpQGxmBYn, tag) then
                    table.insert(_0xGSyM6XQCIc0TpQGxmBYn, tag)
                end
            end
        end
    end
    table.sort(_0xGSyM6XQCIc0TpQGxmBYn)
    return _0xGSyM6XQCIc0TpQGxmBYn
end
local function _0xYMpbDyBfIfwdVRodHNWy(scriptName, scriptData)
    local _0xgKrsGzASgZd2mOPgxPYW = Instance.new("\083\099\114\101\101\110\071\117\105")
    _0xgKrsGzASgZd2mOPgxPYW.Name = "\083\099\114\105\112\116\069\100\105\116\111\114"
    _0xgKrsGzASgZd2mOPgxPYW.ResetOnSpawn = false
    _0xgKrsGzASgZd2mOPgxPYW.DisplayOrder = 1000
    _0xgKrsGzASgZd2mOPgxPYW.Parent = _0xei0hsxINqKXWlh89MnRQ.PlayerGui
    local _0xLqo229OndXu9K14OVlei = Instance.new("\070\114\097\109\101", _0xgKrsGzASgZd2mOPgxPYW)
    _0xLqo229OndXu9K14OVlei.Size = UDim2.new(0, 600, 0, 550)
    _0xLqo229OndXu9K14OVlei.Position = UDim2.new(0.5, -300, 0.5, -275)
    _0xLqo229OndXu9K14OVlei.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("\085\073\067\111\114\110\101\114", _0xLqo229OndXu9K14OVlei).CornerRadius = UDim.new(0, 15)
    local _0x75xcpYfTmLL1f8W4I0MY = Instance.new("\084\101\120\116\076\097\098\101\108", _0xLqo229OndXu9K14OVlei)
    _0x75xcpYfTmLL1f8W4I0MY.Size = UDim2.new(1, 0, 0, 40)
    _0x75xcpYfTmLL1f8W4I0MY.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _0x75xcpYfTmLL1f8W4I0MY.Text = "\9999\65039\032\069\100\105\116\032\083\099\114\105\112\116\058\032" .. scriptName
    _0x75xcpYfTmLL1f8W4I0MY.TextColor3 = Color3.new(1, 1, 1)
    _0x75xcpYfTmLL1f8W4I0MY.Font = Enum.Font.GothamBold
    _0x75xcpYfTmLL1f8W4I0MY.TextSize = 16
    Instance.new("\085\073\067\111\114\110\101\114", _0x75xcpYfTmLL1f8W4I0MY).CornerRadius = UDim.new(0, 15)
    local _0xCfRdFAu4zWtV2QZEQsZW = Instance.new("\084\101\120\116\066\117\116\116\111\110", _0xLqo229OndXu9K14OVlei)
    _0xCfRdFAu4zWtV2QZEQsZW.Size = UDim2.new(0, 30, 0, 30)
    _0xCfRdFAu4zWtV2QZEQsZW.Position = UDim2.new(1, -35, 0, 5)
    _0xCfRdFAu4zWtV2QZEQsZW.Text = "\215"
    _0xCfRdFAu4zWtV2QZEQsZW.TextSize = 24
    _0xCfRdFAu4zWtV2QZEQsZW.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    _0xCfRdFAu4zWtV2QZEQsZW.TextColor3 = Color3.new(1, 1, 1)
    _0xCfRdFAu4zWtV2QZEQsZW.Font = Enum.Font.GothamBold
    Instance.new("\085\073\067\111\114\110\101\114", _0xCfRdFAu4zWtV2QZEQsZW).CornerRadius = UDim.new(0, 8)
    _0xCfRdFAu4zWtV2QZEQsZW.MouseButton1Click:Connect(function()
        _0xgKrsGzASgZd2mOPgxPYW:Destroy()
    end)
    local _0xbCgZOyQmYqDpfocMw1xe = {
        name = scriptData.name or scriptName,
        description = scriptData.description or "",
        code = scriptData.code or "",
        _0xu30rstvsIHaQQgkMk4uP = scriptData._0xu30rstvsIHaQQgkMk4uP or {}
    }
    local _0xjgaEO3e56x2xVd5em480 = Instance.new("\084\101\120\116\076\097\098\101\108", _0xLqo229OndXu9K14OVlei)
    _0xjgaEO3e56x2xVd5em480.Position = UDim2.new(0, 10, 0, 50)
    _0xjgaEO3e56x2xVd5em480.Size = UDim2.new(0, 100, 0, 30)
    _0xjgaEO3e56x2xVd5em480.Text = "\083\099\114\105\112\116\032\078\097\109\101\058"
    _0xjgaEO3e56x2xVd5em480.BackgroundTransparency = 1
    _0xjgaEO3e56x2xVd5em480.TextColor3 = Color3.new(1, 1, 1)
    _0xjgaEO3e56x2xVd5em480.Font = Enum.Font.GothamBold
    _0xjgaEO3e56x2xVd5em480.TextSize = 12
    _0xjgaEO3e56x2xVd5em480.TextXAlignment = Enum.TextXAlignment.Left
    local _0xhPWV5Bj12szPINk5bOGw = Instance.new("\084\101\120\116\066\111\120", _0xLqo229OndXu9K14OVlei)
    _0xhPWV5Bj12szPINk5bOGw.Position = UDim2.new(0, 120, 0, 50)
    _0xhPWV5Bj12szPINk5bOGw.Size = UDim2.new(1, -130, 0, 30)
    _0xhPWV5Bj12szPINk5bOGw.Text = _0xbCgZOyQmYqDpfocMw1xe.name
    _0xhPWV5Bj12szPINk5bOGw.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    _0xhPWV5Bj12szPINk5bOGw.TextColor3 = Color3.new(1, 1, 1)
    _0xhPWV5Bj12szPINk5bOGw.Font = Enum.Font.Code
    _0xhPWV5Bj12szPINk5bOGw.TextSize = 12
    _0xhPWV5Bj12szPINk5bOGw.PlaceholderText = "\069\110\116\101\114\032\115\099\114\105\112\116\032\110\097\109\101\046\046\046"
    Instance.new("\085\073\067\111\114\110\101\114", _0xhPWV5Bj12szPINk5bOGw).CornerRadius = UDim.new(0, 8)
    _0xhPWV5Bj12szPINk5bOGw.Changed:Connect(function(prop)
        if prop == "\084\101\120\116" then _0xbCgZOyQmYqDpfocMw1xe.name = _0xhPWV5Bj12szPINk5bOGw.Text end
    end)
    local _0xUKfsohjlLlkhD7Nt2ZTE = Instance.new("\084\101\120\116\076\097\098\101\108", _0xLqo229OndXu9K14OVlei)
    _0xUKfsohjlLlkhD7Nt2ZTE.Position = UDim2.new(0, 10, 0, 90)
    _0xUKfsohjlLlkhD7Nt2ZTE.Size = UDim2.new(0, 100, 0, 30)
    _0xUKfsohjlLlkhD7Nt2ZTE.Text = "\068\101\115\099\114\105\112\116\105\111\110\058"
    _0xUKfsohjlLlkhD7Nt2ZTE.BackgroundTransparency = 1
    _0xUKfsohjlLlkhD7Nt2ZTE.TextColor3 = Color3.new(1, 1, 1)
    _0xUKfsohjlLlkhD7Nt2ZTE.Font = Enum.Font.GothamBold
    _0xUKfsohjlLlkhD7Nt2ZTE.TextSize = 12
    _0xUKfsohjlLlkhD7Nt2ZTE.TextXAlignment = Enum.TextXAlignment.Left
    local _0xestqr4z0jy0nsDh5gm6C = Instance.new("\084\101\120\116\066\111\120", _0xLqo229OndXu9K14OVlei)
    _0xestqr4z0jy0nsDh5gm6C.Position = UDim2.new(0, 10, 0, 120)
    _0xestqr4z0jy0nsDh5gm6C.Size = UDim2.new(1, -20, 0, 60)
    _0xestqr4z0jy0nsDh5gm6C.Text = _0xbCgZOyQmYqDpfocMw1xe.description
    _0xestqr4z0jy0nsDh5gm6C.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    _0xestqr4z0jy0nsDh5gm6C.TextColor3 = Color3.new(1, 1, 1)
    _0xestqr4z0jy0nsDh5gm6C.Font = Enum.Font.Code
    _0xestqr4z0jy0nsDh5gm6C.TextSize = 12
    _0xestqr4z0jy0nsDh5gm6C.TextWrapped = true
    _0xestqr4z0jy0nsDh5gm6C.MultiLine = true
    _0xestqr4z0jy0nsDh5gm6C.TextYAlignment = Enum.TextYAlignment.Top
    _0xestqr4z0jy0nsDh5gm6C.PlaceholderText = "\085\115\101\032\035\104\097\115\104\116\097\103\115\032\102\111\114\032\095\048\120\117\051\048\114\115\116\118\115\073\072\097\081\081\103\107\077\107\052\117\080\033"
    Instance.new("\085\073\067\111\114\110\101\114", _0xestqr4z0jy0nsDh5gm6C).CornerRadius = UDim.new(0, 8)
    _0xestqr4z0jy0nsDh5gm6C.Changed:Connect(function(prop)
        if prop == "\084\101\120\116" then _0xbCgZOyQmYqDpfocMw1xe.description = _0xestqr4z0jy0nsDh5gm6C.Text end
    end)
    local _0xaXWZ4M50iW5dVJ6BqbJQ = Instance.new("\084\101\120\116\076\097\098\101\108", _0xLqo229OndXu9K14OVlei)
    _0xaXWZ4M50iW5dVJ6BqbJQ.Position = UDim2.new(0, 10, 0, 190)
    _0xaXWZ4M50iW5dVJ6BqbJQ.Size = UDim2.new(0, 100, 0, 30)
    _0xaXWZ4M50iW5dVJ6BqbJQ.Text = "\077\097\110\117\097\108\032\084\097\103\115\058"
    _0xaXWZ4M50iW5dVJ6BqbJQ.BackgroundTransparency = 1
    _0xaXWZ4M50iW5dVJ6BqbJQ.TextColor3 = Color3.new(1, 1, 1)
    _0xaXWZ4M50iW5dVJ6BqbJQ.Font = Enum.Font.GothamBold
    _0xaXWZ4M50iW5dVJ6BqbJQ.TextSize = 12
    _0xaXWZ4M50iW5dVJ6BqbJQ.TextXAlignment = Enum.TextXAlignment.Left
    local _0x1Rtz2gUElD6TOUsjYBRs = Instance.new("\084\101\120\116\066\111\120", _0xLqo229OndXu9K14OVlei)
    _0x1Rtz2gUElD6TOUsjYBRs.Position = UDim2.new(0, 120, 0, 190)
    _0x1Rtz2gUElD6TOUsjYBRs.Size = UDim2.new(1, -130, 0, 30)
    _0x1Rtz2gUElD6TOUsjYBRs.Text = table.concat(_0xbCgZOyQmYqDpfocMw1xe._0xu30rstvsIHaQQgkMk4uP, "\044\032")
    _0x1Rtz2gUElD6TOUsjYBRs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    _0x1Rtz2gUElD6TOUsjYBRs.TextColor3 = Color3.new(1, 1, 1)
    _0x1Rtz2gUElD6TOUsjYBRs.Font = Enum.Font.Code
    _0x1Rtz2gUElD6TOUsjYBRs.TextSize = 12
    _0x1Rtz2gUElD6TOUsjYBRs.PlaceholderText = "\112\114\105\115\111\110\045\108\105\102\101\044\032\097\114\115\101\110\097\108\046\046\046"
    Instance.new("\085\073\067\111\114\110\101\114", _0x1Rtz2gUElD6TOUsjYBRs).CornerRadius = UDim.new(0, 8)
    _0x1Rtz2gUElD6TOUsjYBRs.Changed:Connect(function(prop)
        if prop == "\084\101\120\116" then
            _0xbCgZOyQmYqDpfocMw1xe._0xu30rstvsIHaQQgkMk4uP = {}
            for tag in _0x1Rtz2gUElD6TOUsjYBRs.Text:gmatch("\091\094\044\093\043") do
                table.insert(_0xbCgZOyQmYqDpfocMw1xe._0xu30rstvsIHaQQgkMk4uP, tag:match("\094\037\115\042\040\046\045\041\037\115\042\036"))
            end
        end
    end)
    local _0xgzR9UwuCC3efqT79qgeT = Instance.new("\084\101\120\116\076\097\098\101\108", _0xLqo229OndXu9K14OVlei)
    _0xgzR9UwuCC3efqT79qgeT.Position = UDim2.new(0, 10, 0, 230)
    _0xgzR9UwuCC3efqT79qgeT.Size = UDim2.new(0, 100, 0, 30)
    _0xgzR9UwuCC3efqT79qgeT.Text = "\083\099\114\105\112\116\032\067\111\100\101\058"
    _0xgzR9UwuCC3efqT79qgeT.BackgroundTransparency = 1
    _0xgzR9UwuCC3efqT79qgeT.TextColor3 = Color3.new(1, 1, 1)
    _0xgzR9UwuCC3efqT79qgeT.Font = Enum.Font.GothamBold
    _0xgzR9UwuCC3efqT79qgeT.TextSize = 12
    _0xgzR9UwuCC3efqT79qgeT.TextXAlignment = Enum.TextXAlignment.Left
    local _0xdqZhaHG9uDZbwbHNtusH = Instance.new("\084\101\120\116\066\111\120", _0xLqo229OndXu9K14OVlei)
    _0xdqZhaHG9uDZbwbHNtusH.Position = UDim2.new(0, 10, 0, 260)
    _0xdqZhaHG9uDZbwbHNtusH.Size = UDim2.new(1, -20, 0, 200)
    _0xdqZhaHG9uDZbwbHNtusH.Text = _0xbCgZOyQmYqDpfocMw1xe.code
    _0xdqZhaHG9uDZbwbHNtusH.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _0xdqZhaHG9uDZbwbHNtusH.TextColor3 = Color3.new(1, 1, 1)
    _0xdqZhaHG9uDZbwbHNtusH.Font = Enum.Font.Code
    _0xdqZhaHG9uDZbwbHNtusH.TextSize = 11
    _0xdqZhaHG9uDZbwbHNtusH.TextWrapped = true
    _0xdqZhaHG9uDZbwbHNtusH.MultiLine = true
    _0xdqZhaHG9uDZbwbHNtusH.TextYAlignment = Enum.TextYAlignment.Top
    _0xdqZhaHG9uDZbwbHNtusH.TextXAlignment = Enum.TextXAlignment.Left
    _0xdqZhaHG9uDZbwbHNtusH.PlaceholderText = "
    _0xdqZhaHG9uDZbwbHNtusH.ClearTextOnFocus = false
    Instance.new("\085\073\067\111\114\110\101\114", _0xdqZhaHG9uDZbwbHNtusH).CornerRadius = UDim.new(0, 8)
    local _0xVO33eGYtiFF2xRqV8vWx = Instance.new("\085\073\080\097\100\100\105\110\103", _0xdqZhaHG9uDZbwbHNtusH)
    _0xVO33eGYtiFF2xRqV8vWx.PaddingLeft = UDim.new(0, 8)
    _0xVO33eGYtiFF2xRqV8vWx.PaddingRight = UDim.new(0, 8)
    _0xVO33eGYtiFF2xRqV8vWx.PaddingTop = UDim.new(0, 8)
    _0xVO33eGYtiFF2xRqV8vWx.PaddingBottom = UDim.new(0, 8)
    _0xdqZhaHG9uDZbwbHNtusH.Changed:Connect(function(prop)
        if prop == "\084\101\120\116" then _0xbCgZOyQmYqDpfocMw1xe.code = _0xdqZhaHG9uDZbwbHNtusH.Text end
    end)
    local _0xgrhZCffwsE9gV9wYPzCZ = Instance.new("\084\101\120\116\066\117\116\116\111\110", _0xLqo229OndXu9K14OVlei)
    _0xgrhZCffwsE9gV9wYPzCZ.Position = UDim2.new(0, 10, 1, -45)
    _0xgrhZCffwsE9gV9wYPzCZ.Size = UDim2.new(0.48, -7.5, 0, 35)
    _0xgrhZCffwsE9gV9wYPzCZ.Text = "\55357\56510\032\083\097\118\101\032\067\104\097\110\103\101\115"
    _0xgrhZCffwsE9gV9wYPzCZ.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
    _0xgrhZCffwsE9gV9wYPzCZ.TextColor3 = Color3.new(0, 0, 0)
    _0xgrhZCffwsE9gV9wYPzCZ.Font = Enum.Font.GothamBold
    _0xgrhZCffwsE9gV9wYPzCZ.TextSize = 14
    Instance.new("\085\073\067\111\114\110\101\114", _0xgrhZCffwsE9gV9wYPzCZ).CornerRadius = UDim.new(0, 8)
    _0xgrhZCffwsE9gV9wYPzCZ.MouseButton1Click:Connect(function()
        if _0xbCgZOyQmYqDpfocMw1xe.name == "" or _0xbCgZOyQmYqDpfocMw1xe.code == "" then
            _0x92hXlJqqFzsFZ90lk1KV("\078\111\109\101\032\101\032\099\243\100\105\103\111\032\110\227\111\032\112\111\100\101\109\032\101\115\116\097\114\032\118\097\122\105\111\115\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
            return
        end
        _0x92hXlJqqFzsFZ90lk1KV("\083\097\108\118\097\110\100\111\032\097\108\116\101\114\097\231\245\101\115\044\032\114\111\098\108\111\120\105\097\110\111\046\046\046", "\101\100\105\116")
        local _0xvS6gSGThdZyaK6nzUPpd = {
            name = _0xbCgZOyQmYqDpfocMw1xe.name,
            description = _0xbCgZOyQmYqDpfocMw1xe.description,
            code = _0xbCgZOyQmYqDpfocMw1xe.code,
            _0xu30rstvsIHaQQgkMk4uP = _0xbCgZOyQmYqDpfocMw1xe._0xu30rstvsIHaQQgkMk4uP,
            author = scriptData.author,
            uploadDate = scriptData.uploadDate,
            lastUpdate = os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083"),
            monetization = scriptData.monetization,
            gamepassId = scriptData.gamepassId,
            badgeId = scriptData.badgeId,
            groupId = scriptData.groupId
        }
        if _0xbCgZOyQmYqDpfocMw1xe.name ~= scriptName then
            _0xioFavWGlAD8pFYweRlkE("\115\099\114\105\112\116\115\047" .. scriptName)
        end
        local _0xXE1MtbQ8Ldz9bTI8smID = _0xU0sR0CrbEnWxeWvNo4IP("\115\099\114\105\112\116\115\047" .. _0xbCgZOyQmYqDpfocMw1xe.name, _0xvS6gSGThdZyaK6nzUPpd)
        if _0xXE1MtbQ8Ldz9bTI8smID then
            _0x92hXlJqqFzsFZ90lk1KV("\083\099\114\105\112\116\032\097\116\117\097\108\105\122\097\100\111\032\099\111\109\032\115\117\099\101\115\115\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
            _0xgKrsGzASgZd2mOPgxPYW:Destroy()
        else
            _0x92hXlJqqFzsFZ90lk1KV("\070\097\108\104\097\032\097\111\032\115\097\108\118\097\114\032\097\108\116\101\114\097\231\245\101\115\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
        end
    end)
    local _0xouezxx8wZZNFbDvqhSZD = Instance.new("\084\101\120\116\066\117\116\116\111\110", _0xLqo229OndXu9K14OVlei)
    _0xouezxx8wZZNFbDvqhSZD.Position = UDim2.new(0.52, 2.5, 1, -45)
    _0xouezxx8wZZNFbDvqhSZD.Size = UDim2.new(0.48, -7.5, 0, 35)
    _0xouezxx8wZZNFbDvqhSZD.Text = "\55357\56785\65039\032\068\101\108\101\116\101\032\083\099\114\105\112\116"
    _0xouezxx8wZZNFbDvqhSZD.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    _0xouezxx8wZZNFbDvqhSZD.TextColor3 = Color3.new(1, 1, 1)
    _0xouezxx8wZZNFbDvqhSZD.Font = Enum.Font.GothamBold
    _0xouezxx8wZZNFbDvqhSZD.TextSize = 14
    Instance.new("\085\073\067\111\114\110\101\114", _0xouezxx8wZZNFbDvqhSZD).CornerRadius = UDim.new(0, 8)
    _0xouezxx8wZZNFbDvqhSZD.MouseButton1Click:Connect(function()
        _0x92hXlJqqFzsFZ90lk1KV("\068\101\108\101\116\097\110\100\111\032\115\099\114\105\112\116\044\032\109\111\098\105\108\105\097\110\111\046\046\046", "\100\101\108\101\116\101")
        local _0xXE1MtbQ8Ldz9bTI8smID = _0xioFavWGlAD8pFYweRlkE("\115\099\114\105\112\116\115\047" .. scriptName)
        if _0xXE1MtbQ8Ldz9bTI8smID then
            _0x92hXlJqqFzsFZ90lk1KV("\083\099\114\105\112\116\032\100\101\108\101\116\097\100\111\032\099\111\109\032\115\117\099\101\115\115\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
            _0xgKrsGzASgZd2mOPgxPYW:Destroy()
        else
            _0x92hXlJqqFzsFZ90lk1KV("\070\097\108\104\097\032\097\111\032\100\101\108\101\116\097\114\032\115\099\114\105\112\116\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
        end
    end)
end
local _0xrKdkEtPpoMJc2kziMJ0d = ApexLib:CreateWindow({
    Title = "\9889\032\083\112\097\099\101\117\115\032\088\032\118\052\046\048\032\065\100\118\097\110\099\101\100\032\043\032\075\101\121",
    Name = "\083\112\097\099\101\117\115\095\088\095\065\100\118\097\110\099\101\100\095\075\101\121",
    Keybind = Enum.KeyCode.RightControl
})
local _0x0ZgSvNbHMuxHfb52mAAa = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\55357\56592\032\075\101\121\032\083\121\115\116\101\109")
if _0xLm2lRRdG3JSuNoZBQQIu then
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\9989\032\065\067\069\083\083\079\032\076\073\066\069\082\065\068\079",
        Color = "\101\109\101\114\097\108\100",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\086\111\099\234\032\116\101\109\032\097\099\101\115\115\111\032\099\111\109\112\108\101\116\111\032\112\111\114\032\050\052\032\104\111\114\097\115\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\9200\032\086\101\114\105\102\105\099\097\114\032\084\101\109\112\111\032\082\101\115\116\097\110\116\101",
        Color = "\098\108\117\101",
        Callback = function()
            if isfile(_0x7vj8eGnfdkbjxF1nPr0z) then
                local _0xR8XZXXASjpx7KT1izaDe = _0xdGOVNYhDuPEqudTFhTvr:JSONDecode(readfile(_0x7vj8eGnfdkbjxF1nPr0z))
                local _0xWR99C5jPaFOuaQ7rXYfG = _0xuxw0cVSzaBs6reGb07QM() - _0xR8XZXXASjpx7KT1izaDe.T
                local _0xvSdg8ZW0iqfLlQiHkxKV = 86400 - _0xWR99C5jPaFOuaQ7rXYfG
                local _0xMZNVEn2dRXATfsMFtcwa = math.floor(_0xvSdg8ZW0iqfLlQiHkxKV / 3600)
                local _0xRNC9gtXgD4xnDIkYE1jz = math.floor((_0xvSdg8ZW0iqfLlQiHkxKV % 3600) / 60)
                _0x92hXlJqqFzsFZ90lk1KV(string.format("\084\101\109\112\111\032\114\101\115\116\097\110\116\101\058\032\037\100\104\032\037\100\109", _0xMZNVEn2dRXATfsMFtcwa, _0xRNC9gtXgD4xnDIkYE1jz), "\105\110\102\111")
            end
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55357\56580\032\082\101\115\101\116\097\114\032\065\099\101\115\115\111\032\040\066\108\111\113\117\101\097\114\041",
        Color = "\114\101\100",
        Callback = function()
            if isfile(_0x7vj8eGnfdkbjxF1nPr0z) then
                delfile(_0x7vj8eGnfdkbjxF1nPr0z)
                _0x92hXlJqqFzsFZ90lk1KV("\065\099\101\115\115\111\032\114\101\115\101\116\097\100\111\033\032\082\101\105\110\105\099\105\101\032\111\032\115\099\114\105\112\116\032\112\097\114\097\032\114\101\045\101\110\116\114\097\114\032\097\032\107\101\121\046", "\119\097\114\110\105\110\103")
            end
        end
    })
else
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55357\56592\032\075\069\089\032\078\069\067\069\083\083\193\082\073\065",
        Color = "\114\101\100",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\080\111\114\032\102\097\118\111\114\044\032\105\110\115\105\114\097\032\117\109\097\032\107\101\121\032\118\225\108\105\100\097\032\112\097\114\097\032\100\101\115\098\108\111\113\117\101\097\114\044\032\109\111\098\105\108\105\097\110\111\033", "\119\097\114\110\105\110\103")
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55357\56523\032\067\111\109\111\032\079\098\116\101\114\032\097\032\075\101\121",
        Color = "\112\117\114\112\108\101",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\085\115\101\032\073\065\032\112\097\114\097\032\103\101\114\097\114\032\051\032\099\111\110\106\117\110\116\111\115\032\100\101\032\053\032\112\097\108\097\118\114\097\115\033", "\105\110\102\111")
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55358\56598\032\071\101\114\097\114\032\083\117\097\115\032\080\097\108\097\118\114\097\115\032\100\101\032\075\101\121",
        Color = "\103\111\108\100",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\067\079\078\074\085\078\084\079\032\049\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set1, "\044\032"), "\107\101\121")
            wait(1)
            _0x92hXlJqqFzsFZ90lk1KV("\067\079\078\074\085\078\084\079\032\050\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set2, "\044\032"), "\107\101\121")
            wait(1)
            _0x92hXlJqqFzsFZ90lk1KV("\067\079\078\074\085\078\084\079\032\051\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set3, "\044\032"), "\107\101\121")
            wait(1)
            _0x92hXlJqqFzsFZ90lk1KV("\069\115\099\111\108\104\097\032\049\032\112\097\108\097\118\114\097\032\100\101\032\099\097\100\097\032\099\111\110\106\117\110\116\111\032\101\032\099\111\109\098\105\110\101\033", "\105\110\102\111")
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55357\56541\032\077\111\115\116\114\097\114\032\084\111\100\111\115\032\111\115\032\067\111\110\106\117\110\116\111\115",
        Color = "\099\101\108\101\115\116\101",
        Callback = function()
            print("\061\061\061\032\083\080\065\067\069\085\083\032\088\032\075\069\089\032\087\079\082\068\032\083\069\084\083\032\061\061\061")
            print("\067\079\078\074\085\078\084\079\032\049\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set1, "\044\032"))
            print("\067\079\078\074\085\078\084\079\032\050\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set2, "\044\032"))
            print("\067\079\078\074\085\078\084\079\032\051\058\032" .. table.concat(_0xOf0y8F6ibDvhCWloJVKh.Set3, "\044\032"))
            print("\070\111\114\109\097\116\111\058\032\112\097\108\097\118\114\097\049\045\112\097\108\097\118\114\097\050\045\112\097\108\097\118\114\097\051")
            print("\069\120\101\109\112\108\111\058\032\113\117\097\110\116\117\109\045\099\105\112\104\101\114\045\109\097\116\114\105\120")
            _0x92hXlJqqFzsFZ90lk1KV("\067\111\110\106\117\110\116\111\115\032\105\109\112\114\101\115\115\111\115\032\110\111\032\099\111\110\115\111\108\101\032\040\070\057\041", "\105\110\102\111")
        end
    })
    local _0xq6jCGTiS1wt4Y6R3jBkB = ""
    _0x0ZgSvNbHMuxHfb52mAAa:AddInput({
        Title = "\068\105\103\105\116\101\032\097\032\075\101\121",
        Placeholder = "\112\097\108\097\118\114\097\049\045\112\097\108\097\118\114\097\050\045\112\097\108\097\118\114\097\051",
        Height = 40,
        Callback = function(text)
            _0xq6jCGTiS1wt4Y6R3jBkB = text:lower()
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\55357\56595\032\086\065\076\073\068\065\082\032\075\069\089",
        Color = "\101\109\101\114\097\108\100",
        Callback = function()
            if _0xq6jCGTiS1wt4Y6R3jBkB == "" then
                _0x92hXlJqqFzsFZ90lk1KV("\080\111\114\032\102\097\118\111\114\044\032\100\105\103\105\116\101\032\117\109\097\032\107\101\121\032\112\114\105\109\101\105\114\111\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
                return
            end
            if table.find(_0xkL0XOmakHtR9sJp3whbR, _0xq6jCGTiS1wt4Y6R3jBkB) then
                local _0xQEkCAaOVi2UYlkoOfGmH = {T = _0xuxw0cVSzaBs6reGb07QM()}
                writefile(_0x7vj8eGnfdkbjxF1nPr0z, _0xdGOVNYhDuPEqudTFhTvr:JSONEncode(_0xQEkCAaOVi2UYlkoOfGmH))
                _0x92hXlJqqFzsFZ90lk1KV("\075\069\089\032\065\067\069\073\084\065\033\032\065\099\101\115\115\111\032\108\105\098\101\114\097\100\111\032\112\111\114\032\050\052\104\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
                _0x92hXlJqqFzsFZ90lk1KV("\082\101\099\097\114\114\101\103\097\110\100\111\032\101\120\101\099\117\116\111\114\032\097\117\116\111\109\097\116\105\099\097\109\101\110\116\101\046\046\046", "\105\110\102\111")
                wait(1.5)
                loadstring(game:HttpGet("\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\106\111\097\111\114\113\113\113\047\065\112\101\120\076\105\098\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\065\112\101\120\069\120\101\099\117\116\111\114\046\108\117\097"))()
            else
                _0x92hXlJqqFzsFZ90lk1KV("\075\069\089\032\073\078\086\193\076\073\068\065\033\032\084\101\110\116\101\032\110\111\118\097\109\101\110\116\101\044\032\109\111\098\105\108\105\097\110\111\046", "\101\114\114\111\114")
            end
        end
    })
    _0x0ZgSvNbHMuxHfb52mAAa:AddButton({
        Title = "\10067\032\065\106\117\100\097\032\100\101\032\070\111\114\109\097\116\111\032\100\097\032\075\101\121",
        Color = "\112\105\110\107",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\070\111\114\109\097\116\111\058\032\112\097\108\097\118\114\097\049\045\112\097\108\097\118\114\097\050\045\112\097\108\097\118\114\097\051", "\105\110\102\111")
            wait(1)
            _0x92hXlJqqFzsFZ90lk1KV("\069\115\099\111\108\104\097\032\049\032\112\097\108\097\118\114\097\032\100\101\032\099\097\100\097\032\117\109\032\100\111\115\032\051\032\099\111\110\106\117\110\116\111\115", "\105\110\102\111")
            wait(1)
            _0x92hXlJqqFzsFZ90lk1KV("\069\120\101\109\112\108\111\058\032\113\117\097\110\116\117\109\045\112\114\105\115\109\045\115\116\101\108\108\097\114", "\107\101\121")
        end
    })
end
if _0xLm2lRRdG3JSuNoZBQQIu then
    local _0x5wNEv8tns5yGcey5RTyy = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\053\119\078\069\118\056\116\110\115\053\121\071\099\101\121\053\082\084\121\121")
    _0x5wNEv8tns5yGcey5RTyy:AddButton({
        Title = "\55357\56420\032\085\115\117\225\114\105\111\058\032" .. _0xei0hsxINqKXWlh89MnRQ.Name,
        Color = "\098\108\117\101",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\066\101\109\045\118\105\110\100\111\044\032" .. _0xei0hsxINqKXWlh89MnRQ.Name .. "\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
    _0x5wNEv8tns5yGcey5RTyy:AddButton({
        Title = "\55356\57262\032\074\111\103\111\058\032" .. _0xcRvkCrPQFxWm8fJRaEWO:GetProductInfo(game.PlaceId).Name,
        Color = "\112\117\114\112\108\101",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\080\108\097\099\101\073\100\058\032" .. game.PlaceId, "\105\110\102\111")
        end
    })
    _0x5wNEv8tns5yGcey5RTyy:AddButton({
        Title = "\55357\56522\032\077\101\117\115\032\083\099\114\105\112\116\115",
        Color = "\103\111\108\100",
        Callback = function()
            local _0x2FmtDshBQ6ZDwPEucaaV = {}
            local _0xPqMBMqrlxQh5tSTyShGZ = _0xankeKvjTiE88pEiWgz1N("\115\099\114\105\112\116\115")
            if _0xPqMBMqrlxQh5tSTyShGZ then
                for name, _0xR8XZXXASjpx7KT1izaDe in pairs(_0xPqMBMqrlxQh5tSTyShGZ) do
                    if _0xR8XZXXASjpx7KT1izaDe.author == _0xei0hsxINqKXWlh89MnRQ.Name then
                        table.insert(_0x2FmtDshBQ6ZDwPEucaaV, name)
                    end
                end
            end
            _0x92hXlJqqFzsFZ90lk1KV("\086\111\099\234\032\116\101\109\032" .. #_0x2FmtDshBQ6ZDwPEucaaV .. "\032\115\099\114\105\112\116\040\115\041", "\115\099\114\105\112\116")
        end
    })
    local _0xKxI68HMTiP8DpcnIW0RY = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\075\120\073\054\056\072\077\084\105\080\056\068\112\099\110\073\087\048\082\089")
    local _0xiQ1kSZpKK3BBDOSXLHKs = ""
    _0xKxI68HMTiP8DpcnIW0RY:AddInput({
        Title = "\069\100\105\116\111\114\032\100\101\032\083\099\114\105\112\116",
        Placeholder = "
        Height = 200,
        Callback = function(text)
            _0xiQ1kSZpKK3BBDOSXLHKs = text
        end
    })
    _0xKxI68HMTiP8DpcnIW0RY:AddButton({
        Title = "\9654\65039\032\069\088\069\067\085\084\065\082",
        Color = "\101\109\101\114\097\108\100",
        Callback = function()
            if _0xiQ1kSZpKK3BBDOSXLHKs ~= "" then
                _0x92hXlJqqFzsFZ90lk1KV("\069\120\101\099\117\116\097\110\100\111\032\115\099\114\105\112\116\044\032\114\111\098\108\111\120\105\097\110\111\046\046\046", "\105\110\102\111")
                local _0xXE1MtbQ8Ldz9bTI8smID, err = pcall(function()
                    loadstring(_0xiQ1kSZpKK3BBDOSXLHKs)()
                end)
                if _0xXE1MtbQ8Ldz9bTI8smID then
                    _0x92hXlJqqFzsFZ90lk1KV("\083\099\114\105\112\116\032\101\120\101\099\117\116\097\100\111\032\099\111\109\032\115\117\099\101\115\115\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
                else
                    _0x92hXlJqqFzsFZ90lk1KV("\069\114\114\111\032\110\097\032\101\120\101\099\117\231\227\111\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
                    warn(err)
                end
            else
                _0x92hXlJqqFzsFZ90lk1KV("\078\101\110\104\117\109\032\115\099\114\105\112\116\032\112\097\114\097\032\101\120\101\099\117\116\097\114\044\032\109\111\098\105\108\105\097\110\111\033", "\119\097\114\110\105\110\103")
            end
        end
    })
    _0xKxI68HMTiP8DpcnIW0RY:AddButton({
        Title = "\55357\56785\65039\032\076\105\109\112\097\114",
        Color = "\114\101\100",
        Callback = function()
            _0xiQ1kSZpKK3BBDOSXLHKs = ""
            _0x92hXlJqqFzsFZ90lk1KV("\083\099\114\105\112\116\032\108\105\109\112\111\033", "\105\110\102\111")
        end
    })
    local _0x7cLgJotvQUkGsxBRxtBo = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\055\099\076\103\074\111\116\118\081\085\107\071\115\120\066\082\120\116\066\111")
    local _0xGxGtKkGQhVJLfCdJGhnX = ""
    local _0xnFL2lCtmzziHMHXO4RLf = {
        monetization = "\097\108\108",
        tag = "\097\108\108",
        creator = "",
        sort = "\110\101\119\101\115\116"
    }
    _0x7cLgJotvQUkGsxBRxtBo:AddInput({
        Title = "\066\117\115\099\097\114\032\081\117\101\114\121",
        Placeholder = "\068\105\103\105\116\101\032\110\111\109\101\044\032\100\101\115\099\114\105\231\227\111\044\032\116\097\103\032\111\117\032\097\117\116\111\114\046\046\046",
        Height = 40,
        Callback = function(text)
            _0xGxGtKkGQhVJLfCdJGhnX = text
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\55357\56589\032\066\085\083\067\065\082",
        Color = "\112\105\110\107",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\066\117\115\099\097\110\100\111\032\115\099\114\105\112\116\115\044\032\114\111\098\108\111\120\105\097\110\111\046\046\046", "\115\101\097\114\099\104")
            local _0xzf2KPwWXnnXFZuCmAetR = _0xBX4HDr76SB3ylQMgu0Ex(_0xGxGtKkGQhVJLfCdJGhnX, _0xnFL2lCtmzziHMHXO4RLf)
            _0x92hXlJqqFzsFZ90lk1KV("\069\110\099\111\110\116\114\097\100\111\115\032" .. #_0xzf2KPwWXnnXFZuCmAetR .. "\032\114\101\115\117\108\116\097\100\111\040\115\041", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
            if #_0xzf2KPwWXnnXFZuCmAetR > 0 then
                for i, result in ipairs(_0xzf2KPwWXnnXFZuCmAetR) do
                    local _0x8gPeN73V9Be8xluh75M8 = #result._0xu30rstvsIHaQQgkMk4uP > 0 and "\032\091" .. table.concat(result._0xu30rstvsIHaQQgkMk4uP, "\044\032") .. "\093" or ""
                    print("\55357\56540\032" .. result.name .. _0x8gPeN73V9Be8xluh75M8)
                end
            end
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\070\105\108\116\114\111\058\032\084\111\100\111\115\032\111\115\032\084\105\112\111\115",
        Color = "\098\108\117\101",
        Callback = function()
            _0xnFL2lCtmzziHMHXO4RLf.monetization = "\097\108\108"
            _0x92hXlJqqFzsFZ90lk1KV("\070\105\108\116\114\111\058\032\084\111\100\111\115\032\111\115\032\116\105\112\111\115\032\100\101\032\109\111\110\101\116\105\122\097\231\227\111", "\105\110\102\111")
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\070\105\108\116\114\111\058\032\065\112\101\110\097\115\032\071\114\225\116\105\115",
        Color = "\101\109\101\114\097\108\100",
        Callback = function()
            _0xnFL2lCtmzziHMHXO4RLf.monetization = "\102\114\101\101"
            _0x92hXlJqqFzsFZ90lk1KV("\070\105\108\116\114\111\058\032\065\112\101\110\097\115\032\115\099\114\105\112\116\115\032\103\114\225\116\105\115", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\55356\57335\65039\032\078\097\118\101\103\097\114\032\084\111\100\097\115\032\097\115\032\084\097\103\115",
        Color = "\112\117\114\112\108\101",
        Callback = function()
            local _0xGSyM6XQCIc0TpQGxmBYn = _0x6wQymvVdD3BwqlgzSTvg()
            if #_0xGSyM6XQCIc0TpQGxmBYn == 0 then
                _0x92hXlJqqFzsFZ90lk1KV("\078\101\110\104\117\109\097\032\116\097\103\032\101\110\099\111\110\116\114\097\100\097\044\032\109\111\098\105\108\105\097\110\111\033", "\119\097\114\110\105\110\103")
            else
                _0x92hXlJqqFzsFZ90lk1KV("\069\110\099\111\110\116\114\097\100\097\115\032" .. #_0xGSyM6XQCIc0TpQGxmBYn .. "\032\095\048\120\117\051\048\114\115\116\118\115\073\072\097\081\081\103\107\077\107\052\117\080\032\250\110\105\099\097\115", "\116\097\103")
                for i = 1, math.min(10, #_0xGSyM6XQCIc0TpQGxmBYn) do
                    print("\035" .. _0xGSyM6XQCIc0TpQGxmBYn[i])
                end
                if #_0xGSyM6XQCIc0TpQGxmBYn > 10 then
                    print("\046\046\046\032\101\032\109\097\105\115\032" .. (#_0xGSyM6XQCIc0TpQGxmBYn - 10) .. "\032\095\048\120\117\051\048\114\115\116\118\115\073\072\097\081\081\103\107\077\107\052\117\080")
                end
            end
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddInput({
        Title = "\070\105\108\116\114\097\114\032\112\111\114\032\084\097\103",
        Placeholder = "\068\105\103\105\116\101\032\116\097\103\032\040\101\120\058\032\112\114\105\115\111\110\045\108\105\102\101\044\032\097\105\109\098\111\116\041\046\046\046",
        Height = 40,
        Callback = function(text)
            if text ~= "" then
                _0xnFL2lCtmzziHMHXO4RLf.tag = text:lower():gsub("\035", "")
                _0x92hXlJqqFzsFZ90lk1KV("\070\105\108\116\114\111\032\112\111\114\032\116\097\103\058\032\035" .. _0xnFL2lCtmzziHMHXO4RLf.tag, "\116\097\103")
            else
                _0xnFL2lCtmzziHMHXO4RLf.tag = "\097\108\108"
                _0x92hXlJqqFzsFZ90lk1KV("\070\105\108\116\114\111\032\100\101\032\116\097\103\032\108\105\109\112\111", "\105\110\102\111")
            end
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\079\114\100\101\110\097\114\058\032\077\097\105\115\032\082\101\099\101\110\116\101\115",
        Color = "\116\117\114\113\117\111\105\115\101",
        Callback = function()
            _0xnFL2lCtmzziHMHXO4RLf.sort = "\110\101\119\101\115\116"
            _0x92hXlJqqFzsFZ90lk1KV("\079\114\100\101\110\097\114\058\032\077\097\105\115\032\114\101\099\101\110\116\101\115\032\112\114\105\109\101\105\114\111", "\105\110\102\111")
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddButton({
        Title = "\079\114\100\101\110\097\114\058\032\082\101\099\101\110\116\101\109\101\110\116\101\032\065\116\117\097\108\105\122\097\100\111\115",
        Color = "\112\117\114\112\108\101",
        Callback = function()
            _0xnFL2lCtmzziHMHXO4RLf.sort = "\114\101\099\101\110\116\108\121\095\117\112\100\097\116\101\100"
            _0x92hXlJqqFzsFZ90lk1KV("\079\114\100\101\110\097\114\058\032\082\101\099\101\110\116\101\109\101\110\116\101\032\097\116\117\097\108\105\122\097\100\111\115", "\105\110\102\111")
        end
    })
    _0x7cLgJotvQUkGsxBRxtBo:AddInput({
        Title = "\070\105\108\116\114\097\114\032\112\111\114\032\067\114\105\097\100\111\114",
        Placeholder = "\068\105\103\105\116\101\032\110\111\109\101\032\100\111\032\099\114\105\097\100\111\114\046\046\046",
        Height = 40,
        Callback = function(text)
            _0xnFL2lCtmzziHMHXO4RLf.creator = text
            if text ~= "" then
                _0x92hXlJqqFzsFZ90lk1KV("\070\105\108\116\114\111\032\112\111\114\032\099\114\105\097\100\111\114\058\032" .. text, "\105\110\102\111")
            end
        end
    })
    local _0x4rXC5e2DFTHDmSyvKLhg = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\077\121\032\083\099\114\105\112\116\115")
    _0x4rXC5e2DFTHDmSyvKLhg:AddButton({
        Title = "\55357\56523\032\067\097\114\114\101\103\097\114\032\077\101\117\115\032\083\099\114\105\112\116\115",
        Color = "\098\108\117\101",
        Callback = function()
            local _0xPqMBMqrlxQh5tSTyShGZ = _0xankeKvjTiE88pEiWgz1N("\115\099\114\105\112\116\115")
            if not _0xPqMBMqrlxQh5tSTyShGZ then
                _0x92hXlJqqFzsFZ90lk1KV("\078\227\111\032\102\111\105\032\112\111\115\115\237\118\101\108\032\099\097\114\114\101\103\097\114\032\115\099\114\105\112\116\115\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
                return
            end
            local _0xk8MbfTrpNTfqBGFh03g2 = 0
            for scriptName, scriptData in pairs(_0xPqMBMqrlxQh5tSTyShGZ) do
                if scriptData.author == _0xei0hsxINqKXWlh89MnRQ.Name then
                    _0xk8MbfTrpNTfqBGFh03g2 = _0xk8MbfTrpNTfqBGFh03g2 + 1
                    _0x4rXC5e2DFTHDmSyvKLhg:AddButton({
                        Title = "\9999\65039\032" .. scriptName,
                        Color = "\112\117\114\112\108\101",
                        Callback = function()
                            _0xYMpbDyBfIfwdVRodHNWy(scriptName, scriptData)
                        end
                    })
                end
            end
            if _0xk8MbfTrpNTfqBGFh03g2 == 0 then
                _0x92hXlJqqFzsFZ90lk1KV("\086\111\099\234\032\097\105\110\100\097\032\110\227\111\032\101\110\118\105\111\117\032\110\101\110\104\117\109\032\115\099\114\105\112\116\044\032\109\111\098\105\108\105\097\110\111\033", "\105\110\102\111")
            else
                _0x92hXlJqqFzsFZ90lk1KV("\067\097\114\114\101\103\097\100\111\115\032" .. _0xk8MbfTrpNTfqBGFh03g2 .. "\032\115\099\114\105\112\116\040\115\041\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
            end
        end
    })
    local _0x8zp1BR8V5amxj5FN432c = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\056\122\112\049\066\082\056\086\053\097\109\120\106\053\070\078\052\051\050\099")
    local _0xuhcmpyTX70MQaGlPBjXp = {
        name = "",
        description = "",
        code = "",
        _0xu30rstvsIHaQQgkMk4uP = {},
        monetization = "\102\114\101\101",
        gamepassId = 0,
        badgeId = 0,
        groupId = 0
    }
    _0x8zp1BR8V5amxj5FN432c:AddInput({
        Title = "\078\111\109\101\032\100\111\032\083\099\114\105\112\116",
        Placeholder = "\068\105\103\105\116\101\032\111\032\110\111\109\101\032\100\111\032\115\099\114\105\112\116\046\046\046",
        Height = 40,
        Callback = function(text)
            _0xuhcmpyTX70MQaGlPBjXp.name = text
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddInput({
        Title = "\068\101\115\099\114\105\231\227\111\032\040\085\115\101\032\035\095\048\120\117\051\048\114\115\116\118\115\073\072\097\081\081\103\107\077\107\052\117\080\033\041",
        Placeholder = "\211\116\105\109\111\032\101\120\112\108\111\105\116\033\032\035\112\114\105\115\111\110\045\108\105\102\101\032\035\097\114\115\101\110\097\108\032\035\097\105\109\098\111\116",
        Height = 60,
        Callback = function(text)
            _0xuhcmpyTX70MQaGlPBjXp.description = text
            local _0xz7z1ATIPKLfq9SVPpC8Q = _0xW47GzWZtA6ECbzy6kH5P(text)
            if #_0xz7z1ATIPKLfq9SVPpC8Q > 0 then
                _0x92hXlJqqFzsFZ90lk1KV("\084\097\103\115\032\101\110\099\111\110\116\114\097\100\097\115\058\032" .. table.concat(_0xz7z1ATIPKLfq9SVPpC8Q, "\044\032"), "\116\097\103")
            end
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddInput({
        Title = "\084\097\103\115\032\077\097\110\117\097\105\115\032\040\115\101\112\097\114\097\100\097\115\032\112\111\114\032\118\237\114\103\117\108\097\041",
        Placeholder = "\112\114\105\115\111\110\045\108\105\102\101\044\032\097\114\115\101\110\097\108\044\032\101\120\112\108\111\105\116\046\046\046",
        Height = 40,
        Callback = function(text)
            _0xuhcmpyTX70MQaGlPBjXp._0xu30rstvsIHaQQgkMk4uP = {}
            for tag in text:gmatch("\091\094\044\093\043") do
                table.insert(_0xuhcmpyTX70MQaGlPBjXp._0xu30rstvsIHaQQgkMk4uP, tag:match("\094\037\115\042\040\046\045\041\037\115\042\036"))
            end
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddInput({
        Title = "\067\243\100\105\103\111\032\100\111\032\083\099\114\105\112\116",
        Placeholder = "
        Height = 120,
        Callback = function(text)
            _0xuhcmpyTX70MQaGlPBjXp.code = text
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddButton({
        Title = "\55356\56723\032\071\082\193\084\073\083",
        Color = "\101\109\101\114\097\108\100",
        Callback = function()
            _0xuhcmpyTX70MQaGlPBjXp.monetization = "\102\114\101\101"
            _0x92hXlJqqFzsFZ90lk1KV("\077\111\110\101\116\105\122\097\231\227\111\058\032\071\082\193\084\073\083", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddButton({
        Title = "\55356\57259\032\071\097\109\101\080\097\115\115",
        Color = "\103\111\108\100",
        Callback = function()
            _0xuhcmpyTX70MQaGlPBjXp.monetization = "\103\097\109\101\112\097\115\115"
            _0x92hXlJqqFzsFZ90lk1KV("\077\111\110\101\116\105\122\097\231\227\111\058\032\071\097\109\101\080\097\115\115", "\105\110\102\111")
        end
    })
    _0x8zp1BR8V5amxj5FN432c:AddButton({
        Title = "\55357\56548\032\069\078\086\073\065\082",
        Color = "\112\117\114\112\108\101",
        Callback = function()
            if _0xuhcmpyTX70MQaGlPBjXp.name == "" or _0xuhcmpyTX70MQaGlPBjXp.code == "" then
                _0x92hXlJqqFzsFZ90lk1KV("\080\114\101\101\110\099\104\097\032\110\111\109\101\032\101\032\099\243\100\105\103\111\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
                return
            end
            local _0xEgdXK5ISzpMl4dFnfCg4 = {
                name = _0xuhcmpyTX70MQaGlPBjXp.name,
                description = _0xuhcmpyTX70MQaGlPBjXp.description,
                code = _0xuhcmpyTX70MQaGlPBjXp.code,
                _0xu30rstvsIHaQQgkMk4uP = _0xuhcmpyTX70MQaGlPBjXp._0xu30rstvsIHaQQgkMk4uP,
                monetization = _0xuhcmpyTX70MQaGlPBjXp.monetization,
                author = _0xei0hsxINqKXWlh89MnRQ.Name,
                uploadDate = os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083"),
                lastUpdate = os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083")
            }
            if _0xuhcmpyTX70MQaGlPBjXp.monetization == "\103\097\109\101\112\097\115\115" then
                _0xEgdXK5ISzpMl4dFnfCg4.gamepassId = _0xuhcmpyTX70MQaGlPBjXp.gamepassId
            elseif _0xuhcmpyTX70MQaGlPBjXp.monetization == "\098\097\100\103\101" then
                _0xEgdXK5ISzpMl4dFnfCg4.badgeId = _0xuhcmpyTX70MQaGlPBjXp.badgeId
            elseif _0xuhcmpyTX70MQaGlPBjXp.monetization == "\103\114\111\117\112" then
                _0xEgdXK5ISzpMl4dFnfCg4.groupId = _0xuhcmpyTX70MQaGlPBjXp.groupId
            end
            local _0xXE1MtbQ8Ldz9bTI8smID = _0xU0sR0CrbEnWxeWvNo4IP("\115\099\114\105\112\116\115\047" .. _0xuhcmpyTX70MQaGlPBjXp.name, _0xEgdXK5ISzpMl4dFnfCg4)
            if _0xXE1MtbQ8Ldz9bTI8smID then
                _0x92hXlJqqFzsFZ90lk1KV("\083\099\114\105\112\116\032\101\110\118\105\097\100\111\032\099\111\109\032\115\117\099\101\115\115\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
            else
                _0x92hXlJqqFzsFZ90lk1KV("\070\097\108\104\097\032\110\111\032\101\110\118\105\111\044\032\109\111\098\105\108\105\097\110\111\033", "\101\114\114\111\114")
            end
        end
    })
    local _0x7MuIgEx3ARQDtgB5Z4iB = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\055\077\117\073\103\069\120\051\065\082\081\068\116\103\066\053\090\052\105\066")
    _0x7MuIgEx3ARQDtgB5Z4iB:AddSlider({
        Title = "\55356\57283\032\086\101\108\111\099\105\100\097\100\101\032\100\101\032\067\097\109\105\110\104\097\100\097",
        Min = 16,
        Max = 500,
        Default = 16,
        Callback = function(val)
            if _0xei0hsxINqKXWlh89MnRQ.Character and _0xei0hsxINqKXWlh89MnRQ.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then
                _0xei0hsxINqKXWlh89MnRQ.Character.Humanoid.WalkSpeed = val
            end
        end
    })
    _0x7MuIgEx3ARQDtgB5Z4iB:AddButton({
        Title = "\55356\57093\032\070\117\108\108\098\114\105\103\104\116",
        Color = "\121\101\108\108\111\119",
        Callback = function()
            local _0xbAKbfxAUPaewI5yzGvRJ = game:GetService("\095\048\120\098\065\075\098\102\120\065\085\080\097\101\119\073\053\121\122\071\118\082\074")
            _0xbAKbfxAUPaewI5yzGvRJ.Ambient = Color3.new(1, 1, 1)
            _0xbAKbfxAUPaewI5yzGvRJ.Brightness = 2
            _0xbAKbfxAUPaewI5yzGvRJ.FogEnd = 1e10
            _0x92hXlJqqFzsFZ90lk1KV("\070\117\108\108\098\114\105\103\104\116\032\097\116\105\118\097\100\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
    local _0xfWKZzeR39wVA5QtbeHJf = _0xrKdkEtPpoMJc2kziMJ0d:AddTab("\095\048\120\102\087\075\090\122\101\082\051\057\119\086\065\053\081\116\098\101\072\074\102")
    _0xfWKZzeR39wVA5QtbeHJf:AddButton({
        Title = "\55357\56473\032\067\114\105\097\100\111\032\112\111\114\032\106\111\097\111\114\113\113\113",
        Color = "\099\101\108\101\115\116\101",
        Callback = function()
            _0x92hXlJqqFzsFZ90lk1KV("\079\098\114\105\103\097\100\111\032\112\111\114\032\117\115\097\114\032\083\112\097\099\101\117\115\032\088\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
        end
    })
end
if _0xLm2lRRdG3JSuNoZBQQIu then
    _0x92hXlJqqFzsFZ90lk1KV("\083\112\097\099\101\117\115\032\088\032\118\052\046\048\032\065\100\118\097\110\099\101\100\032\099\097\114\114\101\103\097\100\111\044\032\114\111\098\108\111\120\105\097\110\111\033", "\095\048\120\088\069\049\077\116\098\081\056\076\100\122\057\098\084\073\056\115\109\073\068")
    _0x92hXlJqqFzsFZ90lk1KV("\080\114\101\115\115\105\111\110\101\032\082\105\103\104\116\067\111\110\116\114\111\108\032\112\097\114\097\032\097\108\116\101\114\110\097\114", "\105\110\102\111")
else
    _0x92hXlJqqFzsFZ90lk1KV("\55357\56592\032\083\073\083\084\069\077\065\032\068\069\032\075\069\089\032\065\084\073\086\079", "\107\101\121")
    _0x92hXlJqqFzsFZ90lk1KV("\080\111\114\032\102\097\118\111\114\044\032\105\110\115\105\114\097\032\117\109\097\032\107\101\121\032\118\225\108\105\100\097\032\112\097\114\097\032\100\101\115\098\108\111\113\117\101\097\114\044\032\109\111\098\105\108\105\097\110\111\033", "\119\097\114\110\105\110\103")
end
print([[
═══════════════════════════════════════════════════════════════════════
    ⚡ SPACEUS X v4.0 ADVANCED EDITION + KEY SYSTEM
    ───────────────────────────────────────────────────────────────────
    🔐 Sistema de Key: 3 Conjuntos de Palavras (5 cada)
    ✅ Duração de Acesso: 24 Horas
    ✅ Busca Avançada com Tags Personalizadas
    ✅ Sistema de Edição de Scripts
    ✅ Operações CRUD Completas
    ───────────────────────────────────────────────────────────────────
    Criado por: joaorqqq
    Discord: discord.gg/H6pWukrA7
═══════════════════════════════════════════════════════════════════════
]])
end)(...)
