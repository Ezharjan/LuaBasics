--[[
    结论：
    1) 用ipairs时key必须从1开始，否则将不会进行遍历；
    2) 用ipairs时如果key从1开始后在中途失去顺序，则将在失序处停止遍历；
    3) 用ipairs时要保证key对应的值都是有效的，不能是nil，否则将在nil处停止遍历。
]]

function useIPairsToShow(t)
    assert(t)
    print('----------ipairs-------------')
    for k,v in ipairs(t)
    do
        print('value: ',v,'; type: ',type(v))
    end
end

function usePairsToShow(t)
    assert(t)
    print('----------pairs-------------')
    for k,v in pairs(t)
    do
        print('value: ',v,'; type: ',type(v))
    end
end

function showKVPsInPairs(t)
    assert(t)
    for k,v in pairs(t)
    do
        print('k: '.. k ..';  value: ' .. tostring(v))
    end
end


function showKVPsInIPairs(t)
    assert(t)
    for k,v in ipairs(t)
    do
        print('k: '.. k ..';  value: ' .. tostring(v))
    end
end

orderedTable = {1,2,nil,3,4,4,5}
unorderedTable = {11,32,5,7,6,3,4,9}
reversedTable = {5,4,nil,3,2,1,0}
stringTable = {'x','y','z', nil ,'w'}

-- useIPairsToShow(orderedTable)
-- usePairsToShow(orderedTable)
-- useIPairsToShow(unorderedTable)
-- usePairsToShow(unorderedTable)

function getLength(t)
    local length = 0
    for k,v in pairs(t) do
        length = length + 1
    end
    return length
end

function makeupMap(t)
    assert(t)
    local map = {}
    for i = 1, getLength(t) do
        -- print(t[i])
        ---- map的键必须要从1开始，否则即便赋值了，ipairs也遍历不了，可以用pairs遍历。
        map[t[i]] = true
    end
    return map
end

newMap = makeupMap(unorderedTable)
-- showKVPsInPairs(newMap)
-- showKVPsInIPairs(newMap)
useIPairsToShow(newMap) -- unrecursorable
-- usePairsToShow(newMap)