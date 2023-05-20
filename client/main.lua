local QBCore = exports['qb-core']:GetCoreObject()

function openwasher()
    local input = lib.inputDialog('Wash Money', {'Black Money'})
        
    if not input then return end

    if tonumber(input[1]) == 0 then 
        lib.notify({
            title = 'Moneywash | Error',
            description = 'Value cant be 0',
            type = 'info',
            position = 'top'
        })
        return
    end

    if tonumber(input[1]) < 0  then 
        lib.notify({
            title = 'Moneywash | Error',
            description = 'Value must be above 0',
            type = 'info',
            position = 'top'
        })
        return
    end

    local location = GetEntityCoords(PlayerPedId())
    local currentLocation = nil
    for _, loc in ipairs(Config.Locations) do
        if vector3(loc.x, loc.y, loc.z) == location then
            currentLocation = loc
            break
        end
    end

    if not currentLocation then
        lib.notify({
            title = 'Moneywash | Error',
            description = 'Location not found',
            type = 'info',
            position = 'top'
        })
        return
    end

    local tax = currentLocation.tax
    local bidentax = (input[1] * tax) / 100

    if Config.Misc.UseprogressCircle then 
        if lib.progressCircle({
            duration = Config.Misc.Progressduration,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
            },
        }) then
            local amounttobegivenincash = input[1] - bidentax
            print(tonumber(amounttobegivenincash))
            TriggerServerEvent('kezi:moneywash', amounttobegivenincash, input[1])
            lib.notify({
                title = 'Laundry | Success',
                description = "You Laundered $" .. input[1] .. " You got "  .." $".. tonumber(amounttobegivenincash) .. " Clean Money from it",
                type = 'success',
                position = 'top'
            })
        else 
            print("Oh no")
        end
    end

    if not Config.Misc.UseprogressCircle then 
        local amounttobegivenincash = input[1] - bidentax
        TriggerServerEvent('kezi:moneywash', input[1])
        lib.notify({
            title = 'Laundry | Success',
            description = "You Laundered $" .. input[1] .. " You got "  .." $".. tonumber(amounttobegivenincash) .. " Clean Money from it",
            type = 'success',
            position = 'top'
        })
    end
end 

CreateThread(function()
    while true do
        Wait(100)
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        for _, loc in ipairs(Config.Locations) do
            local location = vector3(loc.x, loc.y, loc.z)
            if #(pos - location) < 5.0 then
                inRange = true
                lib.showTextUI('[E] - Wash Money')
                if IsControlPressed(0, 38) then
                    openwasher()
                    lib.hideTextUI()
                end
                break
            end
        end

        if not inRange then
            lib.hideTextUI()
        end
    end
end)
