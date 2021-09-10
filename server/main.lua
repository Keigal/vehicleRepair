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

    TriggerEvent('vehiclerepair:sfv')

end, false)

-- Rework of the previous fv command, but server-side.
RegisterServerEvent('vehiclerepair:sfv')
AddEventHandler('vehiclerepair:sfv', function()

    -- Get player who ran command
    local playerPed = GetPlayerPed(-1)

    -- Get vehicle player was last in
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    -- Runs cfv event to fix & sync the vehicle client-side
    TriggerClientEvent('vehicleRepair:cfv', -1, vehicle)

    -- Fixes vehicle body on the server side
    SetVehicleBodyHealth(vehicle, 1000)

end)