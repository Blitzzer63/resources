-- Scripted by Woopi/Lucas Miller

ESX          = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local havebike = false

local table = { -- Here you can add more markers | markers is not the same as blips, blips are below!
    {x = -246.980,y = -339.820,z = 29.000},
    {x = -6.986,y = -1081.704,z = 25.7},
}

local blips = {
-- Add your wanted blips to your wanted locations here! | Uses table to add more blips so it doesnt cause problems!

   {title="Bike rental", colour=2, id=376, x = -248.938, y = -339.955, z = 29.969},
   {title="Bike rental", colour=2, id=376, x = -6.892, y = -1081.734, z = 26.829},
}

--[[  IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ!
Do NOT change or modify the code below if you dont know what you are doing!
Do not complain in the forums if you do so, because i most likely will NOT help you!
]]

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 1.0)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(table) do
		
            DrawMarker(27, table[k].x, table[k].y, table[k].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.501, 0, 255, 255, 100, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	
        for k in pairs(table) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, table[k].x, table[k].y, table[k].z)
            if dist <= 1.40 then
				if havebike == false then
					AddTextEntry("FREE_BIKE", "Press ~r~~h~E~h~~w~ open menu.")
					DisplayHelpTextThisFrame("FREE_BIKE",false )
					if IsControlJustPressed(0,51) and IsPedOnFoot(PlayerPedId()) then
						Citizen.Wait(100)  
						OpenBikeMenu()
					end 
				elseif havebike == true then
					AddTextEntry("FREE_BIKE", "Press ~r~~h~E~h~~w~ store the bike back.")
					DisplayHelpTextThisFrame("FREE_BIKE",false )
					if IsControlJustPressed(0,51) then
						Citizen.Wait(100)  
						TriggerEvent('esx:deleteVehicle')
						TriggerEvent("chatMessage", "[Bikes]", {255,255,0}, "I hope you enjoyed our bike. Come again :)")
						havebike = false
					end 		
				end
			elseif dist < 13.80 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)


function OpenBikeMenu()
	
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'VehicleMenu',
	{
		title    = 'Bike Rental',
		align    = 'bottom-right',
		elements = {
			{label = 'Bike - <span style="color:green;">TriBike</span> <span style="color:red;">89$</span>', value = 'kolo'},
			{label = 'Bike - <span style="color:green;">Scorcher</span> <span style="color:red;">99$</span>', value = 'kolo2'},
			{label = 'Bike - <span style="color:green;">Cruiser</span> <span style="color:red;">129$</span>', value = 'kolo3'},
			
		},
	},
	
	function(data, menu)

	if data.current.value == 'kolo' then
		TriggerEvent('esx:spawnVehicle', "tribike2")
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	if data.current.value == 'kolo2' then
		TriggerEvent('esx:spawnVehicle', "scorcher")
		TriggerServerEvent("esx:lowmoney", 99)
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	
	if data.current.value == 'kolo3' then
		TriggerEvent('esx:spawnVehicle', "cruiser")
		TriggerServerEvent("esx:lowmoney", 129)
		ESX.UI.Menu.CloseAll()
		havebike = true	
	end
	

    end,
	function(data, menu)
		menu.close()
		end
	)
end

-- Do not change this!!
print("Bike script is now working! - Scripted by Woopi/Lucas Miller")