local count = 0
function MyData(b) count = count + 1 end
dofile('customizedData')
-- print(count)



local names={}
local years={}
function MyData(b)
    names[b[1]] = "false"
    years[b[4]] = "false"
end
dofile('customizedData')

for name in pairs(names) do print(name) end

for year in pairs(years)
do
    if year == nil then
        print('year is null!') -- never happens
    end
    print(year)  -- no duplicated years in console
end



for year in ipairs(years) do print(year) end -- nothing in console coz the key index does not start from 1

