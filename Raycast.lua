local rayPart = script.Parent

local i = 0

local function castRay()
	local startPosition = rayPart.Position
	local rayDirection = Vector3.new(0, 0, 100)
	
	local rayCastResult = workspace:Raycast(startPosition, rayDirection)
	
	if rayCastResult then
		local partHit = rayCastResult.Instance
		print(partHit.name)
		if partHit == game.Workspace.BasePart then
			if i == 0 then
				print("We are here!")
				partHit.Color = Color3.new(0.333333, 0.333333, 1)
			else if i == 1 then
				print("We are here 2!")
				partHit.Color = Color3.new(1, 0.666667, 0.498039)
			else
				print("We are here 3!")
				partHit.Color = Color3.new(0.333333, 1, 0)
				end
			end
		end
	end
end

local function bullet()
	local part = Instance.new("Part")
	part.Name = "bullet"
	part.Anchored = false
	part.Shape = Enum.PartType.Ball
	part.Color = Color3.new(0.666667, 0, 0)
	part.Parent = workspace
	part.Size = Vector3.new(0.5, 0.5, 0.5)
	part.Position = workspace.Holder.Position
	part.CanCollide = false
	
	local Attachment = Instance.new("Attachment")
	Attachment.Parent = part
	
	local BV = Instance.new("LinearVelocity", part)
	BV.MaxForce = 99999
	BV.Attachment0 = Attachment
	BV.VectorVelocity = Vector3.new(0, 0, 50)
	BV.Parent = Attachment
end

while true do
	wait(4)
	castRay()
	bullet()
	i += 1
	wait(4)
end
