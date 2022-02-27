
RegisterServerEvent('licenses:display')
AddEventHandler('licenses:display', function(receiver, data)
	TriggerClientEvent('licenses:displayOnClient', receiver, data)
end)
