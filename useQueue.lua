require'queue'
local queue = require "queue"

myQ = queue.new()
myQ.offer(myQ, 99)
myQ.offer(myQ, 88)
myQ.offer(myQ, 77)

print(myQ.poll(myQ)) -- 99
print(myQ.poll(myQ)) -- 88
print(myQ.poll(myQ)) -- 77
print(myQ.poll(myQ)) -- nil
print(myQ.tail(myQ)) -- nil

myQ.offer(myQ,22)
myQ.offer(myQ,33)
myQ.offer(myQ,44)
myQ.offer(myQ,55)

print(myQ.iter(myQ)()) -- 22
print(myQ.clear(myQ))
print(myQ.tail(myQ)) -- nil
print(myQ.poll(myQ)) -- nil
print(myQ.size(myQ)) -- 0
myQ.submit(myQ,1,999)
print(myQ.tail(myQ)) -- nil

myQ.offer(myQ,55)
myQ.submit(myQ,1,999)
print(myQ.tail(myQ)) -- 999
