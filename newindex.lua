--[[
    结论：
    1）当对table中不存在的索引赋值时，解释器就会查找__newindex元方法；
    2）如果有这个元方法，就调用这个元方法，而不是执行复制；
    3）如果这个元方法是一个table，解释器就在table中进行复制，而不是对原来的table。
]]

function ShowKVPairsInTable(_t)
    assert(_t)
    for k,v in pairs(_t) do
        if k ~= 'showKVPairsInTable' and k ~= 'setKVPairsForTable' then
            print(k ,v)
        end
    end
end


local t = {}

function t:setKVPairsForTable(kvpSize)
    for i=1,kvpSize,1 do
        self[i] = (kvpSize + 1) - i
    end
end

local mt = {
	__newindex = function (table,key,value)
		print("newindex is called rather than calling the copy-assignment!")
	end
}

tt = {}
local mmt = {
    -- set all the kvps to tt rather than t itself
    __newindex = tt
}

-- setmetatable(t, mt) -- 1) && 2) open comment or close to see the effect
setmetatable(t,mmt)
t:setKVPairsForTable(10)
ShowKVPairsInTable(t) -- will not show any kv pairs ---> 3)
ShowKVPairsInTable(tt)


