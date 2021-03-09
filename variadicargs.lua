function foldr(f, ...)
    if select('#', ...) < 2 then return ... end
    local function helper(x, ...)
        if select('#', ...) == 0 then
          return x
        end
        return f(x, helper(...))
    end
    return helper(...)
end

function sum(a, b)
    return a + b
end

res = foldr(sum, 1, 2, 3, 4)
print(res)  --> 10