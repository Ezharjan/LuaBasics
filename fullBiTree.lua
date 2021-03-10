function CreateTree(dep)
    local root = {lchild =nil,rchild = nil,parent=nil,seq = 1,dep = 1}
    root.lchild = CreateNode(root,0,dep)
    root.rchild = CreateNode(root,1,dep)
    return root
end


function CreateNode(node,position,dep)
    if node.dep >= dep then
        return
    end 

    local new_node= {parent = node,lchild =nil,rchild =nil,seq = 0,dep = node.dep+1}
    new_node.seq = (position == 0 and node.seq*2 or node.seq*2+1)
    new_node.lchild = CreateNode(new_node,0,dep)
    new_node.rchild = CreateNode(new_node,1,dep)

    return new_node
end

function PrintTree(node)
    --先序列
    io.write(node.seq)
    if node.lchild then
        PrintTree(node.lchild)
    end
    if node.rchild then
        PrintTree(node.rchild)
    end
end

local tree =CreateTree(3)
PrintTree(tree)
print()
