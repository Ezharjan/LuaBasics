--[[
    Lua中初始化一系列变量时赋值符号的右侧的常量是依次对左边的变量名进行赋值
]]
local x, y, z = 0
print("x:",x)  --- 0
print("y:",y)  --- nil
print("z:",z)  --- nil

print("--------------------")

local xx, yy, zz = 0, 0, 0
print("xx:",xx)  --- 0
print("yy:",yy)  --- 0
print("zz:",zz)  --- 0