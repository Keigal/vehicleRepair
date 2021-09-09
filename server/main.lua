-- Registering command to fix a vehicle
RegisterCommand('fv', function(source)
    
    TriggerClientEvent('vehicleRepair:fv', source)
    
end, false)