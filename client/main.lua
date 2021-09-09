-- Registered this event client-side as the natives being used are all client side.

-- Creates thread that adds command to suggested commands
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/fv', 'Fully repairs a vehicle.')
end)

-- Creating event to fix a vehicle
RegisterNetEvent('vehicleRepair:fv')
AddEventHandler('vehicleRepair:fv', function()

    -- Selects playerPed that typed the command
    local playerPed = GetPlayerPed(-1)

    -- Gets the vehicle the player is currently in
    -- Change true to false if you want to disable repair for last vehicle player was in
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    -- Ensures vehicle is driveable
    SetVehicleUndriveable(vehicle, false)

    -- Sets the vehicle's engine to full health
    SetVehicleEngineHealth(vehicle, 1000)

    -- Sets vehicle back to full health, however it will not fix a broken engine.
    SetVehicleFixed(vehicle)

    -- Sets the cosmetics of the vehicle to look fixed
    SetVehicleDeformationFixed(vehicle)

    -- Tells player the vehicle has been fixed
    notification("Vehicle fixed!")


end)