from Tkinter import *
root = Tk()
labelfont = ('times', 20, 'bold')                         # family, size, style
widget = Label(root, text='Hello config world')
widget.config(bg='black', fg='yellow')                    # yellow text on black label
widget.config(font=labelfont)                             # use a larger font
widget.config(height=3, width=20)                         # initial size: lines, chars
widget.config(bd=10, relief=GROOVE)                       # I added this one to try out different
widget.pack(expand=YES, fill=BOTH)                        # border styles
root.mainloop()
