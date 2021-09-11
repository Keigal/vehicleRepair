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
RegisterCommand('sfv', function(source)

    TriggerEvent('vehiclerepair:sfv', source)

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

    -- Get player who ran command
    -- Returns Entity of the player ped
    local playerPed = GetPlayerPed(source)

    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {'playerPed', playerPed}
    })

    -- Converts entity to player id
    local playerId = NetworkGetEntityOwner(playerPed)

    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 0, 0},
        multiline = true,
        args = {'playerId', playerId}
    })


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