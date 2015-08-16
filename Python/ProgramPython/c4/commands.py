#!/usr/local/bin/python2.7
from sys import argv
from scanfile import scanner
class UnknownCommand(Exception): pass

def processLine(line):                                           # define a function
   if line[0] == '*':                                             # applied to each line
      print "Ms.", line[1:-1]
   elif line[0] == '+':
      print "Mr.", line[1:-1]                                   # strip first and last char: \n
   else:
      raise UnknownCommand, line

filename = 'data.txt'
if len(argv) == 2: filename = argv[1]                            # allow filename cmd argv
scanner(filename, processLine)                                   # start the scanner
