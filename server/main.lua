-- Creates thread that adds command to suggested commands
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/fixVehicle', 'Fully repairs a vehicle.')
end)

-- Registering command to fix a vehicle
RegisterCommand(fixVehicle, function()
    
    TriggerClientEvent('vehicleRepair:fixVehicle', source)
    
end, false)