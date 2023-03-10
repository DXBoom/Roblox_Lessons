local GameManager = game.ServerScriptService.GameManager
local KillsToWin = game.ReplicatedStorage.KillsToWin
local WinGameEvent = game.ReplicatedStorage.WinGame

game.Players.PlayerAdded:Connect(function(player)
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local kills = Instance.new("IntValue")
	kills.Name = "Kills"
	kills.Value = 0
	kills.Parent = leaderstats

	local deaths = Instance.new("IntValue")
	deaths.Name = "Deaths"
	deaths.Value = 0
	deaths.Parent = leaderstats

	local wins = Instance.new("IntValue")
	wins.Name = "Wins"
	wins.Value = 0
	wins.Parent = leaderstats

	local attacker = Instance.new("ObjectValue")
	attacker.Name = "Attacker"
	attacker.Value = nil
	attacker.Parent = player

	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			player.leaderstats.Deaths.Value += 1

			if player.Attacker.Value then
				local killer = player.Attacker.Value
				killer.leaderstats.Kills.Value += 1

				if killer.leaderstats.Kills.Value == KillsToWin.Value then
					WinGameEvent:Fire(player.Attacker.Value)
				end
			end			
		end)
	end)
end)
