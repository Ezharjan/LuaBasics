local function status(str, c)
    print(str, coroutine.status(c))
end
    
local c1,c2

c1 = coroutine.create(function()
    status("<c2>", c2)
    print("before c1 yield")
    coroutine.yield()
    print("after c1 yield")
end)

c2 = coroutine.create(function()
    status("<c2>", c2)
    print("before c2 resume c1")
    coroutine.resume(c1)
    print("after c2 resume c1")
end)
   

status("<c2>", c2)
coroutine.resume(c2)
status("<c1>", c1)
status("<c2>", c2)
coroutine.resume(c1)
status("<c1>", c1)


--[[
    result:
    <c2>    suspended
    <c2>    running
    before c2 resume c1
    <c2>    normal
    before c1 yield
    after c2 resume c1
    <c1>    suspended
    <c2>    dead
    after c1 yield
    <c1>    dead
]]