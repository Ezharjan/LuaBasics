-- local res = os.execute('git pull')

-- local r = io.popen('node -v')
local r = io.popen('git add .')
res = r:read('*a')
print('res is ' .. tostring(res)) --- 1 or a nonzero number

if res ~= nil then
    print('not nil') --- always not nil!
end

if res ~= '' then
    print('res is not empty') --- ok, cout when the executio is not successful
end