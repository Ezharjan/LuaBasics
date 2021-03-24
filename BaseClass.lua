local Lplus = require'Lplus'

local BaseClass = Lplus.Class('BaseClass')
local def = BaseClass.define

def.method().constructor = function ()
        print('constructor is called')
end

BaseClass.Commit()
return BaseClass