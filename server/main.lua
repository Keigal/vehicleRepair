-- Registering command to fix a vehicle
RegisterCommand(fixVehicle, function()
    
    TriggerClientEvent('vehicleRepair:fixVehicle', source)
    
end, false)