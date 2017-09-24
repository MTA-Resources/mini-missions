function a(thePlayer)
	local x, y, z = getElementPosition(thePlayer)
	outputChatBox("X: " .. x .. " | Y: " .. y .. " | Z: " .. z)
end
addCommandHandler("pos", a)

-------------------------------------------
-- Marker which triggers the mini-mission.
-------------------------------------------
local missionMarker = createMarker(2579.61, -969.30, 80.5, "cylinder", 1, 0, 0, 255, 150, getRootElement())

-------------------------------------------
-- Positions of bodyguards on outside.
-------------------------------------------
local bodyguards = {
	{ 
		x = 2583, 
		y = -966, 
		z = 82, 
		rot = 90, 
		model = 110,
		animBlock = "ped", 
		animName = "WOMAN_walknorm" 
	},
	{ 
		x = 2580, 
		y = -971, 
		z = 82, 
		model = 109,
		animBlock = "ped", 
		animName = "WOMAN_walknorm" 
	},
	{ 
		x = 2581, 
		y = -969, 
		z = 82, 
		rot = 45,
		model = 108,
		animBlock = "ped", 
		animName = "WOMAN_walknorm" 
	},
}

for _, bg in ipairs(bodyguards) do
	local ped = createPed(bg.model, bg.x, bg.y, bg.z, (bg.rot or 0))
	setPedAnimation(ped, bg.animBlock, bg.animName)
end