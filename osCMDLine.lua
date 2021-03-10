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


-- 打开文件（这个文件保存的是命令dir的结果）
local myfile = io.popen("dir", "r")
if nil == myfile then
    print("open file for dir fail")
end

print("\n======commond dir result:")
-- 读取文件内容
for cnt in myfile:lines() do
    print(cnt)
end

-- 关闭文件
myfile:close()


local secondfile = io.popen("ipconfig")
if nil == secondfile then
    print("open file for ipconfig fail")
end

print("\n======commond ipconfig result:")
-- 读取文件内容
local content = secondfile:read("*a")
print(content)

-- 关闭文件
secondfile:close()

