local m = {'1','2','3','4','5'}
local mt = {
    -- showNothing
    __concat = function()
        print('concat is called!')
    end
}

setmetatable(m,mt)

--- wrong usage!
print(m) --table:00432D42
print(table.concat(m)) --12345
print(tostring(m[1]) .. tostring(m[2])) -- 12
print(m[1] .. m[2]) -- 12




----- Correct usage!
local mm = {'a','b'}
setmetatable(mm,mt)
x = m .. mm --- concat is called!
