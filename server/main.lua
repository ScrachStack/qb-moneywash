local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('kezi:moneywash', function (money, data01)


    local src = source
    local b = QBCore.Functions.GetPlayer(src)
    local xPlayer = QBCore.Functions.GetPlayer(src)


 

    if  tonumber(data01) < 0  then
        
    end
        xPlayer.Functions.RemoveMoney('blackmoney', data01)

        Wait(1000)
        b.Functions.AddMoney('cash', money)

    

end)

function startup()
print([[
[KZ] Kezi-Moneywash has started. | Verison 1.0.2
]])
end



AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
    startup()
   end
end)

