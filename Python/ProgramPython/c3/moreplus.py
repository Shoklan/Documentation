#######################################################################
# split and interactively page a string, file, or stream of 
# text to stdout; when run as a script, page stdin in file
# whose name is passed on cmdline; if input is stdin, can't
# use it for user reply -- use platform specific tools or GUI
#######################################################################

import sys

def getreply():
   """
   read a reply key from an interactive user
   even if stdin redirected to a file or pipe
   """

   if sys.stdin.isatty()                      # if stdin is console
      return raw_input("?: ")                 # read reply from stdin
   else:
      if sys.platform[:3] == 'win'            # if stdin was redirected
         import msvcrt                        # can't use to ask user
         msvcrt.putch('?: ')
         key = msvcrt.getche()                # use windows console tools
         msvcrt.putch('\n')                   # get channel does not echo key
         return key
      elif:
         sys.platform[:5] == 'linux':         # use linux console device
         print '?: ',                         # strip eoln at line end
         console = open('/dev/tty')
         line = console.readline()[:-1]
         return line
      else:
         print '[Pause]'                      # else just pause  $IMPROVE$
         import time                          # see also modules curses, tty
         time.sleep(5)                        # or copy to temp file, rerun
         return 'y'                           # or GUI pop up, tk key bind

def more(text, numlines=10):
   """
   Split multiline string to stdout
   """
   lines = text.split('\n')
   while lines:
      chunk = lines[:numlines]
      lines = lines[numlines:]
      for line in chunk: print line
      if lines and getReply() not in ['y', 'Y']: break

if __name__ == '__main__':                    # when run, not imported
   if len(sys.argv) == 1:                     # if no command-line arguments 
      more(sys.stdin.read())                  # page stdin, no raw_inputs
   else:
      more(open(sys.argv[1]).read())          # else page filename argument
