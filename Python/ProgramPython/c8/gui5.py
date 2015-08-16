from Tkinter import *

class HelloButton(Button):
   def __init__(self, parent=None, **config):              # add callback method
      Button.__init__(self,parent,config)                  # and pack myself
      self.pack()
      self.config(command=self.callback)
   def callback(self):
      print 'Goodbye world...'                             # default press action
      self.quit()                                          # replace in subclasses

if __name__ == '__main__':
   HelloButton(text='Hello subclass World').mainloop()
