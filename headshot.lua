local Headshot = headshot(game.Players.LocalPlayer.UserId) -- define var

local screenGui = Instance.new("ScreenGui") -- make gui
local image = Instance.new("ImageLabel") -- make gui v2

screenGui.Name = math.random(999,9999) -- 100000000000% undetected!!!1111! /kz
screenGui.Parent = game.Players.LocalPlayer.PlayerGui -- parent gui

image.Parent = screenGui -- parent img
image.AnchorPoint = Vector2.new(0.5,0.5) -- anchor img
image.Position = UDim2.new(0.5,0,0.5,0) -- position it
image.Image = Headshot -- image.Image = Headshot
image.Size = UDim2.new(0,420,0,420) -- 420 hahahahhahahahahah
