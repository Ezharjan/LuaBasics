mytable = {"apple", "orange", "banana"}

print(collectgarbage("count"))

mytable = nil

print(collectgarbage("setpause", 200))

print(collectgarbage("count"))

print(collectgarbage("collect"))

print(collectgarbage("count"))