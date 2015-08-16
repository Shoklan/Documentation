##############################################
# a Quit button that verifies exit requests;
# to reuse, attach an instance to other GUIs
##############################################

from Tkinter import *                               # get widget classes
from tkMessageBox import askokcancel                # get canned std dialog

class Quitter(Frame):                               # subclass out GUI
   def __init__(self, parent=None):                 # constructor
      Frame.__init__(self, parent)
      self.pack()
      widget = Button(self, text='Quit', command=self.quit)
      widget.pack(side=LEFT)
   def quit(self):
      ans = askokcancel('Verify Exit', "Really Quit?")
      if ans: Frame.quit(self)

if __name__ == '__main__': Quitter().mainloop()

