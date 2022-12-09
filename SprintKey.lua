local userIput = game:GetService('UserInputService')
local Players = game:GetService('Players')

local sprintSpeed = 25
local walkSpeed = 16

local player = Players.LocalPlayer

local function beginSprint(input, gameProcesse)
	if not gameProcesse then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keycode = input.KeyCode
			if keycode == Enum.KeyCode.LeftShift then
				player.Character.Humanoid.WalkSpeed = sprintSpeed
			end
		end
	end
end

local function endSprint(input, gameProcesse)
	if not gameProcesse then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keycode = input.KeyCode
			if keycode == Enum.KeyCode.LeftShift then
				player.Character.Humanoid.WalkSpeed = walkSpeed
			end
		end
	end
end

userIput.InputBegan:Connect(beginSprint)
userIput.InputEnded:Connect(endSprint)
