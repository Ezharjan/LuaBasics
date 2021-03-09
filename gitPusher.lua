local tryTimes = 1000

function gitCommit()
    local args = {'git add .', 'git commit -m \" auto commit in comp form LuaScript\" '}
    for i = 1, #args do
        os.execute(args[i])
    end
end

function push()
    argToExcute = 'git push -u origin master'
    local result = io.popen(argToExcute)
    local strInfo = result:read("*all")
    return strInfo
end

function getCrusialInfo(str)
-- TODO: CONDUCT STRINGS
    return str
end

function isSuccessful(tag)
    -- TODO:CHECK WHETHER PUSHING IS SUCCESSFUL
    return false
end

function pushTillSucceed()
    for i = 1,tryTimes,1 do
        local info = push()
        local tag = getCrusialInfo(info)
        if isSuccessful(tag) then
            break
        end
    end
end


gitCommit()
pushTillSucceed()
