import sys
 sum = 0
while True:
   line = sys.stdin.readlines()
   if not line: break
   sum+= int(line)
print sum
