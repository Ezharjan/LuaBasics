require"advanvedStringUtils"

local str = "游戏引擎工程师"
local res1 = GetUTFLen(str)
local res2 = GetUTFLenWithCount(str,2)
local res3 = GetStringFromUTF(str,8)
local res4 = SubStringUTF8(str, 3, #str)
print(res1) --- 14
print(res2) --- 3
print(res3) --- 游戏引擎...
print(res4) --- 引擎工程师
