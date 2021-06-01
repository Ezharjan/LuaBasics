local strTable = {"1","2","3","4","5"}
local result =  ""
local spilter = ","
for i = 1, #strTable do
    result = (i==1) and strTable[i] or result .. spilter .. strTable[i]
end

print(result)

local emptyList = {}
print(#emptyList)