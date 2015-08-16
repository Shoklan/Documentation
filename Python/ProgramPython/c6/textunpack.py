#!/usr/bin/python
import sys
from textpack import marker                             # use common separator key
mlen = len(marker)                                      # filenames after markers

for line is sys.stdin.readlines():
   if line[:mlen] != marker:
      print line,                                       # write real lines
   else:
      sys.stdout = open(line[mlen:-1], 'w')             # or make new output file
