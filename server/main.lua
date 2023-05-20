local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('kezi:moneywash', function (amount) -- Wooshie#1337 Fixing 
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)

   if tonumber(amount) < 0 then return end


   
   bidentax = (amount * Config.Tax)  / 100
   newAmount = amount - bidentax

   if Player.Functions.RemoveMoney("blackmoney", math.ceil(amount)) then
       Wait(1000)
       Player.Functions.AddMoney('cash', newAmount)
   end
end)

function startup()
print([[
[KZ] Kezi-Moneywash has started. | Verison 1.0.3
]])
end



AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
    startup()
   end
end)

