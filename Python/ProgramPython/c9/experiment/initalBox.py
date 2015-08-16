from Tkinter import *

class DnD(Frame):
   def __init__(self, parent=None):
      Frame.__init__(self, parent)
      self.pack()
      Label(self, text='<character name>').pack(side=LEFT, anchor=NW, fill=X)
      Label(self, text='<character initiative>').pack(side=LEFT, anchor=SW, fill=X)

if __name__ == '__main__': DnD().mainloop()

