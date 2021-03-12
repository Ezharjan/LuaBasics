print(os.time())
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
print('1: ', math.random(1,100))  --- 第一次执行后获得的总会是相同的数
print('1: ', math.random(1,100))  --- 正常获得随机数
print('1: ', math.random(1,100))
print('1: ', math.random(1,100))