local t = {"Alex","ander"," ","Ezharjan"}

print(table.concat(t))
print(table.concat(t,','))


print('-------------------------')

---- change reference, classical way
-- destinationTable = sourceTable

---- shallow copy, errors may occur when the value of v in table inside table is changed
function table.shallowCopy(dest, src)
    for k, v in pairs(src) do
        dest[k] = v
    end
end



function table.deepcopy(src)
    local lookupTable = {}
    local function _copy(obj)
        if type(obj) ~= "table" then
            return obj
        elseif lookupTable[obj] then
            return lookupTable[obj]
        end
        local newTable = {}
        lookupTable[obj] = newTable
        for key, value in pairs(obj) do
            newTable[_copy(key)] = _copy(value)
        end
        return setmetatable(newTable, getmetatable(obj))
    end
    return _copy(src)
end


aT = {a = 1}
bT = {b = 2}
cT = {c = 3}
dT = {d = 4}

-- local sourceTable = {a=1,b=2,r=3,i=4,d=5}  ---- shallowCopy may seem like deepCopy in number,bool,string types but not in table types
local sourceTable = { myA = aT, myB = bT, myC = cT, myD = dT}
local destinationTable = {}
-- table.shallowCopy(destinationTable, sourceTable)
destinationTable = table.deepcopy(sourceTable)

---- Copying is OK when there is no table inside table
-- sourceTable.b = 999 -- changed the initial value here
-- print('destTable.b is:' .. destinationTable.b)

---- alter the table inside table, the reference is the same, errors may occur
sourceTable.myA.a = 999


-- for k,v in pairs(sourceTable) do
for k,v in pairs(destinationTable) do
    print('k:' .. tostring(k))
    for key, value in pairs(v) do
        print('_k:' .. key .. '; _v:' .. value)
    end
end

-----------------------------

print('*****************************')
require'tableLib'
-- 数组中不存在table自动去重的情况 (#1)
t = {'11','22','11'}
table.showKVPairs(t)
table.showLength(t)
print('*****************************')
-- 键值对的表中会自动去掉重复的键值对 (#1)
myTable = {a = '11', b = '22', a ='11', a ='11'}
table.showKVPairs(myTable) -- 只输出两个元素，疑似不输出重复元素？
table.showLength(myTable) -- 再次检查，发现输出的表的长度只剩下2，重复元素只留下了一个，(#1)成立。


print('*****************************')
print('*****************************')
myNewTable = {q = '999', a = '11', b = '22', c ='11'}
resultedTable = table.getRedundantValues(myNewTable)
table.showKVPairs(resultedTable)