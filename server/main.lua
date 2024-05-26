ESX = exports['es_extended']:getSharedObject()

<<<<<<< HEAD
RegisterCommand(Config.Command, function(source, args) 
=======
RegisterCommand('canjearcodigo', function(source, args) 
>>>>>>> 43eaaa6d120161417749e15b58b6d534fb2b116b
    local src = source 

    if not src then
        return 
    end

<<<<<<< HEAD
=======
    if not args[1] then
        ESX.ShowNotification(src, "Debes introducir un código.")
    end

    local code = args[1]
>>>>>>> 43eaaa6d120161417749e15b58b6d534fb2b116b
    local Player = ESX.GetPlayerFromId(src)

    if not Player then
        return 
    end

<<<<<<< HEAD
    if not args[1] then
        Player.showNotification(Config.Translations['no_code'])
    end

    local code = args[1]

    local discord = getPlayerDiscord(src)

    if not discord then
        Player.showNotification(Config.Translations['no_discord'])
=======
    local discord = getPlayerDiscord(src)

    if not discord then
        ESX.ShowNotification(src, "Debes tener tu Discord vinculado para canjear códigos.")
>>>>>>> 43eaaa6d120161417749e15b58b6d534fb2b116b

        return 
    end

<<<<<<< HEAD
    -- @ Validate code is unclaimed
    PerformHttpRequest(Config.Website.URL .. '?code=' .. code, function (errorCode, resultData, resultHeaders, errorData)
        if errorCode ~= 200 then
            Player.showNotification(Config.Translations['invalid_code'])
=======
    PerformHttpRequest(WEBSITE_URL, function (errorCode, resultData, resultHeaders, errorData)
        if errorCode ~= 200 then
            ESX.ShowNotification(src, "El código no es válido o ya ha sido canjeado.")
>>>>>>> 43eaaa6d120161417749e15b58b6d534fb2b116b

            return 
        end

        local data = json.decode(resultData)

<<<<<<< HEAD
        if data.code.status == 'claimed' then
            Player.showNotification(Config.Translations['invalid_code'])

            return 
        else 
            -- @ Claim code
            PerformHttpRequest(Config.Website.URL, function (errorCode, resultData, resultHeaders, errorData)
                if errorCode ~= 200 then
                    Player.showNotification(Config.Translations['invalid_code'])
        
                    return 
                end
        
                local data = json.decode(resultData)
        
                local result = data.code 

                -- @ Code has been claimed
                if result then 
                    Player.showNotification(Config.Translations['claimed_code'])

                    -- @ Add item or money to player
                    if result.product then 
                        -- @ Add weapon
                        if result.product.ig_category == 'weapon' then 
                            Player.addWeapon(result.product.ig_value, 100)
                        end

                        -- @ Add bank money 
                        if result.product.ig_category == 'money' then 
                            Player.addAccountMoney('bank', tonumber(result.product.ig_value))
                        end

                        -- @ Add vip money 
                        if result.product.ig_category == 'vip' then 
                            Player.addAccountMoney(Config.VIPAccount, tonumber(result.product.ig_value))
                        end
                    end
                else 
                    Player.showNotification(Config.Translations['invalid_code'])
                end
            end, 'POST', json.encode({
                code = code,
                secret = Config.Website.Secret,
                discordId = discord
            }), {
                ['Content-Type'] = 'application/json'
            })
        end
    end)
=======
        print(resultData)
    end, 'POST', json.encode({
        code = code,
        secret = WEBSITE_SECRET
    }), {
        ['Content-Type'] = 'application/json'
    })
>>>>>>> 43eaaa6d120161417749e15b58b6d534fb2b116b
end)