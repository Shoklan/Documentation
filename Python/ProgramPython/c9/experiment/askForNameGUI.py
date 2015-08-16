###################################################################################
# pop uo three new windows, with style
# destroy() kills one window, quit() kill all windows and app; top-level
# windows have title, icon, iconify/deconify and protocol for wm events;
# there always is an app root window, whether by default or created as an
# explicit Tk object; alll top-level windows are containers, but never
# packed/gridded; Toplevel is like frame, but new windows, and can have menus;
###################################################################################

from Tkinter import *
from tkSimpleDialog import askstring

def getName():
   label = askstring('Would you kindly', 'Enter your name?: ')
   root.title(label)

root = Tk()                                                      # exlicit root
name = 'Phillip'

# win = Toplevel(root) 
# win.title(name) 


msg = Button(root, text=name, command=getName)
msg.pack(expand=YES, fill=BOTH)
msg.config(padx=10, pady=10, bd=10, relief=RAISED)
msg.config(bg='black', fg='white', font=('times', 30, 'bold italic'))

root.mainloop()
