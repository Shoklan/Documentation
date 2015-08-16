gifdir = "../gifs/"                                  # Note: I do not have this; don't run
from Tkinter import *
win = Tk()
igm = PhotoImage(file=gifdir+"ora-pp.git")
Button(win, image=igm).pack()
win.mainloop()
