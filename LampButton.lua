local button = script.Parent

local active = true;

function onClick(obj)
	if active == true then
		if workspace.Lamp.PointLight.Enabled == true then
			workspace.Lamp.PointLight.Enabled = false;
			workspace.Lamp.Material = Enum.Material.Glass;
		else
			workspace.Lamp.PointLight.Enabled = true;
			workspace.Lamp.Material = Enum.Material.Neon;
		end
		active = false;
		wait(1.0);
		active = true;
	end
end
 
button.TouchEnded:Connect(onClick)
