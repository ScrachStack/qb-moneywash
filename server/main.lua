local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kezi:moneywash', function(amount, playerCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if tonumber(amount) < 0 then return end

    local currentLocation = nil
    for _, loc in ipairs(Config.Locations) do
        local dist = #(playerCoords - vector3(loc.x, loc.y, loc.z))
        if dist < 5.0 then
            currentLocation = loc
            break
        end
    end

    if not currentLocation then
        print("Location not found")
        return
    end

    local tax = tonumber(currentLocation.tax)
    local bidentax = (amount * tax) / 100
    local newAmount = amount - bidentax

    if Player.Functions.RemoveMoney("blackmoney", math.ceil(amount)) then
        Wait(1000)
        Player.Functions.AddMoney('cash', newAmount)
    end
end)

function startup()
    print("[KZ] Kezi-Moneywash has started. | Version 1.0.3")
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startup()
    end
end)
