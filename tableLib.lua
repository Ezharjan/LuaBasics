function table.dedup(simpleTable, isArray)
    local check = {}
    local result = {}
    local idx = 1
    for k, v in pairs(simpleTable) do
        if not check[v] then
            if isArray then
                result[idx] = v
                idx = idx + 1
            else
                result[k] = v
            end
            check[v] = true
        end
    end
    return result
end

function table.getRedundantValues(t)
    local redundantValues = {}
    local result = {}
    local check = {}
    for k, v in pairs(t) do
        if not check[v] then
            check[v] = true
        else
            redundantValues[k] = v 
        end
    end
    ---- codes below are waiting to be optimized
    if table.getLength(redundantValues) > 0 then
        local redundantValue
        for k, v in pairs(t) do
            if redundantValues[k] ~= nil then                
                redundantValue = redundantValues[k]
                for _k, _v in pairs(t) do
                    if redundantValue == _v then
                        result[_k] = _v
                    end
                end
            end
        end 
    end
    return result
end

function table.showKVPairs(t)
    for k, v in pairs(t) do
        print(k,v)
    end
end

function table.getLength(t)
    local length = 0
    for _, __ in pairs(t) do
        length = length + 1
    end    
    return length
end

function table.showLength(t)
    print(table.getLength(t))
end

