local mAge
local mHeight
Person = {
    age = mAge,
    height = mHeight,
    name,
}

local function  getAge()
    return Person.age
end

local function  getHeight()
    return Person.height
end

function Person:getAge ()
    return getAge()
end

function Person:getHeight ()
    return getHeight()
end

function Person:setAge (_age)
    self.age = _age
end

function Person:setHeight (_height)
    self.height = _height
end

function Person:getName ()
    return Person.name
end

return Person
