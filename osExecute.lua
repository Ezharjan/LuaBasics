local res = os.execute('arp') 
print(res) --- 1 ---- non zero number 操作系统可以调用解析参数
local res2 = os.execute('dir')
print(res2) --- 0 操作系统无法调用解析参数