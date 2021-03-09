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
end


