Set = {}
function Set.somFunc()
    print('somFunc is called!')
end


function Set:show()
    self.somFunc()
    -- Set.somFunc() -- unsafe
    print('show func is also called')
end


a = Set
Set = nil
a:show()
