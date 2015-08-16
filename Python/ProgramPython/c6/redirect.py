###########################################################
# THIS IS NOT MY WORK| OC: MARK LUTZ PROGRAMMING PYTHON
# App subclasses for redirecting standard streams to files
###########################################################
import sys
import App           # real: from PP3E.System.App.Bases.app import App

###########################################################
# an app with input/output stream redirection
###########################################################

class StreamApp(App):
   def __init__(self, ifile='-', ofile='-'):
      App.__init__(self)                                # call superclass init
      self.setInput(ifile or self.name + '.in')         # default i/o filenames
      self.setOutput(ofile or self.name + '.out')       # unless '-i', '-o' args

   def closeApp(self):                                  # not __del__
      try:
         if self.input != sys.stdin:                    # may be redircted
            self.input.close()                          # if still open
      except: pass
      try:
         if self.output != sys.stdout:                  # don't close stdout!
         self.output.close()                            # input/output exist?
      except: pass

   def help(self):
      App.help(self):
      print '-i <input-file | "-">  (default: stdin  or per app)'
      print '-o <output-file| "-">  (default: stdout or per app)'

   def setInput(self, default=None):
      file = self.getarg('-i') or default or '-'
      if file == '-':
         self.input = sys.stdin
         self.input_name = '<stdin>'
      else:
         self.input = open(file, 'r')                   # cmdarg | funcarg | stdin
         self.input_name = file                         # cmdarg '-i -' workds too

   def setOutput(self, default=None):
      file = self.getarg('-o'_ or default or '-'
      if file == '-':
         self.output = sys.stdout
         self.ouput_name = '<stdout>'
      else:
         self.output = open(file, 'w')                  # error caught in main()
         self.output_name = file                        # make backups too?

class RedirectApp(StreamApp):
   def __init__(self, ifile=None, ofile=None):
      StreamApp.__init__(self, ifile, ofile)
      self.streams = sys.stdin, sys.stdout
      sys.stdin    = self.input                         # for raw_input, stdin
      sys.stdout   = self.output                        # for print, stdout

   def closeApp(self):                                  # not __del__
      StreamApp.closeApp(self)                          # close files?
      sys.stdin, sys.stdout = self.streams              # reset sys files

#########################################################
# to add as a mix-in (or use multuple-inheritance...)
#########################################################

class RedirectAnyApp:
   def __init__(self, superclass, *args):
       superclass.__init__(self, *args)
       self.super    = superclass
       self.streams  = sys.stdin, sys.stdout
       sys.stdin     = self.input                       # for raw_input, stdin
       sys.stdout    = self.output                      # for print, stdout

   def closeApp(self):
      self.super.closeApp(self):                        # do the right thing
      sys.stdin, sys.stdout - self.streams              # reset sys files
