local active = true

RegisterNetEvent('licenses:displayOnClient')
AddEventHandler('licenses:displayOnClient', function(data)
	active = true
	local helpText = "licenses_"..data.Format.."_helptext"

	SendNUIMessage({
		type = 'licenses:MSG',
		active = active,
		data = data,
		format = data.Format
	});

	Citizen.CreateThread(function()
		while active do
			if IsControlJustReleased(0, 194) then
				active = false
				SendNUIMessage({
					type = 'licenses:MSG',
					active = active
				});
			else
				DisplayHelpTextThisFrame(helpText, false)
			end
			Citizen.Wait(0)
		end
	end)
end)

local function GetPlayers()
	local players = {}
	for _, id in ipairs(GetActivePlayers()) do
		if  ((NetworkIsPlayerActive(id)) and GetPlayerPed(id) ~= GetPlayerPed(-1)) then
			table.insert(players, id)
		end
	end
	return players
end

local function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for k, v in ipairs(players) do
		local target = GetPlayerPed(v)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(v), 0)
			local distance = #(targetCoords - plyCoords)
			if (closestDistance == -1 or closestDistance > distance) then
				if distance ~= 0.0 then
					closestPlayer = v
					closestDistance = distance
				end
			end
		end
	end
	return closestPlayer, closestDistance
end

local function LoadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

local function ShowToClosest(data)
	local targetPlayer, dist = GetClosestPlayer()
	if targetPlayer ~= -1 and dist < 2.0 then
		TriggerServerEvent('licenses:display', GetPlayerServerId(targetPlayer), data)
		LoadAnimDict(Config.Animation.dict)
		TaskPlayAnim(PlayerPedId(), Config.Animation.dict, Config.Animation.anim, 8.0, 8.0, 1500, 50, 0, false, false, false)
		RemoveAnimDict(Config.Animation.dict)
		exports.mythic_notify:SendAlert('success', Config.Localization['success_'..data.Format], 2500)
	else
		exports.mythic_notify:SendAlert('error', Config.Localization['fail_'..data.Format], 2500)
		return
	end
end

local function ShowToSelf(data)
	TriggerEvent('licenses:displayOnClient', data)
end

Citizen.CreateThread(function()
	AddTextEntry("licenses_id_helptext", Config.Localization['hide_id'])
	AddTextEntry("licenses_driver_license_helptext", Config.Localization['hide_driver_license'])

	exports('ShowToClosest', ShowToClosest)
	exports('ShowToSelf', ShowToSelf)
end)
