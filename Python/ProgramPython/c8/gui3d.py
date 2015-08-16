from Tkinter import *

class HelloCallable:
   def __init__(self):                  # __init_ run on class creation
      self.msg = 'Hello __call__ world'
   def __call__(self):
      print self.msg                    # __call__ run alter when called
      import sys; sys.exit()            # class object looks like a function

widget = Button(None, text='Hello event world', command=HelloCallable())
widget.pack()
widget.mainloop()
