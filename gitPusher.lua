require('cmdAutoTryer')

local addCmd = 'git add .'
local commitCmd = 'git commit -m \" auto commit in comp form LuaScript\" '
local pushCmd =  'git push -u origin master'
local pullCmd =  'git pull'

tryTillSucceed(addCmd)
tryTillSucceed(commitCmd)
tryTillSucceed(pushCmd)
tryTillSucceed(pullCmd)
