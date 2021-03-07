require('TesterClass')

a = Tester
a.num = Tester.indexValue

Tester = nil

-- print(a.test())
print(a:safeTest())
print(a.num)