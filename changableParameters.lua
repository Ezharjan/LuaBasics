function getSum(...)
    local s = 0
    for i,v in ipairs{...} 
    do
        s = s+v
    end
    return s
end

print(getSum(1,2,3,4,5,6,7,8,9))






function concatStrings(...)
    local res = ''
    for _,v in pairs{...} 
    do
        res = res .. v
    end
    print(res)
    return res
end

concatStrings('Alex','ander',' ','Ezhar', 'jan')