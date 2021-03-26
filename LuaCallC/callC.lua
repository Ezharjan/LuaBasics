local testlib = package.loadlib("ForLua.dll","luaopen_AlexLib");   --获取DLL中抛出函数地址
if (testlib) then
    -- print(testlib)
    testlib();  --调用DLL中抛出函数
else
    print("error!!!")
end

-------------------------------------------

AlexLib.ShowMsg()

local average = 0
local sum = 0
average,sum = AlexLib.GetAverage(1,2,3,4,5)
print("average:", average ,"sum:", sum);