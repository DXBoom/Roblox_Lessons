local button = script.Parent

local active = false;
function onClick(obj)
	if active == false then
		if workspace.Text.SurfaceGui.TextLabel.Text == "Text" then
			workspace.Text.SurfaceGui.TextLabel.Text = "1"
		elseif workspace.Text.SurfaceGui.TextLabel.Text == "1" then
			workspace.Text.SurfaceGui.TextLabel.Text = "2"
		elseif workspace.Text.SurfaceGui.TextLabel.Text == "2" then
			workspace.Text.SurfaceGui.TextLabel.Text = "3"
		else
			workspace.Text.SurfaceGui.TextLabel.Text = "End of range!"
		end
		active = true;
		wait(1.0);
		active = false;
	end
end
 
button.Touched:Connect(onClick)
