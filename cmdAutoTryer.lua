local function commander(argToExcute)
    local result = io.popen(argToExcute)
    local strInfo = result:read("*all")
    return strInfo
end

local function getCrusialInfo(str,crusialStr)
    if crusialStr ~= nil then
        local res = string.lower(str).find(str, crusialStr)
    else
        local res = string.lower(str).find(str, 'fatal')
    end
    return res
end

function tryTillSucceed(arg,tryTimes)
    tryTimes = tryTimes or 1000
    for i = 1,tryTimes,1 do
        local info = commander(arg)
        print('argument is: ',arg)
        print('info:' .. tostring(info))
        local res = getCrusialInfo(info)
        if res ~= '' then
            print('Conduction succeeded!')
            break
        end
    end
    return
end

return{
    tryTillSucceed = tryTillSucceed
}