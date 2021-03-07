local A = {}
A.func1 = function(...)
    print("self is ", self, " args: ", ...)
end
A.func1("123")      -- self is nil  args: 123 
A:func1("123")      -- self is nil  args: table:0x2815926c0 123

function A.func2(...)
    print("self is ", self, " args: ", ...)
end
A.func2("123")      -- self is nil  args: 123 
A:func2("123")      -- self is nil  args: table:0x2815926c0 123

function A:func3(...)
    print("self is ", self, " args: ", ...)
end
A.func3("123")      -- self is 123  args: 
A:func3("123")      -- self is table:0x2815926c0  args: 123
