root = nil

function  insert_node(number)
    if root == nil then
        root = {value = number, left = nil, right = nil, parent = nil}
    else
        q = root
        r = nil
        while q ~= nil do
            r = q
            if q.value > number then
                q = q.left
            elseif q.value < number then
                q = q.right
            else
                return
            end
        end
        if r.value > number then
            r.left = {value = number, left = nil, right = nil, parent = r}
        else
            r.right = {value = number, left = nil, right = nil, parent = r}
        end
    end
end

function  find_node(p, number) 
    while p ~= nil do
        if p.value == number then
            return p
        elseif p.value > number then
            p = p.left
        else
            p = p.right
        end
    end
    return p
end

function  delete_node(number) 
    p = find_node(root, number)
    if p == nil then
        print ("can\'t find " .. number)
        return
    end
    real_del = nil
    if p.left == nil or p.right == nil then
        real_del = p
    else
        q = p.right
        r = nil
        while q ~= nil do
            r = q
            q = q.left
        end
        real_del = r
    end
    child = nil
    if real_del.left ~= nil then
        child = real_del.left
    else
        child = real_del.right
    end
    if child ~= nil then
       child.parent = real_del.parent
    end
    if real_del.parent == nil then
        root = child
    else
        if real_del.parent.left == real_del then
            real_del.parent.left = child
        else
            real_del.parent.right = child
        end
    end
    if real_del ~= p then
        p.value = real_del.value
    end
    real_del = nil
end

function  pre_order(p)
    if p ~= nil then
        print (p.value)
        pre_order(p.left)
        pre_order(p.right)
    end
end

function  in_order(p)
    if p ~= nil then
        in_order(p.left)
        print (p.value)
        in_order(p.right)
    end
end

function  post_order(p)
    if p ~= nil then
        post_order(p.left)
        post_order(p.right)
        print (p.value)
    end
end

function  pre_order_no_rec(p)
    stack = {}
    while p ~= nil or #stack ~= 0 do
        if p == nil then
            p = stack[#stack]
            stack[#stack] = nil
        end
        print (p.value)
        if p.right ~= nil then
            stack[#stack + 1] = p.right
        end
        p = p.left
    end
end

function  in_order_no_rec(p)
    stack = {}
    while p ~= nil or #stack ~= 0 do
        if p == nil then
            p = stack[#stack]
            stack[#stack] = nil
            print (p.value)
            p = p.right
        else
            stack[#stack + 1] = p
            p = p.left
        end
    end
end

function  post_order_no_rec(p) 
    stack = {}
    while p ~= nil do
       stack[#stack + 1] = {node = p, status = 0}
       p = p.left
    end
    while #stack ~= 0 do
        p = stack[#stack]
        if p.node.right == nil or p.status == 1 then
            print (p.node.value)
            stack[#stack] = nil
        else
            p = p.node.right
            stack[#stack].status = 1
            while p ~= nil do
                stack[#stack + 1] = {node = p, status = 0}
                p = p.left
            end
        end
    end
end


array = {5, 3, 2, 4, 7, 6, 8}

i = 1

while i <= #array do
    insert_node(array[i])
    i = i + 1
end

print ("--------pre order---------")
pre_order(root)
print ("--------------------------")

print ("-------in order-----------")
in_order(root)
print("---------------------------")

print ("-------post order---------")
post_order(root)
print ("--------------------------")

print ("-----pre order no rec-----")
pre_order_no_rec(root)
print ("--------------------------")

print ("-----in order no rec------")
in_order_no_rec(root)
print ("--------------------------")

print ("---post order no rec------")
post_order_no_rec(root)
print ("--------------------------")

delete_node(3)

pre_order(root)