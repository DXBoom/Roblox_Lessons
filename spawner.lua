local zombie = game:GetService("ServerStorage").Zombie
local spawner = script.Parent

wait(2)
while true do
	wait(3)
	local zom = zombie:Clone()
	local root = zom.HumanoidRootPart
	root.CFrame = CFrame.new(spawner.Position) + Vector3.new(0, 1, 0)
	zom.Parent = workspace
end
