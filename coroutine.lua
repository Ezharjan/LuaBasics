-- Lua does not support multi thread!!!


co = coroutine.create(function()
    for i = 1,10 do
        print(i);
        if(i == 3) then
            coroutine.yield();
        end
        if(i == 5) then
            break ;
        end
    end
end
);

coroutine.resume(co);
print(coroutine.status(co));
coroutine.resume(co);
print(coroutine.status(co));

local xInFunc = nil;
cor = coroutine.create(function()
while true do
    local x = io.read();
    xInFunc = x;
    print('entered:',x);
end
end
);

corChecker = coroutine.create(function()
while true do
    if xInFunc ~= nil then
        print('stop cor');
        coroutine.yield(cor);
    end
end
end);

coroutine.resume(corChecker);
coroutine.resume(cor);
coroutine.status(cor);

--[[
    result:
    1
    2
    3
    suspended
    4
    5
    dead

]]