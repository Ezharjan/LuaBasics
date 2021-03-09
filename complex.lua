complex = {}

function complex.new (r, i) return {r=r, i=i} end

-- defines a constant `i'
complex.i = complex.new(0, 1)

function complex.add (c1, c2)
    return complex.new(c1.r + c2.r, c1.i + c2.i)
end

function complex.sub (c1, c2)
    return complex.new(c1.r - c2.r, c1.i - c2.i)
end
function complex.mul (c1, c2)
    return complex.new(c1.r*c2.r - c1.i*c2.i,c1.r*c2.i + c1.i*c2.r)
end

function complex.inv (c)
    local n = c.r^2 + c.i^2
    return complex.new(c.r/n, -c.i/n)
end

function complex.print(c)
    local operator
    if(c.i > 0) then
        if(c.i == 1) then c.i = '' end
        operator = '+' 
    else operator = '' end 
print(c.r .. operator .. c.i .. 'i')
end



myComplex = complex.new(3,-3)
herComplex = complex.new(-5,1)
res = complex.add(myComplex,herComplex)
complex.print(res)