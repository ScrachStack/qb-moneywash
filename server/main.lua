local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback('getitemcount', function(source, cb)
    itemcount = 0
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   
   local playerItem = Player.Functions.GetItemByName(Config.Item)
   
   if playerItem ~= nil then
       itemcount = playerItem.amount
   else
    
   end
   
   
   cb(itemcount)
   itemcount = 0
   
   
   end)

RegisterServerEvent('kezi:moneywash', function (money, data01)


    local src = source
    local b = QBCore.Functions.GetPlayer(src)
    local asdjasd = b.PlayerData.money["cash"]
    local xPlayer = QBCore.Functions.GetPlayer(src)


 

    
       
        xPlayer.Functions.RemoveMoney('blackmoney', data01)

        Wait(1000)
        b.Functions.AddMoney('cash', money)

   

end)

function startup()
print([[
[KZ] Kezi-Moneywash has started. | Verison 1.0.1
]])
end


startup()
