local queue = {}

function queue.new()
    return setmetatable({first = 1, last = 0}, {__index = queue})
end

--  添加一个元素并返回true。
function queue.offer(self, ...)
    for i, v in ipairs({...}) do
        self.last = self.last + 1
        self[self.last] = v
    end
end

-- 移除并返回队列头部的元素；如果队列为空，则返回null。
function queue.poll(self)
    if self.first > self.last then
        return nil
    end

    local v = self[self.first]
    self[self.first] = nil
    self.first = self.first + 1
    return v
end

function queue.tail(self)
    return self[self.last]
end

function queue.size(self)
    return self.last - self.first + 1
end

function queue.clear(self)
    for _, __ in pairs(self) do
        self.poll(self)
        self.first = 1
        self.last = 0
    end
end

function queue.iter(self)
    local i = self.first
    return function()
    local v = self[i]
    i = i + 1
    return v
    end
end

function queue.submit(self, i, item)
    self[i] = item
end

return queue
