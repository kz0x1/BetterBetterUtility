local notif = Instance.new("ScreenGui")
local Frame2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")
local UISizeConstraint = Instance.new("UISizeConstraint")

notif.Name = math.random(100,100000) --"notif"
notif.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame2.Name = math.random(100,100000) --"Frame2"
Frame2.Parent = notif
Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame2.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
Frame2.BackgroundTransparency = 0.5
Frame2.BorderColor3 = Color3.new(0, 0, 0)
Frame2.BorderSizePixel = 0
Frame2.Position = UDim2.new(0.5, 0, 0.150000006, 0)
Frame2.Size = UDim2.new(0.300000012, 0, 0.185211286, 0)

UICorner.Parent = Frame2

Frame.Parent = Frame2
Frame.BackgroundColor3 = Color3.new(0.513726, 0.513726, 0.513726)
Frame.BackgroundTransparency = 0.5
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.200000003, 0)
Frame.Size = UDim2.new(1, 0, 0, 1)

TextLabel.Parent = Frame2
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(8.70190391e-08, 0, 9.78964181e-08, 0)
TextLabel.Size = UDim2.new(0, 350, 0, 24)
TextLabel.Font = Enum.Font.BuilderSans
TextLabel.Text = "Notification"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true

TextLabel2.Name = math.random(100,100000) --"TextLabel2"
TextLabel2.Parent = Frame2
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.BorderColor3 = Color3.new(0, 0, 0)
TextLabel2.BorderSizePixel = 0
TextLabel2.Position = UDim2.new(8.70190391e-08, 0, 0.24522391, 0)
TextLabel2.Size = UDim2.new(0, 350, 0, 74)
TextLabel2.Font = Enum.Font.BuilderSans
TextLabel2.Text = "No notification?"
TextLabel2.TextColor3 = Color3.new(1, 1, 1)
TextLabel2.TextSize = 14
TextLabel2.TextWrapped = true

UISizeConstraint.Parent = Frame2
UISizeConstraint.MaxSize = Vector2.new(350, 116)
UISizeConstraint.MinSize = Vector2.new(350, 116)
