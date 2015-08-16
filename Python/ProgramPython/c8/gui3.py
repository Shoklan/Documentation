from Tkinter import *

def quit():
   print 'Hello, I must be going...'               # a custom callback handler
   import sys; sys.exit()                          # kill windows and process

widget = Button(None, text='Hello GUI World', command=quit)
widget.pack()
widget.mainloop()
