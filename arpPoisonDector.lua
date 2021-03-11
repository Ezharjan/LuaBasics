--[[
    原理：其中如果存在多条与网关IP相对应的MAC地址时，表明局域网存在ARP攻击。
    运行平台：Windows （其他平台需要根据arp -a输出情况更改getARPMap函数中
    关于解析每一行字符串时获取的关键信息的索引号。）
    by Alexander Ezharjan; 11th March, 2021.
]]

require'stringLib'
require'tableLib'


function getARPMap(resFileObj)
    local result = {}
    local lineNum = 0
    for eachlineContent in resFileObj:lines('*a') do
        lineNum = lineNum + 1
        if lineNum > 2 then
            local eachline = string.split(string.trim(eachlineContent),' ')
            local dedupedEachLineTable = table.dedup(eachline,true)
            -- print(table.concat(dedupedEachLineTable)) -- test
            ---- IP as key while MAC is value
            result[dedupedEachLineTable[1]] = dedupedEachLineTable[3]
        end
    end
    -- return result ---- as a simple fake test
    return table.dedup(result,false)
end



function detectARPPoison()
    local arpMap = {}
    local res = io.popen('arp -a')
    local info = res:read('*l')

    if info==nil then
        print('Info is null, please check the argument.')
    else
        arpMap = getARPMap(res)
        -- table.showKVPairs(arpMap)
        -- table.showLength(arpMap)
        local suspectors = table.getRedundantValues(arpMap)
        if table.getLength(suspectors) == 0 then
            print('There is no ARP attack in current net environment.')
        else
            print('Being attacked!\nSuspected hosts are listed below: \n')
            table.showKVPairs(suspectors) -- show suspectors on console
        end
    end
end


detectARPPoison()
