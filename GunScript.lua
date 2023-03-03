-- Parts
local weapon = script.Parent
local camera = workspace.CurrentCamera

-- Sound Effects
local shootSFX = weapon.Handle["FireSound"]
local reloadSFX = weapon.Handle["Reload"]

-- Replicated Storage
local replicatedStorage = game:GetService("ReplicatedStorage")
local damagePlayerEvent = replicatedStorage:WaitForChild("DamagePlayer")

-- Damage
local Damage = 25

-- Ammo
local CurMagAmmo = 12
local MagSize = 12
local ReserveAmmo = 48

local CanShoot = true

local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local AmmoText = nil

function UpdateAmmoText ()

	if AmmoText ~= nil then
		AmmoText.Text = CurMagAmmo .. "/" .. ReserveAmmo
	end

end

function Shoot (mouse)

	-- play shoot sfx
	shootSFX:Play()

	local target = mouse.Target
	local humanoid = nil

	CurMagAmmo -= 1

	-- get the target HUMANOID
	if target.Parent:FindFirstChild("Humanoid") then
		humanoid = target.Parent:FindFirstChild("Humanoid")
	elseif target.Parent.Parent:FindFirstChild("Humanoid") then
		humanoid = target.Parent.Parent:FindFirstChild("Humanoid")
	end

	-- if we hit a player, damage them
	if humanoid then
		local hitPlayer = game.Players:GetPlayerFromCharacter(humanoid.Parent)
		damagePlayerEvent:FireServer(hitPlayer, Damage)
	end

	UpdateAmmoText()

end

function Reload ()

	CanShoot = false

	reloadSFX:Play()
	wait(reloadSFX.TimeLength)

	CanShoot = true

	local leftOverAmmo = CurMagAmmo

	if ReserveAmmo < MagSize then
		CurMagAmmo = ReserveAmmo 
	else
		CurMagAmmo = MagSize
	end

	ReserveAmmo -= MagSize - leftOverAmmo

	if ReserveAmmo < 0 then
		ReserveAmmo = 0
	end

	UpdateAmmoText()

end

weapon.Equipped:Connect(function (mouse)

	local guiClone = game.ReplicatedStorage.AmmoGui:Clone()
	guiClone.Parent = PlayerGui
	AmmoText = guiClone.AmmoText

	UpdateAmmoText()

	mouse.Button1Down:Connect(function()

		if CanShoot == true then
			if CurMagAmmo > 0 then
				Shoot(mouse)
			elseif ReserveAmmo > 0 then
				Reload()
			end
		end		
	end)
end)

weapon.Unequipped:Connect(function()

	PlayerGui.AmmoGUI:Destroy()

end)
