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

    local currentLocation = nil
    for _, loc in ipairs(Config.Locations) do
        local dist = #(GetEntityCoords(PlayerPedId()) - vector3(loc.x, loc.y, loc.z))
        if dist < 5.0 then
            currentLocation = loc
            break
        end
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
            local playerCoords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('kezi:moneywash', amounttobegivenincash, playerCoords)
        end
    end

    if not Config.Misc.UseprogressCircle then 
        local amounttobegivenincash = input[1] - bidentax
        local playerCoords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent('kezi:moneywash', input[1], playerCoords)
    
    end
end 

RegisterCommand("+washmoney", function()
    local pos = GetEntityCoords(PlayerPedId())
    local atLocation = false

    for _, loc in ipairs(Config.Locations) do
        local distance = #(pos - vector3(loc.x, loc.y, loc.z))
        if distance < 5.0 then
            atLocation = true
            break
        end
    end

    if atLocation then
        openwasher()
    end
end, false)

RegisterKeyMapping('+washmoney', '+Wash Money', 'keyboard', 'E') 
