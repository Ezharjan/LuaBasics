require'stack'

local stack = Stack:Create()
stack:Push("hello", "world", "This")
stack:List()
print(stack:Count())
print(stack:Pop())
print(stack:Count())