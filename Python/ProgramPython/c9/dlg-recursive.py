from Tkinter import *

def dialog():
   win = Toplevel()                                               # make a new window
   Label(win, text='Hard Drive Reformated!').pack()               # add a few widgets
   Button(win, text='OK', command=win.quit).pack()                # set quit callback
   win.protocol('WM_DELETE_WINDOW', win.quit)                     # quit on wm_close too!

   win.focus_set()                  # take over input focus
   win.grab_set()                   # disable other windows while I'm open
   win.mainloop()                   # and start a nested event loop to wait
   win.destroy()
   print 'Dialog Exit'

root = Tk()
Button(root, text='popup', command=dialog).pack()
root.mainloop()
