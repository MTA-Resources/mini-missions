function a()
	local x, y, z = getElementPosition(getLocalPlayer())
	outputChatBox("X: " .. x .. " | Y: " .. y .. " | Z: " .. z)
end
addCommandHandler("pos", a)

addCommandHandler("debug", function()
	outputChatBox("[MINI-MISSIONS] Activating debug mode")
	setDebugViewActive(true)
end)

-------------------------------------------
-- Marker which triggers the mini-mission.
-------------------------------------------
local g_MarkerMetadata = {
	x = 2579.61,
	y = -969.30,
	z = 80.5,
	type = "cylinder",
	size = 1,
	r = 255,
	g = 0,
	b = 0,
	a = 155
}

-------------------------------------------
-- Positions of bodyguards on outside.
-------------------------------------------
local g_BodyguardsMetadata = {
	{
		model = 110,
		position = {
			x = 2578.43, 
			y = -968.87, 
			z = 82, 
		},
		animation = {
			block = "beach", 
			name = "parksit_m_loop" 
		},
		weapon = {
			id = 22
		}
	},
	{ 
		model = 109,
		position = {
			x = 2580, 
			y = -971, 
			z = 82, 
		},
		animation = {
			block = "dealer", 
			name = "dealer_idle" 
		},
		weapon = {
			id = 28
		}
	},
	{ 
		model = 108,
		position = {
			x = 2581, 
			y = -969, 
			z = 82, 
			rot = 45,
		},
		animation = {
			block = "dealer", 
			name = "dealer_idle_01" 
		},
		weapon = {
			id = 4
		}
	}
}

function createBodyguards()
	for _, bg in ipairs(g_BodyguardsMetadata) do
		local bodyguard = createPed(bg.model, bg.position.x, bg.position.y, bg.position.z, (bg.position.rot or 0))
		
		if bg.animation then
			bodyguard:setAnimation(bg.animation.block, bg.animation.name, -1, true, false)
		end
		
		if bg.weapon then
			bodyguard:giveWeapon(bg.weapon.id, 1, true)
		end
	
		addEventHandler("onClientPedDamage", bodyguard, function()
			cancelEvent()
		end)
	end
end

function createMissionMarker()
	local data = g_MarkerMetadata
	createMarker(data.x, data.y, data.z, data.type, data.size, data.r, data.g, data.b, data.a)
end

(function()
	outputChatBox('[MINI-MISSIONS] Creating drug dealers')
	createBodyguards()
	createMissionMarker()
end)()