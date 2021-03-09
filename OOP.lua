local _class = {}
function class(super)
    local class_type = {}
    class_type.ctor = false
    class_type.super = super
    class_type.new = function(...)
        local obj = {}
        do
            local create
            create = function(c,...)
                if c.super then
                   create(c.super,...) 
                end
                if c.ctor then
                    c.ctor(obj,...)
                end
            end

            create(class_type,...)
        end
        setmetatable(obj,{__index=_class[class_type]})
        return obj
    end
    local vtbl={}
    _class[class_type]=vtbl

    setmetatable(class_type, {
        __newindex = function (t,k,v)
            vtbl[k] = v
        end
    })

    if super then
        setmetatable(vtbl,{
            __index=function(t,k)
                local ret = _class[super][k]
                vtbl[k] = ret
            return ret
            end
        })
    end

    return class_type
end

base_type = class()

function base_type:ctor(x)
    print('initialized x with its value:',x)
    self.x = x
end

function base_type:print_x()
    print(self.x)
end

function base_type:hello()
    print('show hello world')
end

test = class(base_type)

function test:ctror()
    print('constructor is called')
end

function test:hello()
    print('hello')
end

a = test.new(1)
a:print_x()
a:hello()