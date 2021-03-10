local md5 = require "md5"
t = os.time()
print(t)

require('md5')
res1 = md5.sumhexa(tostring(t))
res2 = md5.sum(tostring(t))
res3 = md5.tohex(tostring(t))
print('sumhexa:'..res1)
print('sum:'..res2)
print('tohex:'..res3)