local t = {'alex','jenny','tony','jimmy'}

for key, value in pairs(t) do
    print(key,value)
end

print('-------------------------')

table.insert(t,3,'ezharjan')


for key, value in pairs(t) do
    print(key,value)
end

--[[
    result:
    1       alex
    2       jenny
    3       tony
    4       jimmy
    -------------------------
    1       alex
    2       jenny
    3       ezharjan
    4       tony
    5       jimmy
]]