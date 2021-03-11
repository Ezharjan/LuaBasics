--读取指定文件
function getFile(fileName)
    local f = assert(io.open(fileName, 'r'))
    local string = f:read("*all")
    f:close()
    return string
end

local str = getFile('./data')
print(str)