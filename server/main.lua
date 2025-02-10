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

    if Player.Functions.RemoveItem('markedbills', amount) then
        TriggerClientEvent('chatMessage', src, '^2Moneywash', {255, 255, 255}, 'You will receive in 30 seconds. $' .. tonumber(newAmount) .. ' clean money.')
      --  Citizen.Wait(30000) -- 30-second timer
        Player.Functions.AddMoney('cash', newAmount)
    end
end)

function startup()
    print("[ScrachStack] QB-Moneywash has started. | Version 6.3")
end
function zapsupdatee()
local githubRawUrl = "https://raw.githubusercontent.com/ScrachStack/base/main/api.json"
local resourceName = "moneywash" 

PerformHttpRequest(githubRawUrl, function(statusCode, responseText, headers)
    if statusCode == 200 then
        local responseData = json.decode(responseText)

        if responseData[resourceName] then
            local remoteVersion = responseData[resourceName].version
            local description = responseData[resourceName].description
            local changelog = responseData[resourceName].changelog

            local manifestVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0)

            print("Resource: " .. resourceName)
            print("Manifest Version: " .. manifestVersion)
            print("Remote Version: " .. remoteVersion)
            print("Description: " .. description)

            if manifestVersion ~= remoteVersion then
                print("Status: Out of Date (New Version: " .. remoteVersion .. ")")
                print("Changelog:")
                for _, change in ipairs(changelog) do
                    print("- " .. change)
                end
                print("Link to Updates: https://discord.gg/Qpr8EzFJhf")
            else
                print("Status: Up to Date")
            end
        else
            print("Resource name not found in the response.")
        end
    else
        print("HTTP request failed with status code: " .. statusCode)
    end
end, "GET", nil, json.encode({}), {})
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startup()
        zapsupdatee()
    end
end)


