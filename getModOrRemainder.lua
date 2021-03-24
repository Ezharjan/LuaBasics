--[[
    In Python and Lua, '%' is actually the operation of gaining mod
    instead of gaining remainder.
    But in C/C++ and Java, etc. '%' means gaining remainder.

    The result of gaining remainder is equals to the ones in 
    conducting mod operation while both of the signs of the numbers
    are the same.But totally different while the sign of one is
    different from the other.


    Review[The formula of gaining remainder]:
    remainderOf(a/b) = a - GeQuotient(a/b) * b.

    The main cause of the problem lays on 'GeQuotient'
    function, if it gets the integer closer to 0, its gaining 
    the remainder while it gets the integer by flooring, its
    actually conducting mod operation.
    It depends on whether to directlly get the quotient part
    of the divided result or to get the one far from zero when 
    the sign is different. C/C++ directlly got the quitient part 
    to make it all the same as same-sign-numbers' division.
]]



-- This function shows what C/C++ did to get remainder intuitivly.
local function whatCPPDidToGetRemainder(x,y)
    local res = tostring(x/y)
    local quotient = 0
    local fractionIgnored = string.sub(res, 1, 1)
    if fractionIgnored == '-' then
        fractionIgnored = string.sub(res,2,2)
    end
    quotient = tonumber(fractionIgnored)
    -- print('quotient part:',quotient)
    return (x - quotient*y);
end


local function getRemainder(x,y)
    local quotient = (x/y)
    print('x/y in function:', quotient)
    if quotient > 0 then
        quotient = math.floor(quotient)
    else
        quotient = math.ceil(quotient)
    end
    -- when flooring, it's conducting mod operation
    return (x - quotient*y);
end

local function getMod(x,y)
    -- when flooring, it's conducting mod operation
    return x - math.floor(x / y)*y;
end

local x = -1
local y = 3

print('% operation:', x%y)  --- 2  -----> in C/C++ the result is -1, which is really gaining remainder.
print('get mod:', getMod(x,y))   --- 2  -----> in C/C++ the result is -1, which is really gaining remainder.
print('get remainder:', getRemainder(x,y))   --- -1  -----> the same result as done in C/C++.
print('C/C++ like remainder:',whatCPPDidToGetRemainder(-1,3))


print('------------------------')

local z = 5
local w = 2
print('% operation to same signs:', z%w) --- 1 ----> the remainder is the same when both signs of the number is the same.
print('get mod to same signs:', getMod(z,w)) --- 1 ----> the remainder is the same when both signs of the number is the same.
print('get remainder to same signs:', getRemainder(z,w)) --- 1 ----> the remainder is the same when both signs of the number is the same.




--[[
    Result:
    % operation:    2
    get mod:        2
    x/y in function:        -0.33333333333333
    get remainder:  -1
    ------------------------
    % operation to same signs:      1
    get mod to same signs:  1
    x/y in function:        2.5
    get remainder to same signs:    1
]]



---by ALexander Ezharjan in 23rd March, 2021.