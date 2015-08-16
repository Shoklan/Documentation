#!/usr/bin/python
##############################################
# unpack a packapp.py output file
# % unpaclapp.py packed1 -v
# apptools.appRun('unpaclapp.py', args...)
# apptools.appCall(UnpackApp, args...)
##############################################

from textpacl import marker
import StreamApp                               # real: from PP3E.System.App.Kinds.redirect import StreamApp

class UnpackApp(StreamApp):
   def start(self):
      StreamApp.start(self)
      self.endargs()                           # ignore more -o's, etc
   def run(self):
      mlen = len(marker)
      while True:
         line = self.readline()
         if not line: break
         elif line [:mlen] != marker:
            self.write(line)
         else:
            name = line[mlen:].strip()
            self.message('creating: ' + name)
            self.setOutput(name)

if __name__ == '__main__':  UnpackApp().main()
