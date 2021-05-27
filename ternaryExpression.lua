local isTrue = true
local isFalse = false
local isNil = nil


function TernaryExpress()
    ---          true       nil          false
    local res0 = isTrue and isNil or isFalse   -- false
    ---          true       false      nil
    local res1 = isTrue and isFalse or isNil   -- nil
    ---          nil        true      false
    local res2 = isNil and isTrue or isFalse   -- false
    ---          nil          true    false
    local res3 = isFalse and isNil or isTrue   -- true
    ---          false        true     nil
    local res4 = isFalse and isTrue or isNil   -- nil
    ---          nil        nil      nil
    local res5 = isNil and isNil or isNil   -- nil
    ---          nil        nil      false
    local res6 = isNil and isNil or isFalse   -- false
    ---          true      true    true    nil
    local res7 = isTrue and "A" and "B" or isNil   -- B
    ---          nil       true    true   true
    local res8 = isNil and "A" and "B" or "C"   -- C
    ---          nil       true    true   true
    local res9 = isNil and "A" and "B" and "C"   -- nil
    ---          false        true    true   true
    local res10 = isFalse and "A" and "B" and "C"   -- false

    return res0, res1, res2, res3, res4, res5, res6, res7, res8, res9, res10
end


local zero = 0 -- true
local emptyString = "" -- true
if zero and emptyString then
    print(TernaryExpress())
end
