-- Registered this event client-side as the natives being used are all client side.

-- Creates thread that adds command to suggested commands
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/fv', 'Depreciated. Fully repairs a vehicle.')
    TriggerEvent('chat:addSuggestion', '/sfv', 'Depreciated. Server-sided command to fully repair vehicle.')
    TriggerEvent('chat:addSuggestion', 'globalfv', 'Runs fix vehicle event on ALL clients.')
    TriggerEvent('chat:addSuggestion', '/keigs-repair', 'Fixes a vehicle in both the eyes of the repairer and all other clients.')
end)

-- Creating event to fix a vehicle
RegisterNetEvent('vehicleRepair:fv')
AddEventHandler('vehicleRepair:fv', function()

    -- Selects playerPed that typed the command
    local playerPed = GetPlayerPed(-1)

    -- Gets the vehicle the player is currently in
    -- Change true to false if you want to disable repair for last vehicle player was in
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    -- Checks if vehicle is on fire, extinguishes if it is.
    if IsEntityOnFire(vehicle)
    then
        -- Event only needs vehicle coords if there is a fire
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

-- Slightly modified version of the fv event. The intent with this event is to take in a given vehicle and fix it.
RegisterNetEvent('vehicleRepair:cfv')
AddEventHandler('vehicleRepair:cfv', function(vehicle)

    -- Checks if vehicle is on fire, extinguishes if it is.
    if IsEntityOnFire(vehicle)
    then
        -- Event only needs vehicle coords if there is a fire
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

-- Server side event to repair a specific vehicle. Called upon by server:keigs-repair
RegisterNetEvent('vehicleRepair:client:keigs-repair')
AddEventHandler('vehicleRepair:client:keigs-repair', function(playerId)

    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'client-playerId', playerId}
    })

    -- Get player object from player id
    local player = GetPlayerFromServerId(playerId)

    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'client-player', player}
    })

    -- Get player ped from player object
    local playerPed = GetPlayerPed(player)

    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'client-playerPed', playerPed}
    })

    -- Get vehicle
    local vehicle = GetVehiclePedIsIn(playerPed, true)

    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {'client-vehicle', vehicle}
    })

    -- Repair vehicle
    -- Checks if vehicle is on fire, extinguishes if it is.
    if IsEntityOnFire(vehicle)
    then
        -- Event only needs vehicle coords if there is a fire
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