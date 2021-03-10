--[[
	二叉堆
]]

require('class')

local BinaryHeap = Class("BinaryHeap")
 
function BinaryHeap:ctor()
	self.m_array = {}    --数组
	self.m_lastIndex = 0  --当前数组末尾的位置
end
 
--插入数据
function BinaryHeap:insert(data)
 
	table.insert(self.m_array,data)
	self.m_lastIndex = self.m_lastIndex + 1
	if self.m_lastIndex > 1 then
		self:swimUp(self.m_lastIndex)
	end
end
 
--将插入的数据上移到合适的位置（向上整形）
function BinaryHeap:swimUp(index)
	local pindex = math.floor(index/2)  --取出父节点的位置
 
	--父节点还在数组里并且当前节点的值小于父节点的值，于是交换
	while pindex > 0 and self:compare(index,pindex) do
		self:change(index,pindex)
		index = pindex
		pindex = math.floor(pindex/2)   --寻找父节点的父节点
	end
end
 
--比较数据的大小
function BinaryHeap:compare(n,m)
	local a = self.m_array[n]
	local b = self.m_array[m]
	if a and b then
		return a < b
	end
end
 
--交换两个数据
function BinaryHeap:change(n,m)
	local temp = self.m_array[n]
	self.m_array[n] = self.m_array[m]
	self.m_array[m] = temp
end
 
--获取最小值
function BinaryHeap:getMin()
	return self.m_array[1] 
end
 
--删除数据（相当于删除最后一个节点的数据）
function BinaryHeap:popMin()
	self.m_array[1] = self.m_array[self.m_lastIndex]
	table.remove(self.m_array,self.m_lastIndex)
	
	self.m_lastIndex = self.m_lastIndex - 1
	self:sinkDown(1)
end
 
--将根节点的数据下移到合适的位置（向下整形）
function BinaryHeap:sinkDown(index)
	local cindex = index * 2   --当前节点的子节点
 
	while cindex <= self.m_lastIndex do
		--找出两个子节点中值最小的子节点
		if cindex+1 <= self.m_lastIndex and self:compare(cindex+1,cindex) then
			cindex = cindex + 1
		end
		if self:compare(cindex,index) then
			self:change(cindex,index)
			index = cindex
			cindex = cindex*2   --寻找子节点的子节点
		else
			break    --不满足条件，退出
		end
	end
end
 
--打印
function BinaryHeap:printArr()
	dump(self.m_array,"array",10)
end
 
 
return BinaryHeap