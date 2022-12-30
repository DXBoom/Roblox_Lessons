Amount = 1
function onTouched(part)
	local h = part.Parent:findFirstChild("Humanoid")
	if (h~=nil) then
		local thisplr = game.Players:FindFirstChild(h.Parent.Name)
		if (thisplr~=nil) then
			local stats = thisplr:findFirstChild("leaderstats")
			if (stats~=nil) then
				local Score = stats:findFirstChild("Coins")
				if (Score~=nil) then
					Score.Value = Score.Value + Amount
				end
			end
		end
		script.Parent.Transparency = 1
		script.Disabled = true
		script.Parent.Decal1:Destroy()
		script.Parent.Decal2:Destroy()
	end
end

script.Parent.Touched:Connect(onTouched)
