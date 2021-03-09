Set = {}

function Set.new (t)
    local set = {}
    for _, l in ipairs(t) do set[l] = true end
    return set
end

function Set.union (a,b)
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection (a,b)
    local res = Set.new{}
    for k in pairs(a) do
    res[k] = b[k]
    end
    return res
end

function Set.tostring (set)
    local s = "{"
    local sep = ""
    for e in pairs(set) do
    s = s .. sep .. e
    sep = ", "
    end
    return s .. "}"
end

function Set.print (s)
    print(Set.tostring(s))
end

local mtSet = {
    __newindex = function()
        error('cannot update Set, it is readonly',2) 
    end,
    __index = Set
}



-- make Set readonly, starting from codes below, no functions is appliable to the Set
setmetatable(Set,mtSet)



-- function Set.newFunction() --cannot update Set, it is readonly
    -- print('new function is called!')
-- end

-- Set.newFunc() --cannot update Set, it is readonly


exampltT = {1,2,3,4}
Set.new(exampltT)
Set.print(exampltT)