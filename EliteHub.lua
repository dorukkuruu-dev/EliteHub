-- // Grow A Garden 2 | HUB - Key System
-- // Made by ___

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

------------------------------------------------
-- CONFIG (edit these anytime)
------------------------------------------------
local KEY_LINK = "[PASTE YOUR KEY LINK HERE]"      -- link users copy to get a key
local VALID_KEYS = {                               -- add/remove valid keys here
    ["EXAMPLEKEY123"] = true,
    ["TESTKEY456"] = true,
}
local HUB_NAME = "Grow A Garden 2 | HUB"
local CREATOR = "Made by ___"

------------------------------------------------
-- CLEAN UP OLD GUI (avoid duplicates on re-run)
------------------------------------------------
if LocalPlayer.PlayerGui:FindFirstChild("GAG2_KeySystem") then
    LocalPlayer.PlayerGui.GAG2_KeySystem:Destroy()
end

------------------------------------------------
-- GUI BUILD
------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GAG2_KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 380, 0, 220)
Main.Position = UDim2.new(0.5, -190, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 200, 100)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame") -- covers bottom corners so it looks square there
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -20, 0, 25)
TitleText.Position = UDim2.new(0, 10, 0, 5)
TitleText.BackgroundTransparency = 1
TitleText.Text = HUB_NAME
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(60, 220, 110)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

local CreatorText = Instance.new("TextLabel")
CreatorText.Size = UDim2.new(1, -20, 0, 16)
CreatorText.Position = UDim2.new(0, 10, 0, 28)
CreatorText.BackgroundTransparency = 1
CreatorText.Text = CREATOR
CreatorText.Font = Enum.Font.Gotham
CreatorText.TextSize = 12
CreatorText.TextColor3 = Color3.fromRGB(150, 150, 150)
CreatorText.TextXAlignment = Enum.TextXAlignment.Left
CreatorText.Parent = TitleBar

-- Key input box
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.Position = UDim2.new(0, 20, 0, 70)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyBox.PlaceholderText = "Enter your key here..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

-- Status label
local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -40, 0, 20)
StatusText.Position = UDim2.new(0, 20, 0, 115)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Waiting for key..."
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 13
StatusText.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = Main

-- Check Key button (left)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.46, 0, 0, 42)
CheckBtn.Position = UDim2.new(0, 20, 1, -60)
CheckBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 90)
CheckBtn.Text = "Check Key"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 15
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.AutoButtonColor = false
CheckBtn.Parent = Main

local CheckBtnCorner = Instance.new("UICorner")
CheckBtnCorner.CornerRadius = UDim.new(0, 8)
CheckBtnCorner.Parent = CheckBtn

-- Copy Link button (right)
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.46, 0, 0, 42)
CopyBtn.Position = UDim2.new(0.54, 0, 1, -60)
CopyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CopyBtn.Text = "Copy Link"
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 15
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.AutoButtonColor = false
CopyBtn.Parent = Main

local CopyBtnCorner = Instance.new("UICorner")
CopyBtnCorner.CornerRadius = UDim.new(0, 8)
CopyBtnCorner.Parent = CopyBtn

local CopyBtnStroke = Instance.new("UIStroke")
CopyBtnStroke.Color = Color3.fromRGB(60, 200, 100)
CopyBtnStroke.Thickness = 1.2
CopyBtnStroke.Parent = CopyBtn

------------------------------------------------
-- BUTTON LOGIC
------------------------------------------------

-- Hover effects
local function hover(btn, colorIn, colorOut)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = colorIn}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = colorOut}):Play()
    end)
end
hover(CheckBtn, Color3.fromRGB(55, 200, 105), Color3.fromRGB(45, 180, 90))
hover(CopyBtn, Color3.fromRGB(60, 60, 60), Color3.fromRGB(45, 45, 45))

-- Copy link button
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        StatusText.Text = "Link copied to clipboard!"
        StatusText.TextColor3 = Color3.fromRGB(80, 190, 255)
    else
        StatusText.Text = "Clipboard not supported on this executor."
        StatusText.TextColor3 = Color3.fromRGB(255, 90, 90)
    end
end)

-- Check key button
CheckBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    if enteredKey == "" then
        StatusText.Text = "Please enter a key first."
        StatusText.TextColor3 = Color3.fromRGB(255, 90, 90)
        return
    end

    if VALID_KEYS[enteredKey] then
        StatusText.Text = "Key valid! Loading HUB..."
        StatusText.TextColor3 = Color3.fromRGB(80, 255, 120)

        task.wait(1)
        Main:Destroy() -- close key GUI

        -- ==== put your loadstring / main script call here ====
        -- loadstring(game:HttpGet("[YOUR MAIN SCRIPT LINK HERE]"))()

    else
        StatusText.Text = "Invalid key. Try again."
        StatusText.TextColor3 = Color3.fromRGB(255, 90, 90)
        KeyBox.Text = ""
    end
end)

------------------------------------------------
-- DRAGGABLE WINDOW
------------------------------------------------
local dragging, dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)