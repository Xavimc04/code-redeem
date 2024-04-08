ESX = exports['es_extended']:getSharedObject()

RegisterCommand('canjearcodigo', function(source, args) 
    local src = source 

    if not src then
        return 
    end

    local Player = ESX.GetPlayerFromId(src)

    if not Player then
        return 
    end

    if not args[1] then
        ESX.ShowNotification(src, "Debes introducir un código.")
    end

    local code = args[1]

    PerformHttpRequest(WEBSITE_URL, function (errorCode, resultData, resultHeaders, errorData)
        
    end, 'POST', json.encode({
        code = code,
        secret = WEBSITE_SECRET
    }), {
        ['Content-Type'] = 'application/json'
    })
end)