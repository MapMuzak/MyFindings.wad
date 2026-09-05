name = "hampter"
description = "raw text viewer"
author = "hampter"

onEvent("ChatReceiveEvent", function(message, name, type)
    message = string.gsub(message, "§", "[Z]")
    message = string.gsub(message, "»", "[Y]")
    
    print("Flarial." .. message)
    
    return false
end)