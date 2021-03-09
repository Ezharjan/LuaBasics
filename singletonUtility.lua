require'singleton'

local b1 = boy.Instance()
local b2 = boy.Instance()

if b1==b2 then
	print("相等")
else
	print("不相等")
end

--输出相等