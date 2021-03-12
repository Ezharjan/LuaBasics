local count = 0
function Entry (b) count = count + 1 end
dofile('data')
print('number of entries: ' .. count)

local authors = {}
local dates = {}
function Entry(b) 
    authors[b[1]] = true
    dates[b[4]] = true
end
dofile('data')
for name in pairs(authors) do print(name)end
for name in pairs(dates) do print(name)end

--[[
    result:
    number of entries: 3
    Donald E. Knuth
    Jon Bentley
    Alexander Ezharjan
    1992
    1990
]]