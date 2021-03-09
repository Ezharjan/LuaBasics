Set = {}
Set.mt={}

-- 切记！！！用什么方式定义的函数就要用什么方式进行调用！！！
-- function Set:new(t)
--     local set = {}
--     -- setmetatable(set,Set.mt)
--     setmetatable(set,self.mt)
--     for _,v in ipairs(t) do
--         set[v] = true
--     end
--     return set
-- end

-- 切记！！！用什么方式定义的函数就要用什么方式进行调用！！！
function Set.new (t)
    setmetatable(t, Set.mt)
    return t
end

function Set.mt.__add(a,b)
    local res = {}
    local lengthOfA = 0
    for k,v in pairs(a) do res[k] = v; lengthOfA = lengthOfA + 1 end
    for k,v in pairs(b) do res[k+lengthOfA] = v end
    return res
end

function Set.mt.__mul(a,b)
    local res = Set.new{}
    local index = 0
    for k,v in pairs(a) do
        index = index + 1
        print(b[index])
        if b[index] ~= nil then
            res[k] = v * b[index]
        else
            return '0'
        end
    end
    return res
end

function Set.tostring(_t)
    local s = '{'
    local sep = ''
    for k,v in pairs(_t) do
        s = s .. sep .. v
        sep = ', '
    end
    return s .. '}'
end

Set.mt.__tostring = Set.tostring  --- (1) 用于改变输出行为


-- 切记！！！用什么方式定义的函数就要用什么方式进行调用！！！
-- s1 = Set:new({10, 20, 30, 50})
s1 = Set.new({10, 20, 30, 50})
print(s1) --- (1) is called

-- s1 = Set.new{10, 20, 30, 50} -- 当参数为字符串或者table并且只有一个的时候圆括号可以省略
function Set.getStringTest(str)
    return str
end
-- for example below
print(Set.getStringTest'hello')
-- s2 = Set:new{30, 1}
s2 = Set.new{30, 1, 80}

print(getmetatable(s1)) 
print(getmetatable(s2))

s3 = s1 + s2
print(Set.tostring(s3))



print('-------------------')
ss1 = Set.new{3,5,5,3}
ss2 = Set.new{5,6,7,8}

ss3 = ss1*ss2
print(ss3)