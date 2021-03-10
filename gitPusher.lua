local tryTimes = 1000

local pushCmd =  'git push -u origin master'
local pullCmd =  'git pull'

function gitCommit()
    local args = {'git add .', 'git commit -m \" auto commit in comp form LuaScript\" '}
    for i = 1, #args do
        os.execute(args[i])
    end
end

function commander(argToExcute)
    local result = io.popen(argToExcute)
    local strInfo = result:read("*all")
    return strInfo
end

function getCrusialInfo(str)
    local res = string.lower(str).find(str, 'fatal')
    return res
end

function isSuccessful(tag)
    if tag ~= nil then return true
    else return false end
end

function pushTillSucceed(method,arg)
    for i = 1,tryTimes,1 do
        local info = method(arg)
        local tag = getCrusialInfo(info)
        if isSuccessful(tag) then
            print('successful!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
            break
        end
    end
    return
end

gitCommit()
pushTillSucceed(commander,pushCmd)
pushTillSucceed(commander,pullCmd)
