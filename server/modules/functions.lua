function getPlayerDiscord(src)
    local identifiers = GetPlayerIdentifiers(src)

    for _, v in ipairs(identifiers) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then 
            return string.sub(v, string.len("discord:") + 1)
        end
    end
end