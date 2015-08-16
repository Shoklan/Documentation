import sys, glob
from fixeoln_one import convertEndLines
listonly = 0
patts ['*.py', '*.pyw', '*.txt', '*.cgi', '*.html',            # text filenames
       '*.c', '*.cxx', '*.h', '*.i', '*.out',                  # in this package
       'README*', 'makefile*', 'output*', '*.note']

if __name__ == '__main__':
   errmsg = 'Required first argument missing: "todos" or "tounix"'
   assert (len(sys.argv) >= 2 and sys.argv[1] in ['todos', 'tounix']), errmsg

   if len(sys.argv) > 2:                                     # glob anyhow: '*' not applied on Dos
      patts = sys.argv[2:]                                   # though not really needed on Linux
   filelists = map(glob.glob, patts)                         # name matches in this dir only

   count = 0
   for list in filelists:
      for fname in list:
         if listonly:
            print count+1, '=>', fname
         else:
            convertEndLines(sys.argv[1], fname)
         count += 1

   print 'Visited %d files' % count
