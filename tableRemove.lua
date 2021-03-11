local t = {'alex','jenny','tony','jimmy'}

for key, value in pairs(t) do
    print(key,value)
end

print('-------------------------')

table.remove(t,1)

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
    1       jenny
    2       tony
    3       jimmy
]]