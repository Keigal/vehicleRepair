
-- Creates thread that adds command to suggested commands
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/keigs-repair', 'Fixes a vehicle in both the eyes of the repairer and all other clients.')
end)

-- Server side event to repair a specific vehicle. Called upon by server:keigs-repair
RegisterNetEvent('vehicleRepair:client:keigs-repair')
AddEventHandler('vehicleRepair:client:keigs-repair', function(playerId)

    -- Get player object from player id
    local player = GetPlayerFromServerId(playerId)

    -- Get player ped from player object
    local playerPed = GetPlayerPed(player)

    -- Get vehicle - requires player ped
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    -- Repair vehicle
    
    -- Makes sure vehicle isn't on fire
    if IsEntityOnFire(vehicle)
    then
        local coords = GetEntityCoords(vehicle)
        StopFireInRange(coords, 20)
        StopEntityFire(vehicle)
    end

    -- Ensures vehicle is driveable
    SetVehicleUndriveable(vehicle, false)

    -- Sets the vehicle's engine to full health
    SetVehicleEngineHealth(vehicle, 1000)

    -- Sets vehicle back to full health, however it will not fix a broken engine.
    SetVehicleFixed(vehicle)

    -- Sets the cosmetics of the vehicle to look fixed
    SetVehicleDeformationFixed(vehicle)

end)