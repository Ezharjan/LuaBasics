function string.trim(str)
    return (str:gsub("^%s*(.-)%s*$", "%1"))
end

function string.split(str, separator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
       local nFindLastIndex = string.find(str, separator, nFindStartIndex)
       if not nFindLastIndex then
        nSplitArray[nSplitIndex] = string.sub(str, nFindStartIndex, string.len(str))
        break
       end
       nSplitArray[nSplitIndex] = string.sub(str, nFindStartIndex, nFindLastIndex - 1)
       nFindStartIndex = nFindLastIndex + string.len(separator)
       nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end

-- 字符串替换【不执行模式匹配】
-- str       源字符串
-- pattern 匹配字符串
-- repl    替换字符串
--
-- 成功返回替换后的字符串，失败返回源字符串
string.replace = function(str, pattern, repl)
    local i,j = string.find(str, pattern, 1, true)
    if i and j then
        local ret = {}
        local start = 1
        while i and j do
            table.insert(ret, string.sub(str, start, i - 1))
            table.insert(ret, repl)
            start = j + 1
            i,j = string.find(str, pattern, start, true)
        end
        table.insert(ret, string.sub(str, start))
        return table.concat(ret)
    end
    return str
end




---- tests
-- local strrrr = "alexcander Ezharjan"
-- print(string.replace(strrrr,'alexcander','Alexander'))