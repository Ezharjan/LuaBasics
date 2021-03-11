str = "fatal: unable to access 'https://github.com/Ezharjan/LuaBasics.git/': Failed to connect to github.com port 443: Timed out"
str2 = ": unable to access 'https://github.com/Ezharjan/LuaBasics.git/': Failed to connect to github.com port 443: Timed out"


function getCrusialInfo(str)
    local res = string.lower(str).find(str, 'fatal')
    return res
end

function isSuccessful(tag)
    if tag ~= nil then return true
    else return false end
end


crusialInfo = getCrusialInfo(str2)
isSuccessful = isSuccessful(res)
print(isSuccessful) --false

