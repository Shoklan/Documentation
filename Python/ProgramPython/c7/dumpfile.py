import sys
bytes = open(sys.argv[1], 'rb').read()
print '-'*40
print repr(bytes)

print'-'*40
while bytes:
   bytes, chunk = bytes[4:], bytes[:4]               # show four bytes per line
   for c in chunk: print oct(ord(c)), '\t',
   print

print '-'*40
for line in open(sys.argv[1], 'rb').readlines():
   print repr(line)
