function MyFunc()
    local index = 0
    return function()
        index = index + 1
        return index
    end
end

local inner = MyFunc()
print(inner())
print(inner())

function MyFunc2()
    local index = 0
    print('HELLO')
    return function()
        print(index)
        index = index+1
    end
end

local inner2 = MyFunc2()
inner2()
inner2()