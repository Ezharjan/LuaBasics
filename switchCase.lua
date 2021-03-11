print "Hello, switch-case"

local switch = {
    [1] = function()    -- for case 1
        print "Case 1."
    end,
    [2] = function()    -- for case 2
        print "Case 2."
    end,
    [3] = function()    -- for case 3
        print "Case 3."
    end
}

local a = 4
local f = switch[a]
if(f) then
    f()
else                -- for case default
    print "Case default."
end