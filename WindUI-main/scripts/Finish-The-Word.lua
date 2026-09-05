-- ============================================================
-- xFuxk | Finish The Word! | RANKED — v2.0 KILLER EDITION
-- Massive dictionary + Killer Mode + Zero-Loss
-- ============================================================

-- ============================================================
-- EXECUTOR ALIASES
-- ============================================================
local _gethui       = gethui or get_hui or get_hidden_gui or get_hidden_ui or gethiddengui
local _writefile    = writefile or write_file
local _readfile     = readfile or read_file
local _isfile       = isfile or is_file or file_exists
local _makefolder   = makefolder or make_folder or createfolder
local _isfolder     = isfolder or is_folder or folder_exists

-- ============================================================
-- GAME CHECK
-- ============================================================
local RS = game:GetService("ReplicatedStorage")
local Services = RS:WaitForChild("Services", 20)
if not Services or not Services:FindFirstChild("Communication") then return end

-- ============================================================
-- SERVICES
-- ============================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

local Comm = Services:WaitForChild("Communication")
local event = require(Comm:WaitForChild("event"))

-- ============================================================
-- THEME
-- ============================================================
local THEME = {
    bg = Color3.fromRGB(7, 7, 9),
    accent = Color3.fromRGB(120, 200, 255),
    green = Color3.fromRGB(110, 235, 150),
    orange = Color3.fromRGB(255, 175, 90),
    red = Color3.fromRGB(255, 110, 110),
    killer = Color3.fromRGB(255, 80, 80),
    text = Color3.fromRGB(245, 247, 250),
    textDim = Color3.fromRGB(175, 185, 200),
    rowBg = Color3.fromRGB(16, 16, 21),
    btnIdle = Color3.fromRGB(28, 28, 34),
    btnHover = Color3.fromRGB(48, 48, 58),
    closeIdle = Color3.fromRGB(165, 35, 40),
    closeHover = Color3.fromRGB(205, 55, 60),
    switchOff = Color3.fromRGB(48, 48, 56),
    white = Color3.fromRGB(255, 255, 255),
}

-- ============================================================
-- HUB STATE + DATA SAVE
-- ============================================================
local State = {
    autoAnswer = false,
    autoChoose = false,
    killerMode = false,  -- NEW: Killer Mode toggle
    speed = "human",
    used = {},
    blacklist = {},
    learnedValid = {},
    learnedInvalid = {},
    roundToken = 0,
    lastSubmitted = nil,
    lastSubmitTime = 0,
    retryPending = false,
    chain = 0,
}

local SPEEDS = {
    human = {keyMin = 0.09, keyMax = 0.22, pauseChance = 0.12, pauseMin = 0.12, pauseMax = 0.40, thinkMin = 0.5, thinkMax = 1.6},
    fast  = {keyMin = 0.02, keyMax = 0.05, pauseChance = 0.03, pauseMin = 0.05, pauseMax = 0.12, thinkMin = 0.2, thinkMax = 0.45},
}

-- ============================================================
-- KILLER LETTERS (hard endings to trap opponents)
-- ============================================================
local KILLER_SCORES = {
    x = 10, z = 9, q = 9, j = 8, v = 6, k = 5,
    b = 4, f = 3, w = 3, y = 2, g = 2, p = 2
}

local CONFIG_FILE = "xFuxk_FTW_Config.json"
local WORDDB_FILE = "xFuxk_FTW_WordDB.json"

local function saveConfig()
    if not _writefile then return end
    pcall(function()
        _writefile(CONFIG_FILE, HttpService:JSONEncode({
            autoAnswer = State.autoAnswer,
            autoChoose = State.autoChoose,
            killerMode = State.killerMode,
            speed = State.speed,
        }))
    end)
end

