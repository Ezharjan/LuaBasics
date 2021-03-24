local Lplus = require'Lplus'
local BaseClass = require 'BaseClass'

local ChildClass =  Lplus.Extend(BaseClass, 'ChildClass')
local def = ChildClass.define

def.static('=>', ChildClass).Instance = function ()
    if not m_Instance then
        m_Instance = ChildClass()
    end
    return m_Instance
end


def.method('string').showMsg = function(self,msg)
    print(msg)
end

def.method('number','=>','boolean').isOddNumber = function (self,num)

    return (num / 2)
end

ChildClass.Commit()
return ChildClass
