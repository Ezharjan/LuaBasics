--[[
    ymax 要映射的目标区间最大值
    ymin 要映射的目标区间最小值
    xmax 目前数据最大值
    xmin 目前数据最小值
    num  假设目前数据中的任一值
    res  归一化映射后的值
    ref: https://blog.csdn.net/willduan1/article/details/80448493
]]
function normalize(num,xMin,yMin,xMax,yMax)
    local res = 0
    local numerator = yMax-yMin
    local denominator = xMax - xMin
    local k = num - xMin
    res = yMin + k * numerator/denominator
    return res
end



function test()
    for i = 1985, 320, -5 do
        print(normalize(i,320,0,1985,-45))
    end
end

test()