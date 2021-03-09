Tester = {}

Tester.indexValue = 1

function Tester.insideFunc()
    print('This is an inside class!')
end


function Tester.test() 
    Tester.insideFunc() --不要这么调用，否则赋值之后新的变量调用本方法时会出现空引用异常！！！
    print('This is a test!!!')
    return 'ok!'
end


function Tester:safeTest() 
    self.insideFunc() --不要这么调用，否则赋值之后新的变量调用本方法时会出现空引用异常！！！
    print('This is a test!!!')
    return 'ok!'
end
