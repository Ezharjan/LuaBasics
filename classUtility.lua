-- Class Utility
require'class'

baseType = Class()       -- 定义一个基类 base_type

function baseType:ctor(x)  -- 定义 base_type 的构造函数
    print("base_type ctor")
    baseType.x=x
end

function baseType:print_x()    -- 定义一个成员函数 base_type:print_x
    print(baseType.x)
end

function baseType:hello()  -- 定义另一个成员函数 base_type:hello
    print("hello base_type")
end


test = Class(baseType)   -- 定义一个类 test 继承于 base_type

function test:ctor()    -- 定义 test 的构造函数
    print("test ctor")
end

function test:hello()   -- 重载 base_type:hello 为 test:hello
    print("hello test")
end


a=test.new(1)   -- 输出两行，base_type ctor 和 test ctor 。这个对象被正确的构造了。
a:print_x() -- 输出 1 ，这个是基类 base_type 中的成员函数。
a:hello()   -- 输出 hello test ，这个函数被重载了。

-------------------------------------------------------------------------------------

--创建基类person
person = Class()
person.name = "Tonny"
person.age = 20

--设置person类的构造函数
function person:ctor()
	print("person:constructor is called");
end

function person:eat()
	print(self.name .. "eat function is called")
end


--创建派生类boy，基类为person
boy = Class(person)

function boy:ctor()
	print("boy:constructor is called");
end

function boy:eat()
	print("boy " .. self.name .. " eat method is called")
end


--创建完两个类后，就可以使用了。
--创建boy类的实例boy1
boy1 = boy.new()
boy1:eat()


--[[
输出：
person:ctor 调用
boy:ctor 调用
boy Ffly很饿，想吃东西
]]