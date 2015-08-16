##########################################################
# 4 demo class components (subframes) on one window;
# there are 5 Quitter buttons on this one window too;
# GUIs can be reused a frames, windows, processes;
##########################################################

from Tkinter import *
from quitter import Quitter
demoModules = ['demoDlg', 'demoCheck', 'demoRadio', 'demoScale']
parts = []

def addComponents(root):
   for demo in demoModules:
      module = __import__(demo)                             # import by name strin
      part = module.Demo(root)                              # attach an instance
      part.config(bd=2, relief=GROOVE)
      part.pack(side=LEFT, fill=BOTH)
      parts.append(part)

def dumpState():
   for part in parts:                                       # run report if any
      print part.__module__ + ':',
      if hasattr(part, 'report'):
         part.report()
      else:
         print 'None'

root = Tk()
Label(root, text='Multiple Frame demo', bg='white').pack()
Button(root, text='States', command=dumpState).pack(fill=X)
Quitter(root).pack(expand=YES, fill=X)
addComponents(root)
mainloop()
