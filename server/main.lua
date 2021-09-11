-- Registering command to fix a vehicle
-- Old command. Keeping to demonstrate difference.
RegisterCommand('fv', function(source)
    
    TriggerClientEvent('vehicleRepair:fv', source)
    
end, false)

-- Register command for fix that forces event to all clients
-- Thought this command would work. When testing I realized that it instead fixes EVERY players vehicle.
RegisterCommand('globalfv', function(source)

    TriggerClientEvent('vehicleRepair:fv', -1)

end, false)

-- Register sfv reworked command
-- This method nearly works, however there is no simple way to get the player ped from the player id server-side.
-- The only way to get the individual vehicle sync'd is to use call the getvehiclepedisin native, but it requires the player ped object
RegisterCommand('sfv', function(source)

    TriggerEvent('vehiclerepair:sfv', source)

end, false)

-- Register the keigs-repair command
RegisterCommand('keigs-repair', function(source)
    TriggerClientEvent('vehicleRepair:keigs-repair', source)
end, false)

-- Rework of the previous fv command, but server-side.
RegisterServerEvent('vehiclerepair:sfv')
AddEventHandler('vehiclerepair:sfv', function(source)

    -- Debugging
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {'source', source}
    })

    -- source passed in is the id of player who ran command
    -- knowing this retrieve the ped using only the player's id
    -- the only way to do this is a client-side native


    -- Get vehicle player was last in
    local vehicle = GetVehiclePedIsIn(playerId, true)

    -- Debugging
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {'vehicle', vehicle}
    })


    -- Runs cfv event to fix & sync the vehicle client-side
    TriggerClientEvent('vehicleRepair:cfv', -1, vehicle)

    -- Fixes vehicle body on the server side
    SetVehicleBodyHealth(vehicle, 1000)

end)

-- Server event called upon by keigs-repair. Syncs a repair to all clients.
RegisterServerEvent('vehicleRepair:server:keigs-repair')
AddEventHandler('vehicleRepair:server:keigs-repair', function(playerPed)

    -- Gets vehicle object server side
    local veh = GetVehiclePedIsIn(playerPed, true)

    -- Debugging. Making sure event recieved vehicle
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {'server-veh', veh}
    })

    -- This event tells all clients to repair the target vehicle, thereby syncing the repair.
    TriggerClientEvent('vehicleRepair:cfv', -1, veh)

end)