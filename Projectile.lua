--Local Script
local Event = script:WaitForChild("RemoteEvent")
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(Key, IsTyping)
	if IsTyping then return end
	
	if Key.KeyCode == Enum.KeyCode.E then
		Event:FireServer()
	end
end)





--Script
local Event = script.Parent:WaitForChild("RemoteEvent")

Event.OnServerEvent:Connect(function(Player)
	local Char = Player.Character
	local HRP = Char.HumanoidRootPart
	
	local Part = Instance.new("Part")
	Part.Name = "FlyingBall"
	Part.Size = Vector3.new(2, 2, 2)
	Part.Shape = "Ball"
	Part.CFrame = HRP.CFrame * CFrame.new(0, 0, -3)
	Part.Parent = workspace
	
	local Attachment = Instance.new("Attachment")
	Attachment.Parent = Part
	
	local LV = Instance.new("LinearVelocity")
	LV.MaxForce = 99999999
	LV.Attachment0 = Attachment
	LV.VectorVelocity = HRP.CFrame.LookVector * 100
	LV.Parent = Attachment
	
	game.Debris:AddItem(Part, 1)
end)
