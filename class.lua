--表_class的key为类，value为类的虚表
local mClass={}

--为什么要使用虚表呢？
--[[
使用虚表的话，那么类本身的元素会是稳定的，
所有的变化都在虚表中进行，
这样 封装了变化、也便于继承的实现
]]


function Class(super)

	--要创建的类class_type
	local classType={}

	--构造函数，基类
	classType.ctor=false
	classType.super=super

	--class_type类型的虚表，虚表中包含class_type中的元素
	local virtualTable={}
	mClass[classType]=virtualTable

	--给类设置元表
	--在给表添加新元素时，会在虚表中也添加
	setmetatable(classType,{
		__newindex = function(t,k,v) virtualTable[k] = v end,
		__index = function(t,k) return virtualTable[k] end,
	})


	--super不为空，表示为继承
	if super then
		setmetatable(virtualTable,{__index=
			function(t,k)
				--从基类找要找的元素，找到就放入派生类虚表中
				local ret=mClass[super][k]
				virtualTable[k]=ret

				return ret
			end
		})
	end

	--给类型class_type创建实例对象
	--1、先依次从最顶层基类中调用构造方法
	--2、然后设置元表
	classType.new=function(...)

		--生成这个类对象
		local obj={}

		do
			local create

			--递归调用构造函数
			create = function(c,...)
				--super不为空，表示有基类
				if c.super then
					create(c.super,...)
				end

				--调用构造函数
				if c.ctor then
					c.ctor(obj,...)
				end
			end

            create(classType,...)
		end

		--设置obj的 __index为class_type的虚表
		setmetatable(obj,{ __index=mClass[classType] })

		return obj
	end

	return classType
end

