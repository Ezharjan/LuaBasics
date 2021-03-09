-- read-write
-- defines a factorial function
function fact (n)
    if n == 0 then
    return 1
    else
    return n * fact(n-1)
    end
end
function ioRead()
    print("enter a number:");
    a = io.read("*number");-- read a number
    print(fact(a));
end
 
function ioWrite()
    page = [=[
    <HTML>
    <HEAD>
    <TITLE>An HTML Page</TITLE>
    </HEAD>
    <BODY>
    Lua
    [[a text between double brackets]]
    </BODY>
    </HTML>
    ]=]
    io.write(page)
end


ioRead()
ioWrite()