local function loadConfig()
    if _isfile and _isfile(CONFIG_FILE) and _readfile then
        pcall(function()
            local d = HttpService:JSONDecode(_readfile(CONFIG_FILE))
            if type(d) == "table" then
                State.autoAnswer = d.autoAnswer == true
                State.autoChoose = d.autoChoose == true
                State.killerMode = d.killerMode == true
                State.speed = SPEEDS[d.speed] and d.speed or "human"
            end
        end)
    end
end

local HARDCODED_BAD = {
    apeling = true, ayelp = true, cestoids = true, ehrman = true,
    gyeld = true, gyle = true, ichebu = true, ingene = true,
    ional = true, labrador = true, mnemic = true, oneill = true,
    onerously = true, ptr = true, tiewig = true, llaretas = true,
    digital = true, groupoids = true, zelotypie = true, muffineers = true,
}

local function cleanWord(w)
    if type(w) ~= "string" then return nil end
    local low = w:lower()
    if not low:match("^%a+$") then return nil end
    if #low < 3 or #low > 10 then return nil end
    if HARDCODED_BAD[low] then return nil end
    if low:match("son$") and #low > 6 then return nil end
    return low
end

local function loadWordDB()
    if _isfile and _isfile(WORDDB_FILE) and _readfile then
        pcall(function()
            local d = HttpService:JSONDecode(_readfile(WORDDB_FILE))
            if type(d) == "table" then
                if type(d.valid) == "table" then
                    for _, w in ipairs(d.valid) do
                        local c = cleanWord(w)
                        if c then State.learnedValid[c] = true end
                    end
                end
                if type(d.invalid) == "table" then
                    for _, w in ipairs(d.invalid) do
                        local c = cleanWord(w)
                        if c then State.learnedInvalid[c] = true end
                    end
                end
            end
        end)
    end
end

local dbDirty = false
local function saveWordDB()
    if not _writefile then return end
    pcall(function()
        local v, i = {}, {}
        for w in pairs(State.learnedValid) do v[#v+1] = w end
        for w in pairs(State.learnedInvalid) do i[#i+1] = w end
        table.sort(v)
        table.sort(i)
        _writefile(WORDDB_FILE, HttpService:JSONEncode({valid = v, invalid = i}))
    end)
end

loadConfig()
loadWordDB()

task.spawn(function()
    while true do
        task.wait(5)
        if dbDirty then
            dbDirty = false
            saveWordDB()
        end
    end
end)

-- ============================================================
-- UI SETUP
-- ============================================================
local function getHolder()
    local ok, h = pcall(function() return (_gethui and _gethui()) or game:GetService("CoreGui") end)
    if ok and h then return h end
    return player:WaitForChild("PlayerGui")
end

local holder = getHolder()
for _, child in ipairs(holder:GetChildren()) do
    if child:IsA("ScreenGui") and child.Name == "xFuxkRanked" then
        child:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "xFuxkRanked"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = false
ScreenGui.Enabled = true
pcall(function() ScreenGui.Parent = player:WaitForChild("PlayerGui") end)

if not ScreenGui.Parent then
    pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
end

-- ============================================================
-- MAIN FRAME
-- ============================================================
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 328, 0, 233)  -- Aumentado para el killer toggle
Main.Position = UDim2.new(0.02, 0, 0.1, 0)
Main.BackgroundColor3 = THEME.bg
Main.BackgroundTransparency = 0.08
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = THEME.accent
MainStroke.Transparency = 0.45
MainStroke.Thickness = 1.3
MainStroke.Parent = Main

-- ============================================================
-- PARTICLES
-- ============================================================
local Particles = Instance.new("Frame")
Particles.Name = "Particles"
Particles.Size = UDim2.fromScale(1, 1)
Particles.BackgroundTransparency = 1
Particles.BorderSizePixel = 0
Particles.ClipsDescendants = true
Particles.Parent = Main

local function spawnDot()
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    dot.Position = UDim2.new(math.random() * 0.95, 0, -0.06, 0)
    dot.BackgroundColor3 = THEME.white
    dot.BackgroundTransparency = math.random(25, 55) / 100
    dot.BorderSizePixel = 0
    dot.Parent = Particles
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local tween = TweenService:Create(dot,
        TweenInfo.new(math.random(5, 10), Enum.EasingStyle.Linear),
        { Position = UDim2.new(math.random() * 0.9 + 0.05, 0, 1.1, 0) })
    tween:Play()
    tween.Completed:Connect(function()
        dot:Destroy()
        if Particles.Parent then spawnDot() end
    end)
end

for i = 1, 28 do
    task.delay(i * 0.18, function()
        if Particles.Parent then spawnDot() end
    end)
end

-- ============================================================
-- TOPBAR
-- ============================================================
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 14, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "xFuxk | Finish The Word! | Ranked"
TitleLabel.TextColor3 = THEME.text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -16, 0, 1)
Divider.Position = UDim2.new(0, 8, 1, -1)
Divider.BackgroundColor3 = THEME.white
Divider.BackgroundTransparency = 0.55
Divider.BorderSizePixel = 0
Divider.Parent = TopBar

