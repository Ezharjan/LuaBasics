--[[
    lua使用自动内存管理机制，通过垃圾回收器来回收内存
    垃圾回收器只能回收它认为是垃圾的内容，而不能回收用户认为是垃圾的内容
    典型的例子栈，栈一般用一个数组和一个表示顶部的索引值表示
    如果弹出一个元素，那么仅是把栈顶索引减一，
    但这个元素还留在内存在被这栈数组引用着，所以垃圾回收器不知道它是垃圾
    全局变量和table里的内容会被垃圾回收器回收，只能手动置为nil
    因此需要一种与回收器可以协作的机制，这就是弱引用（weak reference）
    lua里用弱引用table(weak table)来实现这个机制
    3种弱引用table
        1.具有弱引用key的table
        2.具有弱引用value的table
        3.同时具有弱引用key和弱引用value的table
    无论是哪种类型的弱引用table，只要有一个key或value被回收了
    那么他们所在的整个条目都会从table中删除
    table的弱引用类型通过其元表中的__mode字段来决定，这个字段是一个字符串
       1.__mode字段中如果包含"k"则是key的弱引用
       2.__mode字段中如果包含"v"则是value的弱引用
       3.__mode字段中包含"k"和"v"则是key、value的弱引用
]]

a = {}
b = {}
setmetatable(a, b)
b.__mode = "k" -- now 'a' has weak keys

key = {} -- creates first key, type should be table
a[key] = 1
key = {} -- creates second key
a[key] = 2
collectgarbage() -- forces a garbage collection cycle, delete this line to see the 2 values in a
for k, v in pairs(a) do print(v) end --> 2, only one value


print('**********************************************')





t = {a = 33,b = 44,c = 56,d = 77,e = 88, f = 99}

mt = {
    __mode = 'k',
    __index = function (_, n)
        error("attempt to read undeclared variable "..n, 2)
    end,
}

setmetatable(t,mt)

-- t.a = nil

print('value of a is: ' .. tostring(t.a))

for k,v in pairs(t) do
    print('k: ' .. tostring(k) .. '; v:' .. tostring(v))
end




print('**********************************************')


t1, t2 = {}, {}

arr = {}
arr[1] = t1
arr[2] = t2


setmetatable(arr, {__mode = "v"})  --- weaken the value

t1 = nil --此时我们将t1赋值为nil，表明这一部分的内容我们不需要再使用，可以被回收

collectgarbage()    --  手动执行gc回收操作

for k, v in pairs(arr) do
    print(k, v)
end

--[[
    result:
    2
    **********************************************
    value of a is: 33
    k: a; v:33
    k: c; v:56
    k: b; v:44
    k: e; v:88
    k: d; v:77
    k: f; v:99
    **********************************************
    2       table: 00DE9DE0
]]