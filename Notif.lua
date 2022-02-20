-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainGui = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Header = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local HeaderText = Instance.new("TextLabel")
local Close = Instance.new("ImageButton")
local Notification = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainGui.Name = "MainGui"
MainGui.Parent = ScreenGui
MainGui.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
MainGui.Position = UDim2.new(0.274594605, 0, 0.218678817, 0)
MainGui.Size = UDim2.new(0, 0, 0, 0)

UICorner.Parent = MainGui

Header.Name = "Header"
Header.Parent = MainGui
Header.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
Header.Size = UDim2.new(0, 0, 0, 0)

UICorner_2.Parent = Header

HeaderText.Name = "HeaderText"
HeaderText.Parent = Header
HeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeaderText.BackgroundTransparency = 1.000
HeaderText.Size = UDim2.new(0, 417, 0, 33)
HeaderText.Font = Enum.Font.Code
HeaderText.Text = "Message1"
HeaderText.TextColor3 = Color3.fromRGB(255, 255, 255)
HeaderText.TextSize = 18.000

Close.Name = "Close"
Close.Parent = Header
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.919664264, 0, 0.106060594, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.ZIndex = 2
Close.Image = "rbxassetid://3926305904"
Close.ImageRectOffset = Vector2.new(284, 4)
Close.ImageRectSize = Vector2.new(24, 24)

Notification.Name = "Notification"
Notification.Parent = MainGui
Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notification.BackgroundTransparency = 1.000
Notification.Size = UDim2.new(0, 417, 0, 247)
Notification.Font = Enum.Font.RobotoMono
Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
Notification.TextSize = 22.000

local Notif = _G.Message
local Warn  = _G.Header
Notification.Visible = false
HeaderText.Visible = false
MainGui:TweenSize(
	UDim2.new(0, 417, 0, 247),  -- endSize (required)
	--Enum.EasingDirection.In,    -- easingDirection (default Out)
	--Enum.EasingStyle.Sine,      -- easingStyle (default Quad)
	1.3                           -- time (default: 1)
)
Header:TweenSize(
	UDim2.new(0, 417, 0, 33),  -- endSize (required)
	--Enum.EasingDirection.In,    -- easingDirection (default Out)
	--Enum.EasingStyle.Sine,      -- easingStyle (default Quad)
	1.3                           -- time (default: 1)
)
wait(1.3)
Notification.Visible = true
HeaderText.Visible = true


Notification.Text = Notif
HeaderText.Text = Warn

Close.MouseButton1Click:Connect(function()
	Notification.Visible = false
	HeaderText.Visible = false
	Close.Visible = false
	MainGui:TweenSize(
		UDim2.new(0, 0, 0, 0),  -- endSize (required)
		--Enum.EasingDirection.In,    -- easingDirection (default Out)
		--Enum.EasingStyle.Sine,      -- easingStyle (default Quad)
		1.3                           -- time (default: 1)
	)
	Header:TweenSize(
		UDim2.new(0, 0, 0, 0),  -- endSize (required)
		--Enum.EasingDirection.In,    -- easingDirection (default Out)
		--Enum.EasingStyle.Sine,      -- easingStyle (default Quad)
		1.3                           -- time (default: 1)
	)
	wait(1.3)
	ScreenGui:Destroy()
end)