-- Header buttons
local function iconButton(name, x, isClose, drawFn)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 26, 0, 26)
    btn.Position = UDim2.new(1, x, 0.5, -13)
    btn.BackgroundColor3 = isClose and THEME.closeIdle or THEME.btnIdle
    btn.BackgroundTransparency = 0.15
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = TopBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(isClose and 1 or 0, isClose and 0 or 7)

    local icon = Instance.new("Frame")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 11, 0, 11)
    icon.Position = UDim2.new(0.5, -5.5, 0.5, -5.5)
    icon.BackgroundTransparency = 1
    icon.BorderSizePixel = 0
    icon.Parent = btn
    drawFn(icon)

    local hoverIn = TweenService:Create(btn, TweenInfo.new(0.14), {
        BackgroundColor3 = isClose and THEME.closeHover or THEME.btnHover,
        BackgroundTransparency = 0,
    })
    local hoverOut = TweenService:Create(btn, TweenInfo.new(0.14), {
        BackgroundColor3 = isClose and THEME.closeIdle or THEME.btnIdle,
        BackgroundTransparency = 0.15,
    })
    local press = TweenService:Create(icon, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 9, 0, 9), Position = UDim2.new(0.5, -4.5, 0.5, -4.5),
    })
    local release = TweenService:Create(icon, TweenInfo.new(0.16, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 11, 0, 11), Position = UDim2.new(0.5, -5.5, 0.5, -5.5),
    })

    btn.MouseEnter:Connect(function() hoverIn:Play() end)
    btn.MouseLeave:Connect(function() hoverOut:Play() end)
    btn.MouseButton1Down:Connect(function() press:Play() end)
    btn.MouseButton1Up:Connect(function() release:Play() end)
    return btn
end

local MinBtn = iconButton("MinBtn", -64, false, function(icon)
    local line = Instance.new("Frame")
    line.Size = UDim2.new(0.9, 0, 0, 2)
    line.Position = UDim2.new(0.05, 0, 0.78, -1)
    line.BackgroundColor3 = THEME.text
    line.BorderSizePixel = 0
    line.Parent = icon
    Instance.new("UICorner", line).CornerRadius = UDim.new(1, 0)
end)

local CloseBtn = iconButton("CloseBtn", -34, true, function(icon)
    for _, rot in ipairs({45, -45}) do
        local l = Instance.new("Frame")
        l.Size = UDim2.new(1, 0, 0, 2)
        l.Position = UDim2.new(0, 0, 0.5, -1)
        l.Rotation = rot
        l.BackgroundColor3 = THEME.text
        l.BorderSizePixel = 0
        l.Parent = icon
        Instance.new("UICorner", l).CornerRadius = UDim.new(1, 0)
    end
end)

-- ============================================================
-- CONTENT
-- ============================================================
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -42)
Content.Position = UDim2.new(0, 0, 0, 42)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.Parent = Main

