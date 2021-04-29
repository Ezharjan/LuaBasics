--[[
    分离字符：将每个字符分离出来，放到table中，一个单元内一个字符
]]
function StringToTable(s)
    local tb = {}

    --[[
    UTF8的编码规则：
    1. 字符的第一个字节范围： 0x00—0x7F(0-127),或者 0xC2—0xF4(194-244); UTF8 是兼容 ascii 的，所以 0~127 就和 ascii 完全一致
    2. 0xC0, 0xC1,0xF5—0xFF(192, 193 和 245-255)不会出现在UTF8编码中 
    3. 0x80—0xBF(128-191)只会出现在第二个及随后的编码中(针对多字节编码，如汉字) 
    ]]
    for utfChar in string.gmatch(s, "[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(tb, utfChar)
    end

    return tb
end


--[[
    计算字符数：获取字符串长度，设一个中文长度为2，其他长度为1。
    获取指定字符个数的字符串的实际长度，设一个中文长度为2，其他长度为1，count:-1表示不限制。
]]
function GetUTFLen(s)
    local sTable = StringToTable(s)

    local len = 0
    local charLen = 0

    for i=1,#sTable do
        local utfCharLen = string.len(sTable[i])
        if utfCharLen > 1 then -- 长度大于1的就认为是中文
            charLen = 2
        else
            charLen = 1
        end

        len = len + charLen
    end

    return len
end

function GetUTFLenWithCount(s, count)
    local sTable = StringToTable(s)

    local len = 0
    local charLen = 0
    local isLimited = (count >= 0)

    for i=1,#sTable do
        local utfCharLen = string.len(sTable[i])
        if utfCharLen > 1 then -- 长度大于1的就认为是中文
            charLen = 2
        else
            charLen = 1
        end

        len = len + utfCharLen

        if isLimited then
            count = count - charLen
            if count <= 0 then
                break
            end
        end
    end

    return len
end

--[[
    截取指定长度：截取指定字符个数的字符串，超过指定个数的，截取，然后添加。
]]
function GetStringFromUTF(s, maxLen)
    local len = GetUTFLen(s)

    local dstString = s
    -- 超长，裁剪，加...
    if len > maxLen then
        dstString = string.sub(s, 1, GetUTFLenWithCount(s, maxLen))
        dstString = dstString.."..."
    end

    return dstString
end

--[[
    之所以上面所有的都是设一个中文长度为2，其他长度为1，是因为需要将文字显示在指定宽度的区域内，而显示时，一个中文的宽度约等于2个其他字符的宽度，所以做上述设定。
    如果要1个中文字符长度为1，只需要修改为 charLen = 1 。
]]

--------------------------------------------

--获取中英混合UTF8字符串的真实字符数量
function SubStringGetTotalIndex(str)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat 
        lastCount = SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(lastCount == 0);
    return curIndex - 1;
end

function SubStringGetTrueIndex(str, index)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat 
        lastCount = SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(curIndex >= index);
    return i - lastCount;
end

--返回当前字符实际占用的字符数
function SubStringGetByteCount(str, index)
    local curByte = string.byte(str, index)
    local byteCount = 1;
    if curByte == nil then
        byteCount = 0
    elseif curByte > 0 and curByte <= 127 then
        byteCount = 1
    elseif curByte>=192 and curByte<=223 then
        byteCount = 2
    elseif curByte>=224 and curByte<=239 then
        byteCount = 3
    elseif curByte>=240 and curByte<=247 then
        byteCount = 4
    end
    return byteCount;
end


function SubStringUTF8(str, startIndex, endIndex)
    if startIndex < 0 then
        startIndex = SubStringGetTotalIndex(str) + startIndex + 1;
    end

    if endIndex ~= nil and endIndex < 0 then
        endIndex = SubStringGetTotalIndex(str) + endIndex + 1;
    end

    if endIndex == nil then 
        return string.sub(str, SubStringGetTrueIndex(str, startIndex));
    else
        return string.sub(str, SubStringGetTrueIndex(str, startIndex), SubStringGetTrueIndex(str, endIndex + 1) - 1);
    end
end
