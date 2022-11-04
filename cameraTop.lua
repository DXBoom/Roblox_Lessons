local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local plr = game.Players.LocalPlayer
local char = game.Workspace:WaitForChild(plr.Name)

local Cam = game.Workspace.CurrentCamera
Cam.CameraType = "Scriptable"
Cam.CFrame = game.Workspace.CamPlace.CFrame

local W,A,S,D,NotMoving = false, false, false, false, true

local function KeepMoving()
	repeat
		if W then
			Cam.CFrame = Cam.CFrame + (Cam.CFrame.UpVector * 0.4)
		end	
		if S then
			Cam.CFrame = Cam.CFrame + (Cam.CFrame.UpVector * -0.4)
		end	
		if A then
			Cam.CFrame = Cam.CFrame + (Cam.CFrame.RightVector * -0.4)
		end	
		if D then
			Cam.CFrame = Cam.CFrame + (Cam.CFrame.RightVector * 0.4)
		end	

		RunService.RenderStepped:Wait()
	until NotMoving
end

local function MoveBegan(actionName, inputState, input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			W = true
			NotMoving = false
		end
		
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			A = true
			NotMoving = false
		end
		
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			S = true
			NotMoving = false
		end
		
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			D = true
			NotMoving = false
		end
		
		if W and not S and not D and not A then
			KeepMoving()
		elseif not W and S and not D and not A then
			KeepMoving()
		elseif not W and not S and D and not A then
			KeepMoving()
		elseif not W and not S and not D and A then
			KeepMoving()
		end
	end
end

local function MoveEnded(input, gpe)
	if input.KeyCode == Enum.KeyCode.W then
		W = false
	elseif input.KeyCode == Enum.KeyCode.S then
		S = false
	elseif input.KeyCode == Enum.KeyCode.D then
		D = false
	elseif input.KeyCode == Enum.KeyCode.A then
		A = false
	end
	
	if not W and not S and not D and not A then
		NotMoving = true
	else
		NotMoving = false
	end
end

game:GetService("ContextActionService"):BindAction("MoveCam",MoveBegan, false, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D)
UserInputService.InputEnded:Connect(MoveEnded)
