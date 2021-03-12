require'tableLib'

t = {213,324,34,14,25,33,72,33,33,33,33,33,33,33,33,33,2,2,2,2,22,3,45,213}
tt = {    a=213,    b=324,    c=34,    d=14,    d=14,    d=14,    e=72    }
-- X = table.dedup(t,true)
X = table.dedup(tt)
for k, v in pairs(X) do
    print('k:'..k.."; v:"..v)
end

---> if the second parameter is empty, the index will be a mess just like below
--[[
k:1; v:213
k:2; v:324
k:3; v:34
k:4; v:14
k:5; v:25
k:6; v:33
k:7; v:72
k:21; v:22
k:22; v:3
k:17; v:2
k:23; v:45
]]
---> otherwise it is ordered from 1 to n in order just like below
--[[
    k:1; v:213
k:2; v:324
k:3; v:34
k:4; v:14
k:5; v:25
k:6; v:33
k:7; v:72
k:8; v:2
k:9; v:22
k:10; v:3
k:11; v:45
]]