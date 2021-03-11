--[[
    Debug库中的一个重要的思想是栈级别(stack level)。
    一个栈级别就是一个指向在当前时刻正在活动的特殊函数的数字，
    也就是说，这个函数正在被调用但还没有返回。
    调用debug库的函数级别为1，调用他(他指调用debug库的函数)的函数级别为2，以此类推。
]]


function traceback()
    local level = 1
    while true do
        local info = debug.getinfo(level, "Sl")
        if not info then break end
        if info.what == "C" then -- is a C function?
            print(level, "C function")
        else -- a Lua function
            print(string.format("[%s]:%d", info.short_src, info.currentline))
        end
        level = level + 1
    end
end

traceback()



function foo (a,b)
    local x
    do local c = a - b end
    local a = 1
    while true do
        local name, value = debug.getlocal(1, a)
        if not name then break end
        print(name, value)
        a = a + 1
    end
end

foo(10, 20)



debug = nil