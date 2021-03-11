local myArray = {13,2,3,4,'s',nil,3,2,1}

local aLength = #myArray

print('length of array is: ',aLength)

local function traverse(t)
    for i = 1, aLength  do
        print(myArray[i])
    end
end

traverse(myArray)

--[[
结果：
    length of array is:     9
    13
    2
    3
    4
    s
    nil
    3
    2
    1
]]



local test1 = {[1] = 1 , [2] = 2 ,[4] = 4 ,[6] = 6}
local test2 = {[1] = 1, [2] = 2 ,[5] = 5 ,[6] = 6}
print('count: ' .. #test1) -- 6
print('count: ' .. #test2) -- 2

