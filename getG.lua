--   _G是一张表，保存了lua所用的所有全局函数和全局变量
 
 
for a,b in pairs(_G) do
    print(a,"\t",b)
    if  type(b) == "table" then
        for x,y in pairs(b) do
            print("\t","|--",x,y)
        end
    end
end
 
--  _G.print("你好")
--  _G["print"]("你好")
 
 
-- print("_G中也保存了自身",  _G , _G._G)
-- _G._G._G._G._G._G["print"]("你好啊")
 
 
 
-- --全局函数和变量会自动加入到_G表
 
-- a = 1
-- function myfun()
--     print("自定义函数")
-- end
-- print(_G.a)
-- _G.myfun()
-- --手动设置全局变量
-- _G["b"] = "手动的全局变量"
-- print(b)