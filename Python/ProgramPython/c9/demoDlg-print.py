#########################################################################
# same, but show return values of dialog calls; the lambda saves
# date from the local scope to be passed to the handler ( button press
# handlers normally get no arguments) and workds just like a nested def
# statement of this form: def func(key=key): self.printit(key)
#########################################################################
# This class wont work; there is something about demos.py that is wrong

from Tkinter import *                            # get base widget set
from dialogTable import demos                    # button callback handlers

class Demo(Frame):
   def __init__(self, parent=None):
      Frame.__init__(self, parent)
      self.pack()
      Label(self, text='Basic Demos').pack()
      for (key, value) in demos.items():
         func = (lambda: key=key: self.printit(key))
         Button(self, text=key, command=func).pack(side=TOP, fill=BOTH)
      Quitter(self).pack(side=TOP, fill=BOTH)

   def printit(self, name):
      print name, 'returns =>', demos[name]()    # fetch, call, print

if __name__ == '__main__': Demo().mainloop()
