local function commander(argToExcute)
    local result = os.execute(argToExcute)
    return result
end

function tryTillSucceed(arg,tryTimes)
    local tryTimes = tryTimes or 1000
    for i = 1,tryTimes,1 do
        print('argument is: ',arg)
        local res = commander(arg)
        if re ~= 0 then break end
    end
end

return{
    tryTillSucceed = tryTillSucceed
}