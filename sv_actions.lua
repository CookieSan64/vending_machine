ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('curse:SetBuy')
AddEventHandler('curse:SetBuy', function(itemName, price)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem(itemName, 1) then
		if xPlayer.getMoney() > price then
			xPlayer.addInventoryItem(itemName,1)
			xPlayer.removeMoney(price)
			xPlayer.showNotification('Vous avez payé ' .. price)
		else
			xPlayer.showNotification('Vous n\'avez pas assez d\'argent')
		end
	else
		xPlayer.showNotification('Vous ne pouvez pas en porter plus')
	end
end)