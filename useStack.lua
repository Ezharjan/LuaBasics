require'stack'

local stack = Stack:Create()
stack:Push("hello", "world", "This")
stack:List()
print(stack:Count())
print(stack:Pop())
print(stack:Count())

--[[
    result：
    1       hello
    2       world
    3       This
    3
    This
    2
]]