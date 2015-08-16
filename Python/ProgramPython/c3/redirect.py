import sys                                               # get built-in modules

class Output:                                            # simulated output file
   def __init__(self):
      self.text = ''                                     # empty string when created
   def write(self, string):                              # add a string of bytes
      self.text = self.text + string
   def writelines(self, lines):                          # add each line in a list
      for line in lines: self.write(line)

class Input:                                             # simulated input file
   def __init__(self, input=''):                         # default argument
      self.text = input                                  # save string when created
   def read(self, *size):                                # optional arguement
      if not size:                                       # read B bytes, or all
         res, self.text = self.text, ''
      else:
         res, self.text = self.text[:size[0]], self.text[size[0]:]
      return res
   def readline(self):
      eoln = self.text.find('\n')                        # find offset of next eoln
      if eoln == -1:                                     # slice off through eoln
         res, self.text = self.text, ''
      else:
         res, self.text = self.text[:eoln+1], self.text[eoln+1:]
      return res

def redirect(function, args, input):                     # redirect stdin, stdout
   savestream = sys.stdin, sys.stdout                    # run a function object
   sys.stdin  = Input(input)                             # return stdout text
   try:
      function(*args)                                    # was apply(function, args)
   except:
      sys.stderr.write('error in function! ')
      sys.stderr.write("%s, %s\n" % tuple(sys.exc_info()[:2]))
   result = sys.stdout.text                              # no sys.stdout.text anymore?
   sys.stdin, sys.stdout = savestreams
   return result
