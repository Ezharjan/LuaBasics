--[[
    rawget(table, index):
    (1) 排除掉元表的干扰，直接取到表中真正的值；
    (2) 当原来的表tab中的某这值不为空时，元表是不会影响它的值的；

    rawset(table,key,value): 使元方法失效，直接赋值。
]]


--  定义一个table
local tab = {
    66,
    11,
    h = 25,
    w = 32,
}

--  定义元表
local mt = {x = 77, y = 78, h = 9}


-- 先打印没有元表的情况
print("\nno metatable tab.h =", tab.h)
print("\nno metatable tab.x =", tab.x)

-- 设置元表
setmetatable(tab, {__index = mt})

-- 打印有元表的情况
print("\nhave metatable tab.h =", tab.h)
print("\nhave metatable tab.x =", tab.x)

-- 打印不使用元表的情况
print("\nnot use metatable tab.h =", rawget(tab, "h"))
print("\nnot use metatable tab.x =", rawget(tab, "x"))





-- rawset(table,key,value)
t = {a = 1}

mmt = {
    __newindex = function(k,v)
        error('attemp to set new index!')
    end
}

setmetatable(t,mmt)

-- t.xxx = 'yyy'  -- 直接赋值将会除法元方法中的__newindex方法

rawset(t,1,2) -- 正常使用，不会触发元方法
rawset(t,"b",3)
rawset(t,"c","d")

print(t.a,t[1],t.b,t.c)







print("----------------------------------")

Class = {}
Class.mt = {}

function Class.New(o)
	local instance = o or {}
	setmetatable(instance,Class.mt)
	return instance
end

Class.mt.__index = function(t, key)
	return "hello world"
end

Class.mt.__newindex = function(t, key , value)
	if key == "fgreen" then
		rawset(t, key, value) --原始操作不使用元表方法
		-- t.fgreen = value    --会使用元表__newindex方法
	end
end

w = Class.New({})
print(rawget(w,"fgreen")) --第一次打印输出
print(w.fgreen)
w.fgreen = "nVal"
print(w.fgreen)

--[[
    
    可以看到第一次打印输出是nil 说明使用rawget获取表的值时没有去访问元表的__index 方法,而是直接访问了表w ,所以输出了nil.
    而第二次打印的时候没有使用rawget方法获取表的值 则调用的了元表的__index方法去获取表的值输出了元方法的返回值.
    当直接对w.fgreen赋值时,使用了元方法__newindex,元方法里面又使用了rawset 设置表的值,此时不会再去调用元方法__newindex了,所以设置成功了.
    如果将rawset(t, key, value)换成t.fgreen = value的话将会造成死循环,因为t.fgreen = value的直接赋值会继续去调用元方法__newindex,造成堆栈溢出.
]]