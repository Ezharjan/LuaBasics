local Object = {}
Object.__index = Object
function Object:new()
end

function Object:extend()
    local SubClass = {}
    for k, v in pairs(self) do
        if k:find("__") == 1 then
            SubClass[k] = v
        end
    end
    SubClass.__index = SubClass
    SubClass.super = self
    setmetatable(SubClass, self)
    return SubClass
end

function Object:__call(...)
    local object = setmetatable({}, self)
    object:new(...)
    return object
end

---------------------------------

local Person = Object:extend()
function Person:new(name)
    Person.super.new(self)
    self.name = name
end
function Person:print()
    print("name is ", self.name)
end

local Student = Person:extend()
function Student:new(name, score)
    Student.super.new(self, name)
    self.score = score
end
function Student:print()
    Student.super.print(self)
    print("score is ", self.score)
end

local s = Student("Tony", 98)
s:print()
-- output :
-- name is Tony
-- score is 98

