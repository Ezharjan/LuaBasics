local Lplus = require'Lplus'

local MyClass =  Lplus.Class('MyClass')
local def = MyClass.define


def.static("=>", MyClass).Instance = function ()
    if not m_Instance then
        m_Instance = MyClass()
    end
    return m_Instance
end

-- parameter 'self' should not be passed but to call this method by ':'
def.method("string").showMsg = function(self,msg)
    print(msg)
end


MyClass.Commit()
return MyClass
