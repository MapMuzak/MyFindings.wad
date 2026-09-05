name = "hampter3"
description = "mute everything except has x hearts"
author = "hampter"

onEvent("ChatReceiveEvent", function(message, sender, type)
    local heartVal = message:match("has (%d+%.?%d*) hearts$")
    
    if heartVal then
        local num = tonumber(heartVal)
        if num and num >= 0 and num <= 30 then
            return false
        end
    end
    
    return true
end)