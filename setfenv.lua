--[[
    结论：
    当创建一个新的函数时，他从创建他的函数继承了环境变量。所以，如果一个chunk改变了他自己的环境，这个chunk所有在改变之后定义的函数都共享相同的环境，都会受到影响。
]]

-------在变量定义过程中定义环境
-- a = 1 -- create a global variable
-- -- change current environment to a new empty table
-- setfenv(1, {})
-- print(a) ---> attempt to call global 'print' (a nil value)





-------在变量定义过程中更换环境为全局环境
-- a = 1 -- create a global variable
-- -- change current environment
-- setfenv(1, {myG = _G})  -- 使用全局_G
-- myG.print(a) --> nil
-- myG.print(myG.a) --> 1


-------继承全局环境再定义全局环境
a = 1
local newgt = {} -- create new environment
setmetatable(newgt, {__index = _G}) --- 继承
--[[
    任何赋值操作都对新表进行，不用担心误操作修改了全局变量表
]]
setfenv(1, newgt) -- set it
print(a) --> 1