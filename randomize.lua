math.randomseed(os.time())
r = math.random(1,100) --- always the same
r = math.random(1,100) --- real random number
print(r)

function Sleep(n)
    local t0 = os.clock()
    while os.clock() - t0 <= n do end
end

-- function Sleep(n)
--     if n > 0 then
--         os.execute('ping -n ' .. tonumber(n + 1) .. 'localhost > NULL')
--     end
-- end



math.randomseed(os.time())
Sleep(1)
math.randomseed(os.time())
print('1: ', math.random(1,100))
print('1: ', math.random(1,100))
print('1: ', math.random(1,100))
print('1: ', math.random(1,100))