local SubRow = Instance.new("Frame")
SubRow.Size = UDim2.new(1, -20, 0, 16)
SubRow.Position = UDim2.new(0, 14, 0, 4)
SubRow.BackgroundTransparency = 1
SubRow.Parent = Content

local SubLbl = Instance.new("TextLabel")
SubLbl.Size = UDim2.new(0.55, 0, 1, 0)
SubLbl.BackgroundTransparency = 1
SubLbl.Text = "Ranked v2.0 • KILLER"
SubLbl.TextColor3 = THEME.killer
SubLbl.Font = Enum.Font.GothamBold
SubLbl.TextSize = 10
SubLbl.TextXAlignment = Enum.TextXAlignment.Left
SubLbl.Parent = SubRow

local ByLabel = Instance.new("TextLabel")
ByLabel.Size = UDim2.new(0.45, 0, 1, 0)
ByLabel.Position = UDim2.new(0.55, 0, 0, 0)
ByLabel.BackgroundTransparency = 1
ByLabel.Text = "By xFuxk"
ByLabel.TextColor3 = THEME.text
ByLabel.TextTransparency = 0.2
ByLabel.Font = Enum.Font.Gotham
ByLabel.TextSize = 10
ByLabel.TextXAlignment = Enum.TextXAlignment.Right
ByLabel.Parent = SubRow

local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1, -20, 1, -52)
Body.Position = UDim2.new(0, 10, 0, 26)
Body.BackgroundTransparency = 1
Body.BorderSizePixel = 0
Body.Parent = Content

local BodyList = Instance.new("UIListLayout")
BodyList.Padding = UDim.new(0, 6)
BodyList.SortOrder = Enum.SortOrder.LayoutOrder
BodyList.Parent = Body

local StatusLbl = Instance.new("TextLabel")
StatusLbl.Name = "Status"
StatusLbl.Size = UDim2.new(1, -20, 0, 14)
StatusLbl.Position = UDim2.new(0, 10, 1, -16)
StatusLbl.BackgroundTransparency = 1
StatusLbl.Text = "Ready"
StatusLbl.TextColor3 = THEME.textDim
StatusLbl.Font = Enum.Font.Gotham
StatusLbl.TextSize = 10
StatusLbl.TextXAlignment = Enum.TextXAlignment.Left
StatusLbl.Parent = Content

local function setStatus(text, color)
    pcall(function()
        StatusLbl.Text = text
        StatusLbl.TextColor3 = color or THEME.textDim
    end)
end

-- Custom controls
local function makeRow(title)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 30)
    row.BackgroundColor3 = THEME.rowBg
    row.BackgroundTransparency = 0.25
    row.BorderSizePixel = 0
    row.Parent = Body
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title
    lbl.TextColor3 = THEME.text
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row
    return row
end

