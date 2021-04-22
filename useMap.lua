map = require"map"

tab = {}
map.new(tab)

map.insert(tab, 3, 999)
a = map.getValByKey(tab, 3)
print(a)