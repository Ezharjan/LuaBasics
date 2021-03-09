local C = {1,2,3,4,5}

local c = {
    __call = function(thisTable,arg1,arg2) ---(1)
        print('this table is --- ' .. tostring(thisTable))
        print('arg1 is:' .. tostring(arg1))
        if(arg2~=nil)then return 'arg2 received!'end
        return 'OK' --- (3)
    end
}

local cc = {
    __call = function(self,index) --- (2)
        return index + 1
    end
}

setmetatable(c,cc)
print(c(20)) ---(2) is called


setmetatable(C,c)
print(C(1)) ---(1) is now also called
print(C(1,2)) ---(1) is now also called