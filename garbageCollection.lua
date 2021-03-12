mytable = {"apple", "orange", "banana"}

print(collectgarbage("count"))

mytable = nil

print(collectgarbage("setpause", 200))

print(collectgarbage("count"))

print(collectgarbage("collect"))

print(collectgarbage("count"))

--[[
    result:
    20.1337890625
    200
    20.1826171875
    0
    19.1796875
]]