-- driveby --

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
	PlayerData.job2 = job
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
            if PlayerData.job2 ~= nil and PlayerData.job2.name == 'org1' or PlayerData.job2 ~= nil and PlayerData.job2.name == 'org2' then		
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)