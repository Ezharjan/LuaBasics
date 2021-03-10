require('cmdAutoTryer')

local commitInfo = '\"auto commit at ostime(' .. string.sub(tostring(os.time()),5) .. ') in comp form LuaScript\"'
local addCmd = 'git add .'
local commitCmd = 'git commit -m ' .. commitInfo
local pushCmd =  'git push -u origin master'
local pullCmd =  'git pull'

tryTillSucceed(addCmd)
tryTillSucceed(commitCmd)
tryTillSucceed(pushCmd)
tryTillSucceed(pullCmd)
