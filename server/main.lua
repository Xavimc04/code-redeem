ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.Command, function(source, args) 
    local src = source 

    if not src then
        return 
    end

    local Player = ESX.GetPlayerFromId(src)

    if not Player then
        return 
    end

    if not args[1] then
        Player.showNotification(Config.Translations['no_code'])
    end

    local code = args[1]

    local discord = getPlayerDiscord(src)

    if not discord then
        Player.showNotification(Config.Translations['no_discord'])

        return 
    end

    -- @ Validate code is unclaimed
    PerformHttpRequest(Config.Website.URL .. '?code=' .. code, function (errorCode, resultData, resultHeaders, errorData)
        if errorCode ~= 200 then
            Player.showNotification(Config.Translations['invalid_code'])

            return 
        end

        local data = json.decode(resultData)

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
end)