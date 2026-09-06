-- [[ BloxScript Cloud Live Telemetry ]]
task.spawn(
    function()
        pcall(
            function()
                local req =
                    (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or
                    request
                if not req then
                    return
                end
                while true do
                    pcall(
                        function()
                            req(
                                {
                                    Url = "https://bloxscript-cloud.vercel.app/api/v1/telemetry/ping/fdmTYtvsoXp0",
                                    Method = "POST"
                                }
                            )
                        end
                    )
                    task.wait(25)
                end
            end
        )
    end
)
local l = true
if false then
local s = {}
s.AppName = "EliteAuth PRO"
s.Subtitle = "Enter your key to continue"
s.ButtonText = "Enter"
s.PlaceholderText = "Put your key here"
s.LoadingText = "Checking Key..."
s.SuccessText = "Correct Key"
s.ErrorText = "Invalid Key"
s.Secret = "7c0b0ece885a8594890d56333d3e5225"
s.Version = "1.5"
s.OwnerId = "vD3rJw8nUkYxX3PkN99hKTe0AEp1"
s.ScriptId = "SCR_FC30F602963B"
s.DiscordUrl = "https://discord.gg/FS5DJBd6sB"
s.WorkInkUrl = ""
s.LinkvertiseUrl = ""
s.CustomGetKeyUrl = "https://discord.gg/FS5DJBd6sB"
local X = true
local d = false
local w = false
local Q = true
local q = nil
if gethui then
    local s, X = pcall(gethui)
    if s and X then
        q = X
    end
end
if not q then
    local s, X =
        pcall(
        function()
            return game:GetService("CoreGui")
        end
    )
    if s and X then
        q = X
    end
end
if not q then
    pcall(
        function()
            local s = (game:GetService("Players")).LocalPlayer or (game:GetService("Players")).PlayerAdded:Wait()
            q = s:WaitForChild("PlayerGui")
        end
    )
end
local D = game:GetService("HttpService")
local O = nil
pcall(
    function()
        O = game:GetService("RbxAnalyticsService")
    end
)
local function r(s, X)
    local d = {}
    for w = 1, #s, 1 do
        d[w] = string.char(bit32.bxor(string.byte(s, w), X))
    end
    return table.concat(d)
end
local y = math.random(1, 127)
local o = r(s.Secret, y)
local N = function()
    return r(o, y)
end
local Z =
    (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request or
    (function(s)
        local X, d =
            pcall(
            function()
                return game:HttpGet(s.Url)
            end
        )
        if X and d then
            return {StatusCode = 200, Body = d}
        end
        return {StatusCode = 500, Body = "No request function supported on this executor"}
    end)
local function m(s)
    local X = {
        Url = s.Url,
        url = s.Url,
        Method = s.Method or "GET",
        method = s.Method or "GET",
        Headers = s.Headers or {},
        headers = s.Headers or {}
    }
    if s.Body and s.Body ~= "" then
        X.Body = s.Body
        X.body = s.Body
    end
    return Z(X)
end
local function e(s)
    if type(s) ~= "table" then
        return {success = false, message = tostring(s)}
    end
    local X = s.StatusCode or s.status or s.status_code or 200
    local d = s.Body or s.body or s.response or ""
    return {success = (X == 200), statusCode = X, body = d}
end
local l = false
local W = "UnknownPlayer"
pcall(
    function()
        if gethwid then
            W = tostring(gethwid())
        elseif O then
            W = tostring(O:GetClientId())
        else
            W = tostring((game:GetService("Players")).LocalPlayer.UserId)
        end
    end
)
local c = game:GetService("TweenService")
local M = game:GetService("UserInputService")
local L = Instance.new("ScreenGui")
local a = Instance.new("Frame")
local g = Instance.new("UICorner")
local K = Instance.new("UIStroke")
local I = Instance.new("UIGradient")
local T = Instance.new("Frame")
local x = nil
local V = Instance.new("TextLabel")
local S = Instance.new("TextLabel")
local z = Instance.new("Frame")
local F = Instance.new("UICorner")
local j = Instance.new("UIStroke")
local k = Instance.new("TextBox")
local P = Instance.new("UIPadding")
local E = Instance.new("TextButton")
local H = Instance.new("UICorner")
local i = Instance.new("UIGradient")
local U = Instance.new("UIStroke")
local J, v, p
if d then
    J = Instance.new("TextButton")
    v = Instance.new("UICorner")
    p = Instance.new("UIStroke")
end
local Y, u, A
if Q then
    Y = Instance.new("TextButton")
    u = Instance.new("UICorner")
    A = Instance.new("UIStroke")
end
local n, B, h
if w then
    n = Instance.new("TextButton")
    B = Instance.new("UICorner")
    h = Instance.new("UIStroke")
end
local t, R, f
if X then
    t = Instance.new("TextButton")
    R = Instance.new("UICorner")
    f = Instance.new("UIStroke")
end
local b = Instance.new("TextLabel")
pcall(
    function()
        if q then
            for s, X in ipairs(q:GetChildren()) do
                if
                    X:IsA("ScreenGui") and
                        (X.Name:find("SecureLoader") or X.Name:find("EliteAuth") or X.Name:find("KeyAuth") or
                            X.Name:find("UI_"))
                 then
                    X:Destroy()
                end
            end
        end
    end
)
local C = "UI_" .. string.sub(D:GenerateGUID(false), 1, 8)
L.Name = C
L.Parent = q
L.ResetOnSpawn = false
L.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
a.Parent = L
a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
a.BackgroundTransparency = 0
local G = Instance.new("UIGradient")
G.Color =
    ColorSequence.new(
    {ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 17)), ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 10))}
)
G.Rotation = 90
G.Parent = a
g.CornerRadius = UDim.new(0, 12)
g.Parent = a
K.Color = Color3.fromRGB(255, 255, 255)
K.Thickness = 1
K.Transparency = .9
K.Parent = a
T.Name = "TopGlow"
T.Parent = a
T.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
T.BorderSizePixel = 0
T.Size = UDim2.new(1, 0, 0, 2)
T.Position = UDim2.new(0, 0, 0, 0)
local sI = Instance.new("UIGradient")
sI.Color =
    ColorSequence.new(
    {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 17)),
        ColorSequenceKeypoint.new(.2, Color3.fromRGB(59, 130, 246)),
        ColorSequenceKeypoint.new(.8, Color3.fromRGB(59, 130, 246)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 17))
    }
)
sI.Parent = T
local XI = Instance.new("Frame")
XI.Name = "FauxBlur"
XI.Parent = T
XI.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
XI.BorderSizePixel = 0
XI.Size = UDim2.new(1, 0, 0, 4)
XI.Position = UDim2.new(0, 0, 0, 0)
XI.BackgroundTransparency = .5
local dI = sI:Clone()
dI.Parent = XI
V.Name = "Title"
V.Parent = a
V.BackgroundTransparency = 1
V.Position = UDim2.new(0, 0, 0, 28)
V.Size = UDim2.new(1, 0, 0, 24)
V.Font = Enum.Font.GothamBold
V.Text = s.AppName
V.TextColor3 = Color3.fromRGB(255, 255, 255)
V.TextSize = 22
S.Name = "Subtitle"
S.Parent = a
S.BackgroundTransparency = 1
S.Position = UDim2.new(0, 0, 0, 56)
S.Size = UDim2.new(1, 0, 0, 16)
S.Font = Enum.Font.GothamMedium
S.Text = s.Subtitle
S.TextColor3 = Color3.fromRGB(170, 170, 170)
S.TextSize = 13
S.TextTransparency = 0
z.Name = "KeyInputContainer"
z.Parent = a
z.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
z.BackgroundTransparency = 0
z.Position = UDim2.new(.08, 0, 0, 95)
z.Size = UDim2.new(.84, 0, 0, 46)
F.CornerRadius = UDim.new(0, 6)
F.Parent = z
j.Color = Color3.fromRGB(45, 45, 45)
j.Thickness = 1
j.Transparency = 0
j.Parent = z
k.Name = "KeyInput"
k.Parent = z
k.BackgroundTransparency = 1
k.Position = UDim2.new(0, 0, 0, 0)
k.Size = UDim2.new(1, 0, 1, 0)
k.Font = Enum.Font.Code
k.PlaceholderText = s.PlaceholderText
k.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
k.Text = ""
k.TextColor3 = Color3.fromRGB(240, 240, 240)
k.TextSize = 13
k.ClearTextOnFocus = false
k.TextXAlignment = Enum.TextXAlignment.Center
P.Parent = k
P.PaddingLeft = UDim.new(0, 10)
P.PaddingRight = UDim.new(0, 10)
k.Focused:Connect(
    function()
        (c:Create(j, TweenInfo.new(.3), {Color = Color3.fromRGB(59, 130, 246)})):Play()
    end
)
k.FocusLost:Connect(
    function()
        (c:Create(j, TweenInfo.new(.3), {Color = Color3.fromRGB(45, 45, 45)})):Play()
    end
)
E.Name = "LoginBtn"
E.Parent = a
E.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
E.Position = UDim2.new(.08, 0, 0, 155)
E.Size = UDim2.new(.84, 0, 0, 44)
E.Font = Enum.Font.GothamBold
E.Text = s.ButtonText
E.TextColor3 = Color3.fromRGB(255, 255, 255)
E.TextSize = 14
E.AutoButtonColor = false
E.TextStrokeTransparency = 1
H.CornerRadius = UDim.new(0, 6)
H.Parent = E
local wI = 215
local function QI(s, X, d, w, Q)
    s.Name = w
    s.Parent = a
    s.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    s.Position = UDim2.new(.08, 0, 0, Q)
    s.Size = UDim2.new(.84, 0, 0, 38)
    s.Font = Enum.Font.GothamMedium
    s.Text = w
    s.TextColor3 = Color3.fromRGB(220, 220, 220)
    s.TextSize = 13
    s.AutoButtonColor = false
    X.CornerRadius = UDim.new(0, 6)
    X.Parent = s
    d.Color = Color3.fromRGB(45, 45, 45)
    d.Thickness = 1
    d.Transparency = 0
    d.Parent = s
    s.MouseEnter:Connect(
        function()
            (c:Create(s, TweenInfo.new(.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})):Play()
        end
    )
    s.MouseLeave:Connect(
        function()
            (c:Create(s, TweenInfo.new(.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})):Play()
        end
    )
    return (Q + 38) + 10
end
if d then
    wI = QI(J, v, p, "Get Key (Work.ink)", wI)
end
if w then
    wI = QI(n, B, h, "Get Key (Linkvertise)", wI)
end
if Q then
    wI = QI(Y, u, A, "Get Key", wI)
end
if X then
    wI = QI(t, R, f, "Join Discord Support", wI)
end
b.Name = "Status"
b.Parent = a
b.BackgroundTransparency = 1
b.Position = UDim2.new(0, 15, 0, wI)
b.Size = UDim2.new(1, -30, 0, 32)
b.Font = Enum.Font.GothamMedium
b.Text = ""
b.TextColor3 = Color3.fromRGB(150, 150, 150)
b.TextSize = 10
b.TextWrapped = true
b.TextYAlignment = Enum.TextYAlignment.Top
a.ClipsDescendants = true
local qI = (wI + 36) + 10
a.Size = UDim2.new(0, 340, 0, qI)
a.Position = UDim2.new(.5, -170, .5, -qI / 2)
local DI = Instance.new("UIScale")
DI.Parent = a
DI.Scale = .85
(c:Create(DI, TweenInfo.new(.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1})):Play()
local OI = false
local rI, yI, oI
a.InputBegan:Connect(
    function(s)
        if s.UserInputType == Enum.UserInputType.MouseButton1 or s.UserInputType == Enum.UserInputType.Touch then
            OI = true
            yI = s.Position
            oI = a.Position
            s.Changed:Connect(
                function()
                    if s.UserInputState == Enum.UserInputState.End then
                        OI = false
                    end
                end
            )
        end
    end
)
a.InputChanged:Connect(
    function(s)
        if s.UserInputType == Enum.UserInputType.MouseMovement or s.UserInputType == Enum.UserInputType.Touch then
            rI = s
        end
    end
)
M.InputChanged:Connect(
    function(s)
        if s == rI and OI then
            local X = s.Position - yI
            a.Position = UDim2.new(oI.X.Scale, oI.X.Offset + X.X, oI.Y.Scale, oI.Y.Offset + X.Y)
        end
    end
)
E.MouseEnter:Connect(
    function()
        (c:Create(U, TweenInfo.new(.3), {Transparency = .2, Color = Color3.fromRGB(255, 255, 255)})):Play()
    end
)
E.MouseLeave:Connect(
    function()
        (c:Create(U, TweenInfo.new(.3), {Transparency = .5, Color = Color3.fromRGB(59, 130, 246)})):Play()
        if BtnScale then
            (c:Create(BtnScale, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1})):Play()
        end
    end
)
local NI = "https://eliteauth.vercel.app/api/verify-and-load"
local ZI = Instance.new("UIScale")
ZI.Parent = E
E.MouseButton1Down:Connect(
    function()
        (c:Create(ZI, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = .95})):Play()
    end
)
E.MouseButton1Up:Connect(
    function()
        (c:Create(ZI, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1})):Play()
    end
)
local function mI()
    local X = k.Text
    if X == "" then
        b.Text = s.ErrorText
        b.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    b.Text = s.LoadingText
    b.TextColor3 = Color3.fromRGB(150, 150, 150)
    local d = D:UrlEncode(X)
    local w = D:UrlEncode(W)
    local Q = D:UrlEncode(s.ScriptId or "")
    local q, O =
        pcall(
        function()
            return m(
                {
                    Url = NI ..
                        ("?key=" .. (d .. ("&appId=" .. (s.OwnerId .. ("&scriptId=" .. (Q .. ("&hwid=" .. w))))))),
                    Method = "GET"
                }
            )
        end
    )
    local r = e(O)
    if q and r.success then
        local d, w =
            pcall(
            function()
                return D:JSONDecode(r.body)
            end
        )
        if not d or type(w) ~= "table" then
            b.Text = "Invalid JSON response from server"
            b.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        if not w.script or not w.signature then
            b.Text = "Invalid response format from secure backend"
            b.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        local Q = true
        local q, O =
            pcall(
            function()
                local X = N and N() or s.Secret
                if crypt and crypt.hmac then
                    return crypt.hmac("sha256", w.script, X)
                elseif syn and (syn.crypt and (syn.crypt.custom and syn.crypt.custom.hash)) then
                    return syn.crypt.custom.hash("sha256", w.script .. X)
                end
                return nil
            end
        )
        if q and O then
            if O ~= w.signature then
                Q = false
            end
        end
        if not Q then
            warn("SECURITY ALERT: Script signature mismatch! The payload may have been tampered with.")
            b.Text = s.ErrorText
            b.TextColor3 = Color3.fromRGB(255, 50, 50)
            return
        end
        b.Text = s.SuccessText
        b.TextColor3 = Color3.fromRGB(50, 255, 50)
        pcall(
            function()
                if writefile then
                    local d = string.gsub(s.AppName or "app", "[^%w]", "")
                    local w = string.gsub(s.ScriptId or "global", "[^%w]", "")
                    local Q = d .. ("_" .. (w .. "_saved_key.txt"))
                    writefile(Q, X)
                end
            end
        )
        pcall(
            function()
                if x then
                    x:Destroy()
                end
                a.Visible = false
                L.Enabled = false
                L.Parent = nil
                L:Destroy()
            end
        )
        l = true
        pcall(
            function()
                if table and table.clear then
                    table.clear(s)
                end
                s = nil
                o = nil
                N = nil
                y = nil
            end
        )
    else
        local X = s.ErrorText
        pcall(
            function()
                local s = D:JSONDecode(r.body)
                if type(s) == "table" and s.message then
                    X = tostring(s.message)
                end
            end
        )
        b.Text = X
        b.TextColor3 = Color3.fromRGB(255, 100, 100)
        pcall(
            function()
                if delfile and isfile then
                    local X = string.gsub(s.AppName or "app", "[^%w]", "")
                    local d = string.gsub(s.ScriptId or "global", "[^%w]", "")
                    local w = X .. ("_" .. (d .. "_saved_key.txt"))
                    if isfile(w) then
                        delfile(w)
                    end
                end
            end
        )
    end
end
E.MouseButton1Click:Connect(mI)
pcall(
    function()
        local X = string.gsub(s.AppName or "app", "[^%w]", "")
        local d = string.gsub(s.ScriptId or "global", "[^%w]", "")
        local w = X .. ("_" .. (d .. "_saved_key.txt"))
        if readfile and (isfile and isfile(w)) then
            local s = readfile(w)
            if s and s ~= "" then
                k.Text = s
                task.spawn(
                    function()
                        task.wait(.2)
                        if not l then
                            mI()
                        end
                    end
                )
            end
        end
    end
)
if d then
    J.MouseButton1Click:Connect(
        function()
            setclipboard(s.WorkInkUrl)
            b.Text = "Link copied. Open in your browser to get the key"
            b.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    )
end
if w then
    n.MouseButton1Click:Connect(
        function()
            setclipboard(s.LinkvertiseUrl)
            b.Text = "Link copied. Open in your browser to get the key"
            b.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    )
end
if Q then
    Y.MouseButton1Click:Connect(
        function()
            setclipboard(s.CustomGetKeyUrl)
            b.Text = "Link copied. Open in your browser to get the key"
            b.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    )
end
if X then
    t.MouseButton1Click:Connect(
        function()
            setclipboard(s.DiscordUrl)
            b.Text = "Discord link copied to clipboard"
            b.TextColor3 = Color3.fromRGB(150, 150, 150)
            pcall(
                function()
                    local X =
                        s.DiscordUrl:match("discord%.gg/([a-zA-Z0-9]+)") or
                        s.DiscordUrl:match("discord%.com/invite/([a-zA-Z0-9]+)")
                    if not X then
                        return
                    end
                    local d = (syn and syn.request) or (http and http.request) or http_request or request
                    if d then
                        d(
                            {
                                Url = "http://127.0.0.1:6463/rpc?v=1",
                                Method = "POST",
                                Headers = {["Content-Type"] = "application/json", Origin = "https://discord.com"},
                                Body = D:JSONEncode(
                                    {cmd = "INVITE_BROWSER", args = {code = X}, nonce = D:GenerateGUID(false)}
                                )
                            }
                        )
                    end
                end
            )
        end
    )
end
repeat
    task.wait(.1)
until l == true
end
local eI = game:GetService("Players")
local lI = game:GetService("UserInputService")
local WI = game:GetService("TweenService")
local cI = game:GetService("VirtualInputManager")
local MI = game:GetService("HttpService")
local LI = eI.LocalPlayer
if _G.x9c then
    for s, X in pairs(_G.x9c) do
        pcall(
            function()
                X:Disconnect()
            end
        )
    end
end
if _G.x9g then
    pcall(
        function()
            _G.x9g:Destroy()
        end
    )
end
_G.x9c = {}
local function aI(s)
    table.insert(_G.x9c, s)
    return s
end
local gI = {
    ans = true,
    cho = true,
    delay = .05,
    reaction = 0,
    lengthMode = 2,
    trapMode = false,
    autoSit = true,
    hopTarget = 100,
    autoHop = false,
    clearDelay = .01
}
local KI = {}
local II = {}
local TI = {}
local xI = {}
local VI = {}
local SI = {}
local zI = {}
local FI = {}
local jI = nil
local kI = false
local PI = 0
local EI, HI = nil, nil
local iI
local UI = type(writefile) == "function"
local JI = type(readfile) == "function"
local vI = type(isfile) == "function"
local pI = {}
local YI = {}
local uI = {}
local AI = {}
local nI = {}
local BI = nil
local hI = nil
local tI = "SMSM_No_Match.txt"
local function RI(s)
    pcall(
        function()
            local X = string.format("[%s] Prefix: %s (No Word Found)\n", os.date("%X"), s or "?")
            if type(appendfile) == "function" then
                appendfile(tI, X)
            elseif UI then
                local s = ""
                if vI and (isfile(tI) and JI) then
                    s = readfile(tI)
                end
                writefile(tI, s .. X)
            end
        end
    )
end
local function fI(s)
    local X = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
    if X then
        local d = pcall(X, s)
        if d then
            return true
        end
    end
    return false
end
local bI = {}
for s, X in ipairs(Enum.KeyCode:GetEnumItems()) do
    local d = X.Name
    if #d == 1 and d:match("%u") then
        bI[d] = X
    end
end
local CI = {
    "fuck",
    "shit",
    "bitch",
    "cunt",
    "nigg",
    "asshol",
    "slut",
    "whore",
    "porn",
    "penis",
    "vagina",
    "masturb",
    "dickhead",
    "sexy",
    "sexual",
    "sexism",
    "tit",
    "cock",
    "dick",
    "anal",
    "anus",
    "rape",
    "nude",
    "piss",
    "bastard",
    "erot"
}
local GI = {
    dick = true,
    dicks = true,
    cock = true,
    cocks = true,
    cum = true,
    sex = true,
    rape = true,
    rapes = true,
    tits = true,
    boob = true,
    boobs = true
}
local function sK(s)
    if not s then
        return true
    end
    if GI[s] then
        return true
    end
    for X, d in ipairs(CI) do
        if s:find(d) then
            return true
        end
    end
    return false
end
local XK = {}
local dK = {
    regis = true,
    kijiji = true,
    arxiv = true,
    diecast = true,
    erade = true,
    coolpix = true,
    waxheads = true,
    infiniti = true,
    elfwort = true,
    elfed = true,
    elfship = true,
    llautu = true,
    llanero = true,
    lludd = true,
    lleu = true,
    ekhimi = true,
    ekphory = true,
    ekerite = true,
    ekphoria = true,
    macworld = true,
    ixodiasis = true,
    ixodic = true,
    soleil = true,
    inglu = true,
    ingle = true,
    ingles = true,
    inglesa = true,
    nsw = true,
    nspcc = true,
    nsaid = true,
    nsaids = true,
    nsfw = true,
    lmao = true,
    lmfao = true,
    tbqh = true,
    tbsp = true,
    tbsps = true,
    tgif = true,
    tgvs = true,
    tgwu = true,
    gtfo = true,
    ttfn = true,
    ttyl = true,
    wtaf = true,
    wwii = true,
    wwjd = true,
    wdyt = true,
    fwiw = true,
    gsoh = true,
    iirc = true,
    iykwim = true,
    iyswim = true,
    kthx = true,
    jsyk = true,
    hmmm = true,
    rtfm = true,
    fmcg = true,
    bbmd = true,
    bbmed = true,
    bbming = true,
    bbms = true,
    bbqs = true,
    bccs = true,
    bchs = true,
    bffs = true,
    bfns = true,
    bfpo = true,
    bfpos = true,
    bfps = true,
    bkbndr = true,
    bkcy = true,
    bkgd = true,
    bklr = true,
    bkpr = true,
    bkpt = true,
    bmus = true,
    bpds = true,
    bphil = true,
    bskt = true,
    btcs = true,
    btise = true,
    btry = true,
    bvds = true,
    bwrs = true,
    cbds = true,
    cfas = true,
    cfcs = true,
    cfes = true,
    cfos = true,
    cfps = true,
    cpas = true,
    cpvc = true,
    cpve = true,
    dbag = true,
    dbags = true,
    dbms = true,
    dbrn = true,
    dfab = true,
    dfcs = true,
    dfid = true,
    dgag = true,
    dlitt = true,
    dlvy = true,
    dphil = true,
    dphils = true,
    dpps = true,
    dtds = true,
    dttv = true,
    fchar = true,
    fcomp = true,
    fconv = true,
    fconvert = true,
    ffler = true,
    fgrid = true,
    fhsa = true,
    fname = true,
    fnarr = true,
    fnese = true,
    fplot = true,
    fpsps = true,
    fpss = true,
    fpus = true,
    fshs = true,
    fstore = true,
    fsts = true,
    gdinfo = true,
    gdns = true,
    gdps = true,
    gpcd = true,
    gpmu = true,
    gprs = true,
    gpss = true,
    gthite = true,
    gtis = true,
    hbcu = true,
    hbcus = true,
    hbic = true,
    hbics = true,
    hcfc = true,
    hcfcs = true,
    hcfs = true,
    hconvert = true,
    hfcs = true,
    hfcss = true,
    hgvs = true,
    hgwy = true,
    hhds = true,
    hlqn = true,
    hlung = true,
    hmas = true,
    hmoc = true,
    hmos = true,
    hmrc = true,
    hmso = true,
    hnwi = true,
    hnwis = true,
    hsdpa = true,
    hsts = true,
    hvac = true,
    hvacs = true,
    ieds = true,
    ieee = true,
    ielts = true,
    jcbs = true,
    jcrs = true,
    jctn = true,
    jger = true,
    kbps = true,
    kpis = true,
    kpuesi = true,
    kstj = true,
    kthibh = true,
    lbdr = true,
    lbds = true,
    lbinit = true,
    lcds = true,
    lcms = true,
    lconvert = true,
    lcpl = true,
    lcsymbol = true,
    ldcs = true,
    ldinfo = true,
    ldpe = true,
    ldrs = true,
    lner = true,
    lpns = true,
    lrecl = true,
    lrvs = true,
    lsbs = true,
    lsds = true,
    mdma = true,
    mdnt = true,
    mdpv = true,
    mdse = true,
    mgal = true,
    mgysgt = true,
    mktg = true,
    mvos = true,
    mvps = true,
    ncaa = true,
    ncos = true,
    ncov = true,
    nfld = true,
    nmex = true,
    nnps = true,
    npcs = true,
    npfx = true,
    npts = true,
    npvs = true,
    nrsv = true,
    ntsc = true,
    nvcjd = true,
    nvis = true,
    nvqs = true,
    pbxes = true,
    pbxs = true,
    pcas = true,
    pcbs = true,
    pcmcia = true,
    pcns = true,
    pcso = true,
    pdas = true,
    pdfs = true,
    pdsa = true,
    pgce = true,
    pgntt = true,
    pgnttrp = true,
    pkgs = true,
    pkwy = true,
    pmed = true,
    pmid = true,
    pming = true,
    pmqs = true,
    pmsg = true,
    pmsl = true,
    ppaca = true,
    pparc = true,
    pptn = true,
    pvrs = true,
    rbfs = true,
    rdbms = true,
    rdcs = true,
    rdfs = true,
    rgns = true,
    rnas = true,
    rnase = true,
    rnli = true,
    rnzaf = true,
    rnzn = true,
    rpgs = true,
    rpvs = true,
    rrna = true,
    rrsp = true,
    rtas = true,
    tpss = true,
    tvnz = true,
    uefa = true,
    uucpnet = true,
    vbac = true,
    vbacs = true,
    vcjd = true,
    vcrs = true,
    vdts = true,
    vdus = true,
    vmos = true,
    vmsize = true,
    vpls = true,
    vpns = true,
    vsnet = true,
    vsop = true,
    vtol = true,
    vtrs = true,
    vvip = true,
    vvips = true,
    vvll = true,
    wftu = true,
    wgtn = true,
    wkly = true,
    wmds = true,
    wpcs = true,
    ywca = true,
    zyban = true,
    zshops = true,
    zhang = true,
    ezcema = true,
    ezan = true,
    ezek = true,
    ezba = true,
    joomla = true,
    iambi = true,
    usenet = true,
    twiki = true,
    idola = true,
    idolon = true,
    ebook = true,
    undef = true,
    dooyoo = true,
    xonotlites = true,
    everytime = true,
    ossobucco = true,
    andale = true,
    yearbook = true,
    ximenez = true,
    xiphioid = true,
    ximenia = true,
    xiphodon = true,
    xiphoids = true,
    xoanon = true,
    xoanona = true,
    sku = true,
    kyathoi = true,
    kyabuka = true,
    kyaks = true,
    roriest = true,
    rorulent = true,
    rorters = true,
    rortiest = true,
    atreyu = true,
    ewghen = true,
    ewest = true,
    ewelease = true,
    ewking = true,
    svenska = true,
    awners = true,
    gratuit = true,
    dealtime = true,
    diggs = true,
    psilotic = true,
    palau = true,
    openid = true,
    opengl = true,
    webmin = true,
    alibris = true,
    adipex = true,
    nuevo = true,
    greenberg = true,
    namespace = true,
    tamiflu = true,
    easton = true,
    zdnet = true,
    alicante = true,
    technics = true,
    autodesk = true,
    pradesh = true,
    xoana = true,
    leica = true,
    macau = true,
    reged = true,
    newbury = true,
    ericsson = true,
    sandisk = true,
    suppl = true,
    letras = true,
    nederland = true,
    multicast = true,
    gratuite = true,
    gorillaz = true,
    katz = true,
    amex = true,
    gatwick = true,
    torino = true,
    repec = true,
    mundo = true,
    andreas = true,
    constr = true,
    newsgator = true,
    ionamin = true,
    zucchetto = true,
    tranny = true,
    onsite = true,
    ismaelite = true,
    ismdom = true,
    ismaili = true,
    ismal = true,
    smugmug = true,
    smilies = true,
    tantalism = true,
    tantalic = true,
    ishshakku = true,
    ishes = true,
    nadu = true,
    realtime = true,
    atebrin = true,
    ateuchi = true,
    ateba = true,
    ateknia = true,
    adaptec = true,
    yuzu = true,
    galerie = true,
    activex = true,
    alameda = true,
    anders = true,
    athlon = true,
    audiovox = true,
    axel = true,
    ayond = true,
    ayries = true,
    dimage = true,
    directx = true,
    eelfares = true,
    eeyuck = true,
    ektexine = true,
    ekuele = true,
    entre = true,
    eos = true,
    eosine = true,
    eosines = true,
    eozoonal = true,
    erotik = true,
    espanol = true,
    essex = true,
    hyatt = true,
    iacchic = true,
    iatric = true,
    iatrology = true,
    intactile = true,
    intagli = true,
    intail = true,
    kanye = true,
    kbytes = true,
    kerala = true,
    kyocera = true,
    lenox = true,
    lexar = true,
    lexmark = true,
    lightbox = true,
    mcb = true,
    mcf = true,
    mcg = true,
    mch = true,
    mci = true,
    mcp = true,
    mcr = true,
    mcs = true,
    mi = true,
    middlesex = true,
    ms = true,
    mw = true,
    neville = true,
    nortel = true,
    norwood = true,
    nouveau = true,
    orbitz = true,
    oxley = true,
    psilotum = true,
    psionics = true,
    psittaci = true,
    psize = true,
    sesso = true,
    sussex = true,
    tchick = true,
    tchincou = true,
    tcpip = true,
    terre = true,
    tesco = true,
    thanx = true,
    trembl = true,
    uralites = true,
    uralium = true,
    uxorially = true,
    vyase = true,
    vygies = true,
    vyingly = true,
    vyrnwy = true,
    xanax = true,
    xantheins = true,
    xanthenes = true,
    xanthins = true,
    xanthone = true,
    xbox = true,
    xerophily = true,
    xiphisterna = true,
    xiphisternum = true,
    xml = true,
    xray = true,
    xrays = true,
    xylidines = true,
    xylitol = true
}
local wK = "SMSM_Blacklist.txt"
local QK = "SMSM_Rejected_Words.txt"
pcall(
    function()
        if vI and (isfile(wK) and JI) then
            local s = readfile(wK)
            for s in s:gmatch("[^\r\n]+") do
                dK[(s:lower()):gsub("%s+", "")] = true
            end
        end
    end
)
local function qK(s)
    if not s or dK[s] then
        return
    end
    dK[s] = true
    pcall(
        function()
            if type(appendfile) == "function" then
                appendfile(wK, s .. "\n")
            elseif UI then
                local X = ""
                if vI and (isfile(wK) and JI) then
                    X = readfile(wK)
                end
                writefile(wK, X .. (s .. "\n"))
            end
        end
    )
end
local function DK(s, X)
    pcall(
        function()
            local d = string.format("[%s] Prefix: %s | Word: %s\n", os.date("%X"), X or "?", s)
            if type(appendfile) == "function" then
                appendfile(QK, d)
            elseif UI then
                local s = ""
                if vI and (isfile(QK) and JI) then
                    s = readfile(QK)
                end
                writefile(QK, s .. d)
            end
        end
    )
end
local function OK(s, X)
    if not s then
        return
    end
    s = (s:lower()):gsub("%s+", "")
    if XK[s] or dK[s] then
        return
    end
    if #s < 3 or #s > 24 or not s:match("^%a+$") then
        return
    end
    if s:match("(.)%1%1") or sK(s) then
        return
    end
    XK[s] = true
    local d = (X == 1) and KI or ((X == 2) and II or TI)
    local w = (X == 1) and xI or ((X == 2) and VI or SI)
    table.insert(d, s)
    local Q = s:sub(1, 1)
    if not w[Q] then
        w[Q] = {}
    end
    table.insert(w[Q], s)
    if #s >= 2 then
        local X = s:sub(1, 2)
        if not w[X] then
            w[X] = {}
        end
        table.insert(w[X], s)
    end
    if #s >= 3 then
        local X = s:sub(1, 3)
        if not w[X] then
            w[X] = {}
        end
        table.insert(w[X], s)
    end
end
local rK = {
    era = {"erased", "eraser", "erasers", "erasure"},
    die = {"diego", "diets", "diesel", "dietary"},
    ing = {"ingram", "ingot", "ingots", "ingress", "ingredient", "ingredients", "ingenious"},
    ix = {"ixia", "ixias", "ixora", "ixoras"},
    ek = {"eking", "eked", "ekes"},
    ll = {"llama", "llamas", "llano", "llanos"},
    elf = {"elfin", "elves", "elfish"},
    vy = {"vying", "vyings"},
    dn = {"dnase", "dnieper"},
    bw = {"bwana", "bwanas"},
    pz = {"pzazz", "pzazzes"},
    xv = {"xvi", "xvii", "xviii"},
    xm = {"xmas", "xmases"},
    hw = {"hwyl", "hwyls"},
    oj = {"ojibwa", "ojibway"},
    zl = {"zloty", "zlotys"},
    rw = {"rwanda", "rwandan", "rwandans"},
    qw = {"qwerty", "qwerties"},
    ns = {"nsec"},
    ez = {"ezekiel", "ezra", "ezod", "ezods"},
    xat = {"xats"},
    xol = {"xolo", "xolos"},
    oss = {"ossuary", "osseous", "ossify", "ossicle"},
    ido = {"idol", "idols", "idolize", "idolise", "idolatry"},
    ["and"] = {"android", "andrew", "andante", "andre"},
    tc = {"tchotchke", "tcharik"},
    ism = {"ismailia", "ismailism", "ismailis"},
    ax = {"axial", "axiom", "axioms", "axles", "axle", "axes", "apex"},
    ate = {"atelier", "ateliers", "atheism", "athens"},
    ew = {"ewes", "ewer", "ewers"},
    xo = {"xonotlite", "xonotlites"},
    xi = {"xix", "ximenes"},
    kya = {"kyanites", "kyanite", "kyat"},
    ror = {"rorqual", "rorquals", "roridula"},
    sv = {"svelte", "svalbard"},
    awn = {"awned", "awning", "awnings"},
    ps = {"psycho", "psychic", "psalm", "psalms", "psychology", "pseudo"},
    op = {"opera", "operate", "opinion", "optical", "optics", "option", "options"},
    ta = {"tangible", "table", "tables", "tabular", "target", "targets", "tariff", "tariffs"},
    ad = {"address", "addition", "admit", "adopted", "adult", "advice", "advance", "advanced"},
    sk = {"sky", "skin", "skip", "skate", "skill", "skull", "skype", "sketch"},
    w = {"warwick", "water", "world", "write", "written", "wrong", "wrench", "waltz"},
    q = {"queen", "quick", "quiet", "quiz", "quote", "quartz", "quality"},
    z = {
        "zebra",
        "zebras",
        "zero",
        "zeros",
        "zinc",
        "zincs",
        "zipper",
        "zippers",
        "zombie",
        "zombies",
        "zone",
        "zones",
        "zoning",
        "zoology",
        "zoologist",
        "zucchini",
        "zeal",
        "zealous",
        "zenith",
        "zodiac",
        "zillion",
        "zymurgy",
        "zircon",
        "zirconia",
        "zambia",
        "zurich"
    },
    x = {"xray", "xrays", "xenon", "xenons", "xerox", "xylose", "xyloses", "xxix", "xcvii", "xlvii"},
    y = {
        "yacht",
        "yachts",
        "yahoo",
        "yankee",
        "yankees",
        "yard",
        "yards",
        "yellow",
        "yemen",
        "yesterday",
        "yield",
        "yielding",
        "yoga",
        "yogurt",
        "youth",
        "youths",
        "yummy"
    },
    j = {
        "jacket",
        "jaguar",
        "jail",
        "jargon",
        "jasmine",
        "javelin",
        "jealous",
        "jeans",
        "jelly",
        "jewel",
        "judge",
        "juice",
        "jungle",
        "jury",
        "justice"
    },
    e = {
        "eagle",
        "early",
        "earth",
        "easter",
        "eastern",
        "echo",
        "eclipse",
        "ecology",
        "economy",
        "edition",
        "educate",
        "effect",
        "effort",
        "eight",
        "either",
        "elastic",
        "elbow",
        "elder",
        "elect",
        "element",
        "elephant",
        "elite",
        "embark",
        "emerald",
        "emerge",
        "emotion",
        "empire",
        "employ",
        "empty",
        "enable",
        "enact",
        "enchant",
        "enclose",
        "endless",
        "endorse",
        "endure",
        "enemy",
        "energy",
        "enforce",
        "engage",
        "engine",
        "enhance",
        "enjoy",
        "enormous",
        "enough",
        "enrich",
        "ensure",
        "enter",
        "entire",
        "entity",
        "entrance",
        "entry",
        "envelope",
        "environ",
        "episode",
        "equal",
        "equation",
        "equip",
        "equity",
        "era",
        "erase",
        "erosion",
        "error",
        "erupt",
        "escape",
        "escort",
        "essay",
        "essence",
        "estate",
        "estimate",
        "eternal",
        "ethical",
        "ethics",
        "evacuate",
        "evaluate",
        "evening",
        "event",
        "evidence",
        "evident",
        "evil",
        "evolve",
        "exact",
        "examine",
        "example",
        "exceed",
        "excel",
        "except",
        "excess",
        "exchange",
        "excite",
        "exclude",
        "excuse",
        "execute",
        "exempt",
        "exercise",
        "exhaust",
        "exhibit",
        "exile",
        "exist",
        "exit",
        "exotic",
        "expand",
        "expect",
        "expense",
        "expert",
        "explain",
        "explicit",
        "explode",
        "explore",
        "export",
        "expose",
        "express",
        "extend",
        "extent",
        "extra",
        "extract",
        "extreme",
        "eyelid"
    },
    u = {
        "umbrella",
        "unable",
        "unaware",
        "uncle",
        "uncover",
        "under",
        "undergo",
        "understand",
        "undo",
        "unequal",
        "unfold",
        "unhappy",
        "uniform",
        "union",
        "unique",
        "unit",
        "unite",
        "unity",
        "universe",
        "unknown",
        "unless",
        "unlike",
        "unlock",
        "unseen",
        "until",
        "untrue",
        "unusual",
        "unveil",
        "update",
        "upgrade",
        "uphold",
        "upon",
        "upper",
        "upright",
        "uprising",
        "upset",
        "upstairs",
        "upward",
        "uranium",
        "urban",
        "urge",
        "urgent",
        "usage",
        "useful",
        "useless",
        "user",
        "usher",
        "usual",
        "utility",
        "utilize",
        "utmost",
        "utter",
        "uxorious"
    }
}
for s, X in ipairs(rK) do
    OK(X, 1)
end
local function yK()
    local s = 0
    if vI and JI then
        pcall(
            function()
                if isfile("FinishTheWord/whitelist.txt") then
                    local s = readfile("FinishTheWord/whitelist.txt")
                    for s in s:gmatch("%a+") do
                        OK(s, 1)
                    end
                end
            end
        )
        pcall(
            function()
                if isfile("FinishTheWord/words.txt") then
                    local X = readfile("FinishTheWord/words.txt")
                    local d = 0
                    for s in X:gmatch("%a+") do
                        OK(s, 2)
                        d = d + 1
                        if d % 40000 == 0 then
                            task.wait()
                        end
                    end
                    s = s + d
                end
            end
        )
        pcall(
            function()
                if isfile("FinishTheWord/master_words.txt") then
                    local X = readfile("FinishTheWord/master_words.txt")
                    local d = 0
                    for s in X:gmatch("%a+") do
                        OK(s, 3)
                        d = d + 1
                        if d % 50000 == 0 then
                            task.wait()
                        end
                    end
                    s = s + d
                end
            end
        )
    end
    return s > 0
end
local function oK(s, X, d)
    d = d or 3
    for d = 1, d, 1 do
        local w, Q =
            pcall(
            function()
                return game:HttpGet(s)
            end
        )
        if w and (Q and #Q > 1000) then
            local s = 0
            for d in Q:gmatch("%a+") do
                OK(d, X)
                s = s + 1
                if s % 35000 == 0 then
                    task.wait()
                end
            end
            return true
        end
        task.wait(1)
    end
    return false
end
task.spawn(
    function()
        local s = yK()
        oK(
            "https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt",
            1,
            2
        )
        if #TI < 50000 then
            oK("https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt", 3, 2)
            oK(
                "https://raw.githubusercontent.com/meetDeveloper/freeDictionaryAPI/master/meta/wordList/english.txt",
                3,
                2
            )
        end
    end
)
local function NK()
    for s, X in ipairs(game:GetDescendants()) do
        if not EI and (X:IsA("RemoteFunction") and X.Name == "RemoteFunction") then
            EI = X
        end
        if not HI and (X:IsA("RemoteEvent") and X.Name == "RemoteEvent") then
            HI = X
        end
    end
end
local ZK
pcall(
    function()
        ZK = game:GetService("CoreGui")
    end
)
if not ZK then
    ZK = LI:FindFirstChildOfClass("PlayerGui")
end
local mK = Instance.new("ScreenGui")
mK.Name = "BlackDev_VIP"
mK.ResetOnSpawn = false
mK.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
mK.Parent = ZK
_G.x9g = mK
local function eK(s, X)
    (Instance.new("UICorner", X)).CornerRadius = UDim.new(0, s)
end
local function lK(s, X, d)
    local w = Instance.new("UIStroke", d)
    w.Thickness = s
    w.Color = X
end
local function WK(s, X, d)
    (WI:Create(s, TweenInfo.new(X, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), d)):Play()
end
local function cK(s, X, d, w, Q, q, D, O)
    local r = Instance.new("TextLabel", s)
    r.Text = X
    r.TextSize = d
    r.TextColor3 = w
    r.Font = Q or Enum.Font.Gotham
    r.BackgroundTransparency = 1
    r.TextXAlignment = q or Enum.TextXAlignment.Left
    if D then
        r.Position = D
    end
    if O then
        r.Size = O
    end
    return r
end
local MK = 310
local LK = Instance.new("Frame", mK)
LK.Size = UDim2.new(0, MK, 0, 10)
LK.Position = UDim2.new(0, 18, .5, -210)
LK.BackgroundColor3 = Color3.fromRGB(15, 12, 24)
LK.BorderSizePixel = 0
LK.ClipsDescendants = true
LK.Active = true
eK(8, LK)
lK(1, Color3.fromRGB(34, 197, 94), LK)
local aK = Instance.new("UIGradient", LK)
aK.Color =
    ColorSequence.new(
    {ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 24, 15)), ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 15, 10))}
)
aK.Rotation = 90
local gK = Instance.new("Frame", LK)
gK.Size = UDim2.new(1, 0, 0, 58)
gK.BackgroundColor3 = Color3.fromRGB(12, 28, 16)
gK.BorderSizePixel = 0
eK(8, gK)
local KK = Instance.new("Frame", gK)
KK.Size = UDim2.new(1, 0, .5, 0)
KK.Position = UDim2.new(0, 0, .5, 0)
KK.BackgroundColor3 = Color3.fromRGB(12, 28, 16)
KK.BorderSizePixel = 0
local IK = Instance.new("Frame", LK)
IK.Size = UDim2.new(1, 0, 0, 1)
IK.Position = UDim2.new(0, 0, 0, 58)
IK.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
IK.BackgroundTransparency = .7
IK.BorderSizePixel = 0
local TK = Instance.new("Frame", gK)
TK.Size = UDim2.new(0, 7, 0, 7)
TK.Position = UDim2.new(0, 14, 0, 15)
TK.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
TK.BorderSizePixel = 0
eK(99, TK)
task.spawn(
    function()
        while mK and mK.Parent do
            WK(TK, .8, {BackgroundTransparency = .7})
            task.wait(.9)
            WK(TK, .8, {BackgroundTransparency = 0})
            task.wait(.9)
        end
    end
)
local xK =
    cK(
    gK,
    "BLACK DEV VIP",
    14,
    Color3.fromRGB(255, 255, 255),
    Enum.Font.GothamBold,
    Enum.TextXAlignment.Left,
    UDim2.new(0, 28, 0, 9),
    UDim2.new(0, 120, 0, 16)
)
local VK =
    cK(
    gK,
    "Finish The Word",
    11,
    Color3.fromRGB(74, 222, 128),
    Enum.Font.Gotham,
    Enum.TextXAlignment.Left,
    UDim2.new(0, 28, 0, 26),
    UDim2.new(1, -95, 0, 14)
)
task.spawn(
    function()
        pcall(
            function()
                local s = ((game:GetService("MarketplaceService")):GetProductInfo(game.PlaceId)).Name
                VK.Text = s
            end
        )
    end
)
local SK =
    cK(
    gK,
    "Ready",
    10,
    Color3.fromRGB(34, 197, 94),
    Enum.Font.Gotham,
    Enum.TextXAlignment.Left,
    UDim2.new(0, 28, 0, 41),
    UDim2.new(1, -95, 0, 12)
)
local zK =
    cK(
    gK,
    "470K Words",
    10,
    Color3.fromRGB(34, 197, 94),
    Enum.Font.GothamMedium,
    Enum.TextXAlignment.Right,
    UDim2.new(1, -155, 0, 10),
    UDim2.new(0, 85, 0, 14)
)
local FK = Instance.new("TextButton", gK)
FK.Size = UDim2.new(0, 26, 0, 26)
FK.Position = UDim2.new(1, -30, 0, 8)
FK.BackgroundTransparency = 1
FK.Text = "X"
FK.TextColor3 = Color3.fromRGB(244, 63, 94)
FK.Font = Enum.Font.GothamBold
FK.TextSize = 12
local jK = Instance.new("TextButton", gK)
jK.Size = UDim2.new(0, 26, 0, 26)
jK.Position = UDim2.new(1, -58, 0, 8)
jK.BackgroundTransparency = 1
jK.Text = "-"
jK.TextColor3 = Color3.fromRGB(74, 222, 128)
jK.Font = Enum.Font.GothamBold
jK.TextSize = 15
task.spawn(
    function()
        while mK and mK.Parent do
            local s = (#KI + #II) + #TI
            if s > 50000 then
                zK.Text = math.floor(s / 1000) .. "K Words"
            else
                zK.Text = s .. " Words"
            end
            task.wait(2)
        end
    end
)
local kK, PK, EK = false, nil, nil
aI(
    gK.InputBegan:Connect(
        function(s)
            if s.UserInputType == Enum.UserInputType.MouseButton1 or s.UserInputType == Enum.UserInputType.Touch then
                kK = true
                PK = s.Position
                EK = LK.Position
                local X
                X =
                    s.Changed:Connect(
                    function()
                        if s.UserInputState == Enum.UserInputState.End then
                            kK = false
                            X:Disconnect()
                        end
                    end
                )
            end
        end
    )
)
aI(
    lI.InputChanged:Connect(
        function(s)
            if
                kK and
                    (s.UserInputType == Enum.UserInputType.MouseMovement or s.UserInputType == Enum.UserInputType.Touch)
             then
                local X = s.Position - PK
                WK(LK, .07, {Position = UDim2.new(EK.X.Scale, EK.X.Offset + X.X, EK.Y.Scale, EK.Y.Offset + X.Y)})
            end
        end
    )
)
aI(
    lI.InputBegan:Connect(
        function(s, X)
            if not X and s.KeyCode == Enum.KeyCode.RightShift then
                mK.Enabled = not mK.Enabled
            end
        end
    )
)
local HK = 66
local function iK(s)
    local X = Instance.new("Frame", LK)
    X.Size = UDim2.new(1, -16, 0, s)
    X.Position = UDim2.new(0, 8, 0, HK)
    X.BackgroundColor3 = Color3.fromRGB(12, 28, 16)
    X.BorderSizePixel = 0
    eK(6, X)
    lK(1, Color3.fromRGB(34, 197, 94), X)
    HK = (HK + s) + 6
    return X
end
local function UK(s, X, d, w)
    local Q = X and #X > 0
    local q = iK(Q and 48 or 40)
    local D = Instance.new("TextButton", q)
    D.Size = UDim2.new(1, 0, 1, 0)
    D.BackgroundTransparency = 1
    D.Text = ""
    D.AutoButtonColor = false
    if Q then
        cK(
            q,
            s,
            12,
            Color3.fromRGB(245, 240, 255),
            Enum.Font.GothamBold,
            Enum.TextXAlignment.Left,
            UDim2.new(0, 12, 0, 7),
            UDim2.new(.65, 0, 0, 16)
        )
        cK(
            q,
            X,
            10,
            Color3.fromRGB(134, 239, 172),
            Enum.Font.Gotham,
            Enum.TextXAlignment.Left,
            UDim2.new(0, 12, 0, 24),
            UDim2.new(.65, 0, 0, 14)
        )
    else
        cK(
            q,
            s,
            12,
            Color3.fromRGB(245, 240, 255),
            Enum.Font.GothamBold,
            Enum.TextXAlignment.Left,
            UDim2.new(0, 12, .5, -8),
            UDim2.new(.65, 0, 0, 16)
        )
    end
    local O = Instance.new("Frame", q)
    O.Size = UDim2.new(0, 40, 0, 22)
    O.Position = UDim2.new(1, -50, .5, -11)
    O.BackgroundColor3 = d and Color3.fromRGB(34, 197, 94) or Color3.fromRGB(20, 48, 24)
    O.BorderSizePixel = 0
    eK(99, O)
    local r = Instance.new("Frame", O)
    r.Size = UDim2.new(0, 16, 0, 16)
    r.Position = d and UDim2.new(1, -18, .5, -8) or UDim2.new(0, 2, .5, -8)
    r.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r.BorderSizePixel = 0
    eK(99, r)
    local y = d
    D.MouseButton1Click:Connect(
        function()
            y = not y
            w(y)
            WK(O, .16, {BackgroundColor3 = y and Color3.fromRGB(34, 197, 94) or Color3.fromRGB(20, 48, 24)})
            WK(r, .16, {Position = y and UDim2.new(1, -18, .5, -8) or UDim2.new(0, 2, .5, -8)})
        end
    )
    D.MouseEnter:Connect(
        function()
            WK(q, .1, {BackgroundColor3 = Color3.fromRGB(32, 22, 52)})
        end
    )
    D.MouseLeave:Connect(
        function()
            WK(q, .1, {BackgroundColor3 = Color3.fromRGB(12, 28, 16)})
        end
    )
end
local function JK(s, X, d, w)
    local Q = iK(54)
    cK(
        Q,
        s,
        12,
        Color3.fromRGB(245, 240, 255),
        Enum.Font.GothamBold,
        Enum.TextXAlignment.Left,
        UDim2.new(0, 12, 0, 8),
        UDim2.new(.5, 0, 0, 16)
    )
    local q =
        cK(
        Q,
        X[d].l,
        12,
        Color3.fromRGB(34, 197, 94),
        Enum.Font.GothamBold,
        Enum.TextXAlignment.Right,
        UDim2.new(.4, 0, 0, 8),
        UDim2.new(.56, -12, 0, 16)
    )
    local D = Instance.new("Frame", Q)
    D.Size = UDim2.new(1, -24, 0, 4)
    D.Position = UDim2.new(0, 12, 0, 36)
    D.BackgroundColor3 = Color3.fromRGB(20, 48, 24)
    D.BorderSizePixel = 0
    eK(99, D)
    local O = Instance.new("Frame", D)
    O.Size = UDim2.new(0, 0, 1, 0)
    O.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    O.BorderSizePixel = 0
    eK(99, O)
    local r = Instance.new("Frame", D)
    r.Size = UDim2.new(0, 12, 0, 12)
    r.Position = UDim2.new(0, -6, .5, -6)
    r.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    r.BorderSizePixel = 0
    r.ZIndex = 5
    eK(99, r)
    lK(1.5, Color3.fromRGB(34, 197, 94), r)
    local function y(s)
        s = math.clamp(s, 1, #X)
        q.Text = X[s].l
        local d = (s - 1) / (#X - 1)
        if d ~= d then
            d = 0
        end
        WK(O, .08, {Size = UDim2.new(d, 0, 1, 0)})
        WK(r, .08, {Position = UDim2.new(d, -6, .5, -6)})
        w(X[s].v)
    end
    y(d)
    local o = false
    local function N(s)
        local d = math.clamp((s - D.AbsolutePosition.X) / D.AbsoluteSize.X, 0, 1)
        y(math.round(d * (#X - 1)) + 1)
    end
    aI(
        D.InputBegan:Connect(
            function(s)
                if s.UserInputType == Enum.UserInputType.MouseButton1 or s.UserInputType == Enum.UserInputType.Touch then
                    o = true
                    N(s.Position.X)
                end
            end
        )
    )
    aI(
        r.InputBegan:Connect(
            function(s)
                if s.UserInputType == Enum.UserInputType.MouseButton1 or s.UserInputType == Enum.UserInputType.Touch then
                    o = true
                end
            end
        )
    )
    aI(
        lI.InputChanged:Connect(
            function(s)
                if
                    o and
                        (s.UserInputType == Enum.UserInputType.MouseMovement or
                            s.UserInputType == Enum.UserInputType.Touch)
                 then
                    N(s.Position.X)
                end
            end
        )
    )
    aI(
        lI.InputEnded:Connect(
            function(s)
                if s.UserInputType == Enum.UserInputType.MouseButton1 or s.UserInputType == Enum.UserInputType.Touch then
                    o = false
                end
            end
        )
    )
end
local function vK(s, X, d)
    local w = iK(46)
    local Q = Instance.new("TextButton", w)
    Q.Size = UDim2.new(1, 0, 1, 0)
    Q.BackgroundTransparency = 1
    Q.Text = ""
    Q.AutoButtonColor = false
    cK(
        w,
        s,
        12,
        Color3.fromRGB(245, 240, 255),
        Enum.Font.GothamBold,
        Enum.TextXAlignment.Left,
        UDim2.new(0, 12, 0, 7),
        UDim2.new(.65, 0, 0, 16)
    )
    cK(
        w,
        X,
        10,
        Color3.fromRGB(134, 239, 172),
        Enum.Font.Gotham,
        Enum.TextXAlignment.Left,
        UDim2.new(0, 12, 0, 24),
        UDim2.new(.65, 0, 0, 14)
    )
    local q =
        cK(
        w,
        ">",
        16,
        Color3.fromRGB(34, 197, 94),
        Enum.Font.GothamBold,
        Enum.TextXAlignment.Center,
        UDim2.new(1, -36, .5, -8),
        UDim2.new(0, 16, 0, 16)
    )
    Q.MouseButton1Click:Connect(
        function()
            WK(q, .08, {TextSize = 12})
            task.wait(.02)
            WK(q, .08, {TextSize = 16})
            d()
        end
    )
    Q.MouseEnter:Connect(
        function()
            WK(w, .1, {BackgroundColor3 = Color3.fromRGB(32, 22, 52)})
        end
    )
    Q.MouseLeave:Connect(
        function()
            WK(w, .1, {BackgroundColor3 = Color3.fromRGB(12, 28, 16)})
        end
    )
end
UK(
    "Auto Answer",
    "Types best word automatically",
    gI.ans,
    function(s)
        gI.ans = s
    end
)
UK(
    "Trap Opponents",
    nil,
    gI.trapMode,
    function(s)
        gI.trapMode = s
    end
)
vK(
    "Server Hop",
    "Join a new public server",
    function()
        task.spawn(iI)
    end
)
vK(
    "Join Discord",
    "Black Dev Community",
    function()
        local s = "APBg662gH"
        local X = "https://discord.gg/" .. s
        if setclipboard then
            pcall(setclipboard, X)
        end
    end
)
JK(
    "Word Length",
    {{l = "Long", v = 1}, {l = "Natural", v = 2}, {l = "Short", v = 3}},
    2,
    function(s)
        gI.lengthMode = s
    end
)
JK(
    "Typing Speed",
    {
        {l = "Instant", v = .01},
        {l = "Godlike", v = .03},
        {l = "Fast", v = .05},
        {l = "Quick", v = .08},
        {l = "Normal", v = .11},
        {l = "Natural", v = .15},
        {l = "Slow", v = .2}
    },
    4,
    function(s)
        gI.delay = s
    end
)
JK(
    "Reaction Time",
    {
        {l = "Instant", v = 0},
        {l = "Fast", v = .3},
        {l = "Normal", v = .8},
        {l = "Thinking", v = 1.5},
        {l = "Slow", v = 2.5}
    },
    1,
    function(s)
        gI.reaction = s
    end
)
local pK = iK(46)
cK(
    pK,
    "CURRENT WORD",
    9,
    Color3.fromRGB(134, 239, 172),
    Enum.Font.GothamBold,
    Enum.TextXAlignment.Left,
    UDim2.new(0, 12, 0, 5),
    UDim2.new(.6, 0, 0, 12)
)
local YK =
    cK(
    pK,
    "",
    10,
    Color3.fromRGB(34, 197, 94),
    Enum.Font.GothamBold,
    Enum.TextXAlignment.Right,
    UDim2.new(0, 0, 0, 4),
    UDim2.new(1, -12, 0, 14)
)
local uK = Instance.new("TextBox", pK)
uK.Text = "---"
uK.TextSize = 16
uK.TextColor3 = Color3.fromRGB(255, 255, 255)
uK.Font = Enum.Font.GothamBold
uK.BackgroundTransparency = 1
uK.TextXAlignment = Enum.TextXAlignment.Left
uK.Position = UDim2.new(0, 12, 0, 18)
uK.Size = UDim2.new(1, -24, 0, 22)
uK.ClearTextOnFocus = true
uK.PlaceholderText = "Type prefix if stuck..."
local AK = iK(30)
local nK = Instance.new("Frame", AK)
nK.Size = UDim2.new(0, 6, 0, 6)
nK.Position = UDim2.new(0, 12, .5, -3)
nK.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
nK.BorderSizePixel = 0
eK(99, nK)
local BK =
    cK(
    AK,
    "Ready",
    11,
    Color3.fromRGB(74, 222, 128),
    Enum.Font.GothamMedium,
    Enum.TextXAlignment.Left,
    UDim2.new(0, 25, 0, 0),
    UDim2.new(1, -28, 1, 0)
)
local hK = HK + 8
LK.Size = UDim2.new(0, MK, 0, hK)
local tK = false
jK.MouseButton1Click:Connect(
    function()
        tK = not tK
        if tK then
            WK(LK, .2, {Size = UDim2.new(0, MK, 0, 58)})
        else
            WK(LK, .2, {Size = UDim2.new(0, MK, 0, hK)})
        end
    end
)
FK.MouseButton1Click:Connect(
    function()
        if _G.x9c then
            for s, X in pairs(_G.x9c) do
                pcall(
                    function()
                        X:Disconnect()
                    end
                )
            end
        end
        if _G.x9g then
            pcall(
                function()
                    _G.x9g:Destroy()
                end
            )
        end
    end
)
local function RK(s, X)
    local d = X or Color3.fromRGB(34, 197, 94)
    BK.Text = s
    BK.TextColor3 = d
    nK.BackgroundColor3 = d
    SK.Text = s
    SK.TextColor3 = d
    TK.BackgroundColor3 = d
end
local fK = nil
local function bK()
    if fK and (fK.Parent and fK.Visible) then
        return fK
    end
    local s = lI:GetFocusedTextBox()
    if s and not s:IsDescendantOf(mK) then
        fK = s
        return s
    end
    local X = LI:FindFirstChildOfClass("PlayerGui")
    if not X then
        return nil
    end
    for s, X in ipairs(X:GetDescendants()) do
        if X:IsA("TextBox") and (X.Visible and X.AbsoluteSize.Y > 15) then
            if not X:IsDescendantOf(mK) and X.Name ~= "ChatBar" then
                fK = X
                return X
            end
        end
    end
    return nil
end
task.spawn(
    function()
        pcall(
            function()
                if type(getconnections) == "function" then
                    for s, X in ipairs(getconnections(LI.Idled)) do
                        if X.Disable then
                            X:Disable()
                        elseif X.Disconnect then
                            X:Disconnect()
                        end
                    end
                end
            end
        )
        local s = game:GetService("VirtualUser")
        aI(
            LI.Idled:Connect(
                function()
                    pcall(
                        function()
                            s:CaptureController()
                            s:ClickButton2(Vector2.new(0, 0))
                        end
                    )
                    pcall(
                        function()
                            cI:SendKeyEvent(true, Enum.KeyCode.Unknown, false, game)
                            task.wait(.05)
                            cI:SendKeyEvent(false, Enum.KeyCode.Unknown, false, game)
                        end
                    )
                end
            )
        )
        task.spawn(
            function()
                while true do
                    task.wait(300)
                    pcall(
                        function()
                            s:CaptureController()
                            s:ClickButton2(Vector2.new(0, 0))
                        end
                    )
                    pcall(
                        function()
                            cI:SendKeyEvent(true, Enum.KeyCode.Unknown, false, game)
                            task.wait(.02)
                            cI:SendKeyEvent(false, Enum.KeyCode.Unknown, false, game)
                        end
                    )
                end
            end
        )
    end
)
BI = function()
end
hI = function(s, X, d, w)
    X = X or ""
    d = d or ""
    w = w or ""
    if s == "REJECTED" then
        if not uI[d:lower()] then
            uI[d:lower()] = true
            table.insert(YI, d:lower())
        end
        DK(d:lower(), X:lower())
        qK(d:lower())
    elseif s == "NO_MATCH" then
        if not nI[X:lower()] then
            nI[X:lower()] = true
            table.insert(AI, X:lower())
        end
        RI(X:lower())
    end
end
local function CK(s, X, d)
    if #X > 0 and s:sub(1, #X) ~= X then
        return false
    end
    local w = (#X <= 1) and 4 or (#X + 1)
    if #s < w then
        return false
    end
    if d and d ~= "" then
        local X = d:match("(%d+)%+%s*letters") or d:match("with%s+(%d+)%+") or d:match("(%d+)%s*letters")
        if X and #s < tonumber(X) then
            return false
        end
        local w = d:match("ends%s+with%s+(%a+)") or d:match("ending%s+with%s+(%a+)")
        if w and s:sub(-(#w)) ~= w then
            return false
        end
        local Q = d:match("contains%s+(%a+)") or d:match("contain%s+(%a+)")
        if Q and not s:find(Q, 1, true) then
            return false
        end
    end
    return true
end
local function GK(s)
    if #s < 3 or #s > 14 then
        return false
    end
    local X = s:lower()
    if
        X:find("wiki") or X:find("soft") or X:find("ware") or X:find("site") or X:find("online") or X:find("cyber") or
            X:find("tech") or
            X:find("corp") or
            X:find("ebook") or
            X:find("everytime") or
            X:find("realtime") or
            X:find("namespace")
     then
        return false
    end
    if X:match("(%a)%1%1") then
        return false
    end
    return true
end
local function sd(s, X, d, w)
    s = ((s or ""):lower()):gsub("%s+", "")
    X = (X or ""):lower()
    if rK[s] then
        local w = {}
        for Q, q in ipairs(rK[s]) do
            if not dK[q] and ((d or not zI[q]) and (GK(q) and CK(q, s, X))) then
                table.insert(w, q)
            end
        end
        if #w > 0 then
            return w[math.random(1, #w)]
        end
    end
    local function Q(w, Q)
        local q = nil
        if #s == 0 then
            q = Q
        elseif #s >= 3 then
            q = w[s:sub(1, 3)] or w[s:sub(1, 2)] or w[s:sub(1, 1)] or {}
        elseif #s == 2 then
            q = w[s] or w[s:sub(1, 1)] or {}
        else
            q = w[s] or {}
        end
        local D = {}
        local O = #q
        if O == 0 then
            return D
        end
        local r = math.random(1, O)
        local y = 25
        local o = math.min(O, 2500)
        for w = 1, o, 1 do
            local Q = (((r + w) - 2) % O) + 1
            local o = q[Q]
            if not dK[o] and ((d or not zI[o]) and (GK(o) and CK(o, s, X))) then
                table.insert(D, o)
                if #D >= y then
                    break
                end
            end
        end
        return D
    end
    local q = Q(xI, KI)
    if #q == 0 then
        q = Q(VI, II)
    end
    if #q == 0 then
        q = Q(SI, TI)
    end
    if #q == 0 then
        return nil
    end
    if w > 1 then
        local s = {}
        for X, d in ipairs(q) do
            if #d >= 5 and #d <= 8 then
                table.insert(s, d)
            end
        end
        if #s > 0 then
            return s[math.random(1, #s)]
        else
            return q[math.random(1, #q)]
        end
    end
    if gI.trapMode and w == 1 then
        local s = {
            box = true,
            fox = true,
            six = true,
            tax = true,
            wax = true,
            mix = true,
            fix = true,
            relax = true,
            complex = true,
            matrix = true,
            index = true,
            prefix = true,
            suffix = true,
            climax = true,
            reflex = true,
            syntax = true,
            vertex = true,
            cortex = true,
            duplex = true,
            inbox = true,
            mailbox = true,
            sandbox = true,
            outbox = true,
            icebox = true,
            toolbox = true,
            apex = true,
            crux = true,
            flux = true,
            lynx = true,
            onyx = true,
            sphinx = true,
            flax = true,
            detox = true,
            affix = true,
            unfix = true,
            remix = true,
            coax = true,
            hoax = true,
            phlox = true,
            paradox = true,
            orthodox = true,
            equinox = true,
            crucifix = true,
            menu = true,
            guru = true,
            tofu = true,
            emu = true,
            flu = true,
            bayou = true,
            bureau = true,
            plateau = true,
            chateau = true,
            kudu = true,
            gnu = true,
            tutu = true,
            luau = true,
            haiku = true,
            sudoku = true,
            yuzu = true,
            tiramisu = true,
            caribou = true,
            blitz = true,
            waltz = true,
            quiz = true,
            buzz = true,
            fizz = true,
            jazz = true,
            fuzz = true
        }
        local X = {}
        for d, w in ipairs(q) do
            if s[w] then
                table.insert(X, w)
            end
        end
        if #X == 0 then
            for s, d in ipairs(q) do
                local w = d:sub(-1)
                if w == "x" or w == "u" or w == "z" then
                    table.insert(X, d)
                end
            end
        end
        if #X > 0 then
            q = X
        end
    end
    if gI.lengthMode == 1 then
        table.sort(
            q,
            function(s, X)
                return #s > #X
            end
        )
        local s = math.clamp(math.random(1, math.min(4, #q)), 1, #q)
        return q[s]
    elseif gI.lengthMode == 3 then
        local X = {}
        for d, w in ipairs(q) do
            if #w >= math.max(#s + 1, 4) and #w <= 6 then
                table.insert(X, w)
            end
        end
        if #X > 0 then
            return X[math.random(1, #X)]
        else
            table.sort(
                q,
                function(s, X)
                    return #s < #X
                end
            )
            return q[1]
        end
    else
        local s = {}
        local X = {}
        for d, w in ipairs(q) do
            local Q = #w
            if Q >= 5 and Q <= 9 then
                table.insert(s, w)
            elseif Q >= 4 and Q <= 11 then
                table.insert(X, w)
            end
        end
        if #s > 0 then
            return s[math.random(1, #s)]
        elseif #X > 0 then
            return X[math.random(1, #X)]
        else
            return q[math.random(1, #q)]
        end
    end
end
local function Xd(s)
    local X = bK()
    if X then
        pcall(
            function()
                X.Text = ""
            end
        )
    end
    for s = 1, s, 1 do
        pcall(
            function()
                cI:SendKeyEvent(true, Enum.KeyCode.Backspace, false, game)
                task.wait(.008)
                cI:SendKeyEvent(false, Enum.KeyCode.Backspace, false, game)
            end
        )
        if gI.clearDelay > 0 then
            task.wait(gI.clearDelay)
        end
    end
end
local function dd(s, X, d)
    zI[s] = true
    FI[s] = os.time()
    X = (X:lower()):gsub("%s+", "")
    local w = s:sub(#X + 1)
    local Q = #w
    uK.Text = X:upper() .. string.rep("_", Q)
    YK.Text = "0 / " .. Q
    RK("Typing: " .. s:upper(), Color3.fromRGB(34, 197, 94))
    if gI.reaction > 0 then
        local s = 0
        while s < gI.reaction do
            task.wait(.05)
            s = s + .05
            if PI ~= d then
                return "roundChanged"
            end
        end
    end
    local q = bK()
    if q then
        pcall(
            function()
                q:CaptureFocus()
                q.Text = ""
            end
        )
        task.wait(.04)
    end
    if PI ~= d then
        return "roundChanged"
    end
    local D = (X:sub(-1)):upper()
    for s = 1, Q, 1 do
        if PI ~= d then
            return "roundChanged"
        end
        local q = (w:sub(s, s)):upper()
        local O = bI[q]
        if O then
            if q == D then
                task.wait(.03)
            end
            D = q
            pcall(
                function()
                    cI:SendKeyEvent(true, O, false, game)
                    task.wait(.022)
                    cI:SendKeyEvent(false, O, false, game)
                end
            )
        end
        local r = X:upper() .. ((w:sub(1, s)):upper() .. string.rep("_", Q - s))
        uK.Text = r
        YK.Text = s .. (" / " .. Q)
        local y = math.max(.025, gI.delay * (.85 + math.random() * .25))
        task.wait(y)
    end
    if PI ~= d then
        return "roundChanged"
    end
    task.wait(.06)
    if q then
        pcall(
            function()
                if q.Text ~= w and #q.Text < #w then
                    q.Text = w
                end
            end
        )
    end
    task.wait(.03)
    pcall(
        function()
            cI:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(.04)
            cI:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end
    )
    if q then
        pcall(
            function()
                q:ReleaseFocus(true)
            end
        )
    end
    RK("Sent: " .. s:upper(), Color3.fromRGB(34, 197, 94))
    local O = 0
    while O < 1 do
        task.wait(.05)
        O = O + .05
        if PI ~= d then
            hI("ACCEPTED", X, s, "Accepted by server")
            return "accepted"
        end
    end
    qK(s)
    hI("REJECTED", X, s, "Server did not accept word")
    return "rejected"
end
local function wd()
    if kI or not jI then
        return
    end
    kI = true
    local s = PI
    if jI.Choices then
        if gI.cho then
            local s = jI.Choices[1]
            if s then
                uK.Text = s:upper()
                YK.Text = "CHOICE"
                RK("Selecting: " .. s:upper(), Color3.fromRGB(34, 197, 94))
                fireRemote("chooseLetter", s:lower())
                hI("INFO", "", "", "Selected Choice Letter: " .. s:upper())
            end
        end
        kI = false
        return
    end
    if not gI.ans then
        kI = false
        return
    end
    local X = ((jI.RequiredLetter or ""):lower()):gsub("%s+", "")
    local d = (jI.QuestionLabel or ""):lower()
    for w = 1, 6, 1 do
        if PI ~= s then
            break
        end
        local Q = sd(X, d, false, w)
        if not Q then
            Q = sd(X, d, true, w)
        end
        if not Q then
            RK("No match for: " .. X:upper(), Color3.fromRGB(255, 150, 0))
            hI("NO_MATCH", X, "", "No matching word found in any dictionary tier")
            uK.Text = "---"
            YK.Text = ""
            break
        end
        local q = dd(Q, X, s)
        if q == "accepted" or q == "roundChanged" then
            break
        elseif q == "rejected" then
            RK("Rejected! Retrying (" .. (w .. "/6)..."), Color3.fromRGB(255, 50, 50))
            task.wait(.02)
            local s = Q:sub(#X + 1)
            Xd(#s + 4)
            task.wait(.04)
        end
    end
    uK.Text = "---"
    YK.Text = ""
    kI = false
end
function iI()
    RK("Hopping Servers...", Color3.fromRGB(34, 197, 94))
    local s = game:GetService("TeleportService")
    local X = game.PlaceId
    local d = {}
    local w = request or http_request or (syn and syn.request)
    if w then
        pcall(
            function()
                local s =
                    w(
                    {
                        Url = "https://games.roblox.com/v1/games/" .. (X .. "/servers/Public?sortOrder=Desc&limit=100"),
                        Method = "GET"
                    }
                )
                if s and s.Body then
                    local X = MI:JSONDecode(s.Body)
                    if X and X.data then
                        for s, X in ipairs(X.data) do
                            if X.playing < X.maxPlayers and X.id ~= game.JobId then
                                table.insert(d, X.id)
                            end
                        end
                    end
                end
            end
        )
    end
    if #d > 0 then
        local w = d[math.random(1, #d)]
        s:TeleportToPlaceInstance(X, w, LI)
    else
        s:Teleport(X, LI)
    end
end
task.spawn(
    function()
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        task.wait(1.2)
        local s = 0
        repeat
            NK()
            if not EI or not HI then
                s = s + .5
                RK("Scanning... (" .. (s .. "s)"), Color3.fromRGB(255, 150, 0))
                task.wait(.5)
            end
        until (EI and HI) or s >= 25
        if not HI then
            for s, X in ipairs(game:GetDescendants()) do
                if X:IsA("RemoteFunction") and not EI then
                    EI = X
                end
                if X:IsA("RemoteEvent") and not HI then
                    HI = X
                end
            end
        end
        if not HI then
            RK("Error: Remotes not found", Color3.fromRGB(255, 50, 50))
            hI("INFO", "", "", "ERROR: Remotes not found in game")
            return
        end
        local X, d = 0, 0
        for s, w in ipairs(game:GetDescendants()) do
            if w:IsA("RemoteEvent") then
                X = X + 1
            end
            if w:IsA("RemoteFunction") then
                d = d + 1
            end
        end
        RK("Connected (" .. (X .. (" RE / " .. (d .. " RF)"))), Color3.fromRGB(34, 197, 94))
        hI("INFO", "", "", "Successfully connected to Game Remotes (" .. (X .. (" RE / " .. (d .. " RF)"))))
        aI(
            HI.OnClientEvent:Connect(
                function(s, ...)
                    local X = {...}
                    for s, X in ipairs(X) do
                        if type(X) == "string" and (#X >= 2 and not X:match("[^%a]")) then
                            local s = (X:lower()):gsub("%s+", "")
                            zI[s] = true
                        end
                    end
                    if s == "updateRound" then
                        PI = PI + 1
                        jI = X[1]
                        kI = false
                        local s = false
                        if X[3] then
                            if typeof(X[3]) == "Instance" and X[3]:IsA("Player") then
                                s = (X[3] == LI)
                            elseif type(X[3]) == "string" then
                                s = (X[3]:lower() == LI.Name:lower()) or (X[3]:lower() == LI.DisplayName:lower())
                            end
                        end
                        if s then
                            hI(
                                "INFO",
                                jI and jI.RequiredLetter or "",
                                "",
                                "My Turn! Prompt: '" .. ((jI and jI.RequiredLetter or "?") .. "'")
                            )
                            task.spawn(wd)
                        else
                            RK("Waiting for turn...", Color3.fromRGB(134, 239, 172))
                        end
                    elseif s == "correct" then
                        PI = PI + 1
                        RK("Correct!", Color3.fromRGB(34, 197, 94))
                    elseif s == "incorrect" or s == "wrong" then
                        RK("Wrong word!", Color3.fromRGB(255, 50, 50))
                    end
                end
            )
        )
        aI(
            uK.FocusLost:Connect(
                function()
                    local s = uK.Text:match("^%a+")
                    if s and #s > 0 then
                        jI = {RequiredLetter = s}
                        kI = false
                        PI = PI + 1
                        hI("INFO", s, "", "Manual input triggered for: '" .. (s .. "'"))
                        task.spawn(wd)
                    else
                        uK.Text = "---"
                    end
                end
            )
        )
        aI(
            (LI:GetAttributeChangedSignal("InGame")):Connect(
                function()
                    if not LI:GetAttribute("InGame") then
                        table.clear(zI)
                        PI = PI + 1
                        jI = nil
                        kI = false
                        uK.Text = "---"
                        YK.Text = ""
                        RK("Lobby", Color3.fromRGB(134, 239, 172))
                        hI("INFO", "", "", "Returned to Lobby. Cleared match words cache.")
                    end
                end
            )
        )
    end
)
