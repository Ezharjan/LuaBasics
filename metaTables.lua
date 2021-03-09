-- this function must com first in global scope
function declare (name, initval)
    rawset(_G, name, initval or false)
end


setmetatable(_G, {
    __newindex = function (_, n)
    error("attempt to write to undeclared variable "..n, 2)
    end,
    __index = function (_, n)
    error("attempt to read undeclared variable "..n, 2)
    end,
})


-- declare('a',1) -- 2 line of codes below is de facto the same as this line
declare'a'
a = 1
print('value of a is: ',a)



-- print(x)  -- attempt to read undeclared variable x
-- x = 1 --  attempt to write to undeclared variable x