local function makeToggle(title, default, onChanged, isKiller)
    local row = makeRow(title)

    local switch = Instance.new("TextButton")
    switch.Size = UDim2.new(0, 34, 0, 18)
    switch.Position = UDim2.new(1, -44, 0.5, -9)
    switch.BackgroundColor3 = THEME.switchOff
    switch.BorderSizePixel = 0
    switch.Text = ""
    switch.AutoButtonColor = false
    switch.Parent = row
    Instance.new("UICorner", switch).CornerRadius = UDim.new(0, 9)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = UDim2.new(0, 3, 0.5, -6)
    knob.BackgroundColor3 = THEME.white
    knob.BorderSizePixel = 0
    knob.Parent = switch
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local state = default

    local function apply(anim)
        local on = state
        local info = anim and TweenInfo.new(0.18, Enum.EasingStyle.Quad) or TweenInfo.new(0)
        local color = isKiller and (on and THEME.killer or THEME.switchOff) or (on and THEME.accent or THEME.switchOff)
        TweenService:Create(switch, info, {
            BackgroundColor3 = color
        }):Play()
        TweenService:Create(knob, info, {
            Position = on and UDim2.new(0, 19, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
        }):Play()
    end

    apply(false)

    switch.MouseButton1Click:Connect(function()
        state = not state
        apply(true)
        onChanged(state)
    end)

    return { Get = function() return state end }
end

local function makeDropdown(title, options, default, onChanged)
    local row = makeRow(title)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 84, 0, 20)
    btn.Position = UDim2.new(1, -94, 0.5, -10)
    btn.BackgroundColor3 = THEME.btnIdle
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = row
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local valLbl = Instance.new("TextLabel")
    valLbl.Size = UDim2.new(1, -22, 1, 0)
    valLbl.Position = UDim2.new(0, 8, 0, 0)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = default
    valLbl.TextColor3 = THEME.accent
    valLbl.Font = Enum.Font.GothamBold
    valLbl.TextSize = 11
    valLbl.TextXAlignment = Enum.TextXAlignment.Left
    valLbl.Parent = btn

    local chev = Instance.new("Frame")
    chev.Size = UDim2.new(0, 8, 0, 8)
    chev.Position = UDim2.new(1, -16, 0.5, -4)
    chev.BackgroundTransparency = 1
    chev.Parent = btn
    for i, rot in ipairs({45, -45}) do
        local l = Instance.new("Frame")
        l.Size = UDim2.new(0, 5, 0, 1.5)
        l.Position = i == 1 and UDim2.new(0, 0, 0, 3) or UDim2.new(0, 3.5, 0, 3)
        l.Rotation = rot
        l.BackgroundColor3 = THEME.textDim
        l.BorderSizePixel = 0
        l.Parent = chev
    end

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(0, 84, 0, #options * 22 + 6)
    panel.Position = UDim2.new(1, -94, 1, 2)
    panel.BackgroundColor3 = THEME.btnIdle
    panel.BorderSizePixel = 0
    panel.Visible = false
    panel.ZIndex = 6
    panel.Parent = row
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 6)

    local pList = Instance.new("UIListLayout")
    pList.Padding = UDim.new(0, 2)
    pList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    pList.Parent = panel

    for _, opt in ipairs(options) do
        local ob = Instance.new("TextButton")
        ob.Size = UDim2.new(1, -8, 0, 20)
        ob.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
        ob.BackgroundTransparency = 0.4
        ob.BorderSizePixel = 0
        ob.Text = opt
        ob.TextColor3 = THEME.text
        ob.Font = Enum.Font.Gotham
        ob.TextSize = 11
        ob.AutoButtonColor = false
        ob.Parent = panel
        Instance.new("UICorner", ob).CornerRadius = UDim.new(0, 5)

        ob.MouseButton1Click:Connect(function()
            valLbl.Text = opt
            panel.Visible = false
            onChanged(opt)
        end)
    end

    btn.MouseButton1Click:Connect(function()
        panel.Visible = not panel.Visible
    end)
end

-- Build controls
makeToggle("Auto Answer", State.autoAnswer, function(v)
    State.autoAnswer = v
    saveConfig()
    setStatus("Auto Answer " .. (v and "ON" or "OFF"), v and THEME.green or THEME.textDim)
end)

makeToggle("Auto Choose", State.autoChoose, function(v)
    State.autoChoose = v
    saveConfig()
end)

makeToggle("Killer Mode", State.killerMode, function(v)
    State.killerMode = v
    saveConfig()
    setStatus(v and "⚔ KILLER MODE ACTIVE" or "Safe Mode", v and THEME.killer or THEME.textDim)
end, true)

makeDropdown("Typing Speed", {"human", "fast"}, State.speed, function(v)
    State.speed = v
    saveConfig()
end)

-- Minimize/Close/Drag behavior
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    StatusLbl.Visible = not minimized
    TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = minimized and UDim2.new(0, 328, 0, 42) or UDim2.new(0, 328, 0, 233)
    }):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = Main.Position + UDim2.new(0, 164, 0, 116),
    }):Play()
    task.delay(0.22, function() ScreenGui:Destroy() end)
end)

local dragging, dragStart, startPos = false, nil, nil
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)
TopBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

-- Entrance animation
Main.Position = UDim2.new(0.02, 0, 0.07, 0)
Main.BackgroundTransparency = 1
MainStroke.Transparency = 1
TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.02, 0, 0.1, 0),
    BackgroundTransparency = 0.08,
}):Play()
TweenService:Create(MainStroke, TweenInfo.new(0.3), { Transparency = 0.45 }):Play()

-- ============================================================
-- DICTIONARY SYSTEM (Massive 2000+ words)
-- ============================================================
local CommonBuckets = {}
local FreqRank = {}

-- FALLBACK + words-simple.lua words
local FALLBACK = {"apple","about","arrow","bag","ball","bear","bird","boat","book","bread","cat","cake","car","chair","cheese","child","city","cloud","coin","corn","dog","door","dream","drum","dust","eagle","earth","eat","eight","end","easy","early","farm","fire","fish","flag","flower","forest","fox","frog","game","garden","gate","ghost","goat","gold","grape","grass","gym","gymnast","happy","hat","hill","home","horse","house","ice","igloo","ink","iron","island","jam","jelly","jewel","jungle","juice","kite","kiwi","king","kitchen","lamp","leaf","lemon","lion","lizard","lake","map","melon","milk","moon","mouse","music","nest","night","nose","note","ocean","olive","onion","orange","owl","panda","paper","pear","pen","piano","pig","pizza","plane","plum","pond","queen","quilt","quiz","rabbit","rain","river","road","rock","rose","salt","sand","seed","sheep","ship","shoe","snow","soap","sock","star","stone","sun","table","tiger","toast","tree","truck","turtle","umbrella","unicorn","unit","van","vase","violin","violet","wagon","water","whale","wheel","wind","window","wolf","wood","yarn","yellow","zebra","zoo"}

local function addCommon(w, rank)
    if #w < 3 or #w > 10 then return end
    if HARDCODED_BAD[w] then return end
    local c = w:sub(1,1)
    CommonBuckets[c] = CommonBuckets[c] or {}
    FreqRank[w] = rank
    table.insert(CommonBuckets[c], w)
end

-- Sync load fallback
local rank0 = 0
for _, w in ipairs(FALLBACK) do
    rank0 = rank0 + 1
    addCommon(w, rank0)
end

-- Async load massive dictionary
task.spawn(function()
    local ok, raw = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/Txzp/KrysHub-Zzz/refs/heads/main/words-simple.lua")
    end)
    
    if ok and raw and #raw > 5000 then
        local count = 0
        for line in raw:gmatch("[^\r\n]+") do
            local w = line:lower():gsub("[^a-z]", "")
            if w == line:lower() and #w >= 3 and #w <= 10 and not HARDCODED_BAD[w] then
                rank0 = rank0 + 1
                addCommon(w, rank0)
                count = count + 1
            end
        end
        for _, pool in pairs(CommonBuckets) do table.sort(pool) end
        setStatus("Loaded " .. count .. " words | Killer Ready", THEME.green)
    end
end)

for _, pool in pairs(CommonBuckets) do table.sort(pool) end

function getSpeed()
    return SPEEDS[State.speed] or SPEEDS.human
end

local function isValidWord(w)
    if State.used[w] or State.blacklist[w] or State.learnedInvalid[w] then return false end
    if HARDCODED_BAD[w] then return false end
    return true
end

local function lowerBound(pool, prefix)
    local lo, hi = 1, #pool + 1
    while lo < hi do
        local mid = math.floor((lo + hi) / 2)
        if pool[mid] < prefix then
            lo = mid + 1
        else
            hi = mid
        end
    end
    return lo
end

local function searchCommon(prefix, limit)
    local pool = CommonBuckets[prefix:sub(1,1)]
    if not pool or #pool == 0 then return {} end
    local plen = #prefix
    local idx = lowerBound(pool, prefix)
    local out = {}
    while idx <= #pool and #out < limit do
        local w = pool[idx]
        if w:sub(1, plen) ~= prefix then break end
        if #w > plen and isValidWord(w) then
            out[#out+1] = w
        end
        idx = idx + 1
    end
    return out
end

-- ============================================================
-- KILLER MODE: Pick words that end in hard letters
-- ============================================================
function pickWords(prefix, n, forOpponent)
    prefix = prefix:lower()
    if prefix == "" then return {} end
    local plen = #prefix

    -- Get all candidates
    local learned = {}
    for w in pairs(State.learnedValid) do
        if #w > plen and w:sub(1, plen) == prefix and isValidWord(w) then
            learned[#learned+1] = w
        end
    end
    
    local commonLimit = State.killerMode and 20 or 10
    local common = searchCommon(prefix, commonLimit)

    local cands, seen = {}, {}
    for _, w in ipairs(learned) do
        if not seen[w] then seen[w] = true cands[#cands+1] = w end
    end
    for _, w in ipairs(common) do
        if not seen[w] then seen[w] = true cands[#cands+1] = w end
    end
    
    if #cands == 0 then return {} end

    -- KILLER MODE: Sort by hard ending letters
    if State.killerMode and forOpponent then
        table.sort(cands, function(a, b)
            local lastA = a:sub(-1)
            local lastB = b:sub(-1)
            local scoreA = KILLER_SCORES[lastA] or 0
            local scoreB = KILLER_SCORES[lastB] or 0
            if scoreA ~= scoreB then return scoreA > scoreB end
            return (FreqRank[a] or 999999) < (FreqRank[b] or 999999)
        end)
    else
        -- Normal mode: most common first
        table.sort(cands, function(a, b)
            return (FreqRank[a] or 999999) < (FreqRank[b] or 999999)
        end)
    end

    local top = {}
    for i = 1, math.min(n, #cands) do top[i] = cands[i] end
    for i = #top, 2, -1 do
        local j = math.random(i)
        top[i], top[j] = top[j], top[i]
    end
    return top
end

local function letterScore(ch)
    local base = #searchCommon(ch:lower(), 15)
    local learned = 0
    for w in pairs(State.learnedValid) do
        if w:sub(1,1) == ch:lower() then learned = learned + 1 end
    end
    return base + learned
end

-- Typing functions
local function typeSuffix(suffix, token)
    local s = getSpeed()
    for i = 1, #suffix do
        if token ~= State.roundToken then return false end
        local upper = suffix:sub(i, i):upper()
        event.fire("keyStroke", upper)
        event.remoteFire("keyStroke", upper)
        local d = s.keyMin + math.random() * (s.keyMax - s.keyMin)
        if math.random() < s.pauseChance then
            d = d + s.pauseMin + math.random() * (s.pauseMax - s.pauseMin)
        end
        task.wait(d)
    end
    return token == State.roundToken
end

local function eraseSuffix(len)
    for _ = 1, len do
        event.remoteFire("keyStroke", -1)
        task.wait(0.03)
    end
end

local function answerWithRetry(prefix, token)
    local opts = pickWords(prefix, 4, false)  -- false = for me (safe mode)
    if #opts == 0 then
        setStatus("Skip: no safe word for '" .. prefix:upper() .. "'", THEME.orange)
        return
    end

    for i, word in ipairs(opts) do
        if token ~= State.roundToken then return end

        if i > 1 then
            eraseSuffix(#opts[i-1] - #prefix)
            task.wait(0.1)
        end

        setStatus((i > 1 and "retry → " or "→ ") .. word, THEME.accent)

        if not typeSuffix(word:sub(#prefix + 1), token) then return end
        task.wait(0.15)

        State.lastSubmitted = word
        State.lastSubmitTime = os.clock()
        event.remoteFire("tryAnswer")
        State.used[word] = true

        local t0 = os.clock()
        while os.clock() - t0 < 1.3
            and State.lastSubmitted ~= nil
            and token == State.roundToken do
            task.wait(0.1)
        end

        if State.lastSubmitted == nil then return end
    end
end

-- ============================================================
-- NETWORK HOOKS
-- ============================================================
event.remoteConnect("updateRound", function(rd, p2, turnPlayer)
    pcall(function()
        State.roundToken = State.roundToken + 1
        local token = State.roundToken

        local isMe
        if type(turnPlayer) == "string" then
            isMe = (turnPlayer == player.Name)
        elseif turnPlayer ~= nil then
            isMe = (turnPlayer == player)
        else
            isMe = (player:GetAttribute("IsTurn") == true)
        end

        if not isMe then return end

        local s = getSpeed()
        local think = State.retryPending
            and (0.15 + math.random() * 0.2)
            or (s.thinkMin + math.random() * (s.thinkMax - s.thinkMin))

        if rd.Choices then
            State.chain = 0
            if not State.autoChoose then return end
            
            -- KILLER MODE: Choose letter that gives opponent hard words
            task.delay(think, function()
                pcall(function()
                    if token ~= State.roundToken then return end
                    
                    local best, bestScore = nil, -1
                    for _, ch in ipairs(rd.Choices) do
                        local score = letterScore(ch:lower())
                        -- In killer mode, prefer letters with FEW words (trap opponent)
                        if State.killerMode then
                            score = -score  -- Invert: fewer words = better
                        end
                        if score > bestScore then best, bestScore = ch, score end
                    end
                    
                    if best then
                        event.remoteFire("chooseLetter", best:lower())
                        State.retryPending = false
                        setStatus(State.killerMode and "⚔ Trap letter: " .. best:upper() or "Letter: " .. best:upper(), 
                                  State.killerMode and THEME.killer or THEME.accent)
                    end
                end)
            end)
        else
            if not State.autoAnswer then return end
            task.delay(think, function()
                pcall(function()
                    if token ~= State.roundToken then return end
                    answerWithRetry(rd.RequiredLetter or "", token)
                end)
            end)
        end
    end)
end)

event.remoteConnect("correct", function(word)
    pcall(function()
        local w = cleanWord(word)
        if not w then return end
        State.used[w] = true

        local isMe = (State.lastSubmitted and w == State.lastSubmitted)
        if not State.learnedValid[w] then
            State.learnedValid[w] = true
            State.learnedInvalid[w] = nil
            dbDirty = true
        end
        if isMe then
            State.lastSubmitted = nil
            setStatus("✔ " .. w, THEME.green)
        end
        State.chain = State.chain + 1
    end)
end)

event.remoteConnect("takeDamage", function(target)
    pcall(function()
        local isUs = false
        if type(target) == "number" then
            isUs = (target == player.UserId)
        elseif type(target) == "userdata" then
            pcall(function() isUs = (target == player or target.UserId == player.UserId) end)
        else
            isUs = (State.lastSubmitted ~= nil and (os.clock() - State.lastSubmitTime) < 6)
        end
        if isUs and State.lastSubmitted then
            local w = State.lastSubmitted
            State.blacklist[w] = true
            local c = cleanWord(w)
            if c then
                State.learnedInvalid[c] = true
                State.learnedValid[c] = nil
                dbDirty = true
            end
            setStatus("✘ " .. w, THEME.red)
            State.lastSubmitted = nil
            State.retryPending = true
        end
    end)
end)

event.remoteConnect("endGame", function()
    pcall(function()
        State.chain = 0
        State.retryPending = false
        State.lastSubmitted = nil
        setStatus("Ready", THEME.textDim)
    end)
end)

-- ============================================================
-- STARTUP
-- ============================================================
pcall(function()
    if _makefolder and _isfolder and not _isfolder("workspace") then
        _makefolder("workspace")
    end
end)
saveConfig()

local vc = 0
for _ in pairs(State.learnedValid) do vc = vc + 1 end
setStatus("Ready | " .. vc .. " learned words | Killer Ready", THEME.textDim)

print("[xFuxk] Ranked v2.0 KILLER EDITION loaded")
