print("hello world");
print("this is lua!");
print("\n\n");

-- function utitility
function sum(...)
    res = 0
    tab = {...}
    for i,v in ipairs(tab) do
        res = res + v
    end
    return res
end

print(sum(2,63,4))


-- if-else
local a = 1
b = 2
result = a + b
if(result~=nil) then
    print(result,type(result))
end    

-- loop
for i = 1,10,1 do
    print('---'..i)
end

-- types and values
PI = 3.141592657519242365
print(PI, type(PI)) --> string
print(type("Hello world")) --> string
print(type(10.4*3)) --> number
print(type(print)) --> function
print(type(type)) --> function
print(type(true)) --> boolean
print(type(nil)) --> nil
print(type(type(X))) --> string


str = "Alexander"
str = "Ezharjan"
print(str)


print("10" + 1) --> 11
print("10 + 1") --> 10 + 1
print(10 .. 20) --> 1020




print(not nil) --> true
print(not false) --> true
print(not 0) --> false
print(not not nil) --> false

-- Tables
days = {"Sunday", "Monday", "Tuesday", "Wednesday",
"Thursday", "Friday", "Saturday"};

-- for i=7,0,-1 do
for i=0,7,1 do
    print(days[i]);
end

-- tab = {math.sin(1), math.sin(2), math.sin(3), math.sin(4),
-- math.sin(5),math.sin(6), math.sin(7), math.sin(8)}
sin = math.sin;
tab = {sin(1), sin(2), sin(3), sin(4),
sin(5),sin(6), sin(7), sin(8)}

function printTableContent() 
    for i=0,8,1 do
        print(tab[i])
    end
end


X = 9
Y = 88
Y, X = X, Y
print(X,Y) -->88,9






--[[
This script is developed by Alexander Ezharjan.
This comment is done by Alexander Ezharjan.
--]]
