-- Register the keigs-repair command
RegisterCommand('keigs-repair', function(source)
    TriggerEvent('vehicleRepair:server:keigs-repair', source)
end, false)


-- Server event called upon by keigs-repair. Syncs a repair to all clients.
RegisterServerEvent('vehicleRepair:server:keigs-repair')
AddEventHandler('vehicleRepair:server:keigs-repair', function(source)

    local playerId = source

    -- Triggering fix event for all players, passes in the id of the player's vehicle to repair.
    TriggerClientEvent('vehicleRepair:client:keigs-repair', -1, playerId)

end)