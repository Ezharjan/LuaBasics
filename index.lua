function setDefaultValues(_t,_d)
	local mt = {__index = function() return _d end}
	setmetatable(_t, mt)
end
tab = {x=10,y=20}
print(tab.x ,tab.y,tab.z)	--由于没有设置元方法则为nil
setDefaultValues(tab,100)	--设置默认值（设置__index元方法）
print(tab.z)			--检查到有__index的元方法则返回默认值
print(tab.x ,tab.y,tab.z, tab.u, tab.v, tab.w,...)