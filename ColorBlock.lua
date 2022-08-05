local button = script.Parent
local color = workspace.Part.Color

function onClick(obj)
	if color == Color3.new(0, 0, 0) then
		workspace.Part.Color = Color3.new(0.333333, 1, 0)
	else
		workspace.Part.Color = Color3.new(1, 0.333333, 0)
	end
end

button.TouchEnded:Connect(onClick)
