--[[
    -- __add(a, b)                     for a + b
    -- __sub(a, b)                     for a - b
    -- __mul(a, b)                     for a * b
    -- __div(a, b)                     for a / b
    -- __mod(a, b)                     for a % b
    -- __pow(a, b)                     for a ^ b
    -- __unm(a)                        for -a
    -- __concat(a, b)                  for a .. b
    -- __len(a)                        for #a
    -- __eq(a, b)                      for a == b
    -- __lt(a, b)                      for a < b
    -- __le(a, b)                      for a <= b
    -- __index(a, b)                   for a.b
    -- __newindex(a, b, c)             for a.b = c
    -- __call(a, ...)                  for a(...)
]]


--[[
    Lua将a ~= b转换为not (a == b)；a > b转换为b < a；a >= b转换为 b <= a。
    直到Lua 4.0为止，所有的比较运算符被转换成一个，a <= b转为not (b < a)。
    然而这种转换并不一致正确。当我们遇到偏序（partial order）情况，也就是说，
    并不是所有的元素都可以正确的被排序情况。例如，在大多数机器上浮点数不能被排序，
    因为他的值不是一个数字（Not a Number即NaN）。根据IEEE 754的标准，NaN表示一
    个未定义的值，比如0/0的结果。该标准指出任何涉及到NaN比较的结果都应为false。
    也就是说，NaN <= x总是false，x < NaN也总是false。这样一来，在这种情况下
    a <= b 转换为 not (b < a)就不再正确了。在我们关于基和操作的例子中，有类似
    的问题存在。<=代表集合的包含：a <= b表示集合a是集合b的子集。这种意义下，可
    能a <= b和b < a都是false；因此，我们需要将__le和__lt的实现分开。
]]

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

function Set.mt.__unm(t)
    local res = {}
    for k, v in pairs(t) do
        res[k] = -v
    end
    return res
end

--计算交集的方法
function Set.intersection(a,b)
    local res=Set.new{}
    for k in pairs(a) do
        res[k]=b[k]
     end
    return res
end

--计算小于等于的方法
function Set.lessequal(a,b)
    for k in pairs(a) do
        if not b[k] then
           return false
        end
    end
    return true
end

--计算小于的方法
function Set.less(a,b)
    return a<=b and not (b<=a)
end

--计算等于的方法
function Set.equal(a,b)
    return a<=b and b<=a
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

Set.mt.__le = Set.lessequal
Set.mt.__lt = Set.less
Set.mt.__eq = Set.equal



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


-- 注意，相互比较的二者必须要具备相同的元表才可以
print('-------------------')
local mt1 = Set.new{1,2,3,5,6,9}
local mt2 = Set.new{1,2,3,5,9}
if mt1 == mt2 then
    print('mt1 equals to mt2')
end
if mt1 <= mt2 then
    print('mt1 less-equals to mt2')
end
if mt1 > mt2 then
    print('mt1 less than to mt2')
end


print('-------------------')
local unmT = Set.new(-mt1)
print(mt1)
print(unmT)