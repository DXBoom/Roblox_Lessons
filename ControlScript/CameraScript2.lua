local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

player.CharacterAdded:Wait()
player.Character:WaitForChild("HumanoidRootPart")

camera.CameraSubject = player.Character.HumanoidRootPart
camera.CameraType = Enum.CameraType.Attach
camera.FieldOfView = 10

local RunService = game:GetService("RunService")


local function onUpdate()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		camera.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position) * CFrame.new(0, 10, 250)
	end
end

RunService:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, onUpdate)
