local QBCore = exports["qb-core"]:GetCoreObject()

---- locals ----

---- functions ----

---- Events ----

RegisterNetEvent("cv-stealparking:server:getmoney", function(Money)
	Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddMoney("cash", Money)
end)


---- commands ----


---- other stuff ----


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName.. ' loading 100% ')
  end)

  AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName..  ' loading 100% ')
  end)

