function ListNew()
    return {first = 0, last = -1}
end



List = {}

function List.new()
    return{first = 0,last=-1}
end

function List.pushLeft(list,value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function List.popLeft(list)
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil
    list.first = first + 1
    return value
end

function List.popRight(list)
    local last = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last] = nil -- to allow garbage collection
    list.last = last - 1
    return value
end



 
local myList = List.new()
List.pushLeft(myList,1)
List.pushLeft(myList,3)
left = List.popLeft(myList)
right = List.popRight(myList)
print(right,left) 
