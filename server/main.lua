-- Registering command to fix a vehicle
RegisterCommand('fv', function(source)
    
    TriggerClientEvent('vehicleRepair:fv', source)
    
end, false)

-- Register command for fix that forces event to all clients
-- This command SHOULD be fully functioning as requested.
-- Not sure if this the most optimized way to fix problem.
RegisterCommand('globalfv', function(source)

    TriggerClientEvent('vehicleRepair:fv', -1)

end, false)

-- Register sfv reworked command
RegisterCommand('sfv', function(source)

    TriggerEvent('vehiclerepair:sfv')

end, false)

-- Rework of the previous fv command, but server-side.
RegisterNetEvent('vehiclerepair:sfv')
AddEventHandler('vehiclerepair:sfv', function()

    -- Get player who ran command
    local playerPed = GetPlayerPed(-1)

    -- Get vehicle player was last in
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    -- Runs previous fv event to fix the vehicle client-side
    TriggerClientEvent('vehicleRepair:fv', source)

    -- Fixes vehicle body on the server side
    SetVehicleBodyHealth(vehicle, 1000)

end)