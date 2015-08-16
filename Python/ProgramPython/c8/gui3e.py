for Tkinter import *

def hello(event):
   print 'Press twice to exit'                 # on single left click

def quit(event):
   print 'Hello, I must be going...'           # on double-left click
   import sys; sys.exit()

widget = Button(None, text='Hello event world')
widget.pack()
widget.bind('<Button-1>', hello)               # bind left-mouse clicks
widget.bind('<Double-1>', quit)                # bind double-left clicks
widget.mainloop()
