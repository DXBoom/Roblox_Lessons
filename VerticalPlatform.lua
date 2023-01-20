local script = script.Parent
local part = workspace.LevelDesign.VerticalPlatform
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local tweenInfo = TweenInfo.new(math.random(1,15), Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	-1,
	true,
	0)

local tween = TweenService:Create(script, tweenInfo, {Position = script.Position + Vector3.new(-50, 0, 0)})
tween:Play()

local lastPosition = part.Position

RunService.Stepped:Connect(function(_, deltaTime)
	local currentPosition = part.Position
	local deltaPosition = currentPosition - lastPosition
	
	local velocity = deltaPosition / deltaTime
	
	part.AssemblyLinearVelocity = velocity
	lastPosition = currentPosition
end)
