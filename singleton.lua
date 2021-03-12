require "class"

boy = Class()

--单例模式的实现
boy.Instance = function()
	if (nil == boy.m_instance) then
		boy.m_instance = boy.new();
	end
	return boy.m_instance
end

function boy:ctor()
    print('constructor of the boy is called!')
end

boy.somNum = 999


local abdulla = boy.new(...) --> constructor of the boy is called!
function abdulla.getName()
    return 'my name is abdulla!'
end

print(abdulla.getName()) --> my name is abdulla!

function abdulla.changeSomNum(num)
    boy.somNum = num
end

print(abdulla.somNum) --- 999

abdulla.changeSomNum(888)

local muhammad = boy.new(...)
function muhammad.getSomNum()
    return boy.somNum
end

print(muhammad.getSomNum()) --- 888


