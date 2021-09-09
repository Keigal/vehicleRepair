
-- Registering the command /fixVehicle
RegisterNetEvent('repairtest:fixVehicle')
AddEventHandler('repairtest:fixVehicle', function()

    -- Selects playerPed that typed the command
    local playerPed = GetPlayerPed(-1)

    -- Gets the vehicle the player is currently in
    -- Change false to true if you want to enable repair for last vehicle player was in
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    -- Sets the vehicle's engine to full health
    SetVehicleEngineHealth(vehicle, 1000)

    -- Sets vehicle back to full health, however it will not fix a broken engine.
    SetVehicleFixed(vehicle)

    -- Sets the cosmetics of the vehicle to look repaired
    SetVehicleDeformationFixed(vehicle)
    Engine

end)