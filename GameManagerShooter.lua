local LobbyWaitTime = 30
local KillsToWin = game.ReplicatedStorage.KillsToWin
local GameActive = game.ReplicatedStorage.GameActive
local CurrentTime
local GameStatus = game.ReplicatedStorage.GameStatus
local LobbySpawn = workspace.Warehouse.SpawnLocation
local Players = game.Players
local LobbyTeam = game.Teams.Lobby
local PlayingTeam = game.Teams.Playing

local function LobbyTimer ()
	CurrentTime = LobbyWaitTime
	while GameActive.Value == false do
		CurrentTime -= 1
		GameStatus.Value = "Game starting in... " .. CurrentTime  

		if CurrentTime <= 0 then
			GameActive.Value = true
		end
		wait(1)
	end
end

GameActive.Changed:Connect(function(value)

	if value == true then
		for i, player in pairs(Players:GetChildren()) do
			player.Team = PlayingTeam
			player:LoadCharacter()
		end

		GameStatus.Value = "First to ".. KillsToWin.Value .. " kills wins!"

	elseif value == false then    
		for i, player in pairs(Players:GetChildren()) do
			player.Team = LobbyTeam
			player:LoadCharacter()
		end

	end  
end)

LobbyTimer()
