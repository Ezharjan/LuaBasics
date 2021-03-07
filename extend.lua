local Person = {}
function Person:new(name)
    self.__index = self
    return setmetatable({
        name = name
    }, self)
end
function Person:print()
    print("name is ", self.name)
end

local Student = setmetatable({}, Person)
Student.super = Person
function Student:new(name, score)
    self.__index = self

    local student = self.super:new(name)
    student.score = score

    setmetatable(student, self)
    return student
end
function Student:print()
    self.super.print(self)
    print("score is ", self.score)
end


local s = Student:new("Tony", 98)
s:print()

-- output :
-- name is Tony
-- score is 98
