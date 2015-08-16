import Tkinter
from Tkinter import Tk, Button
Tkinter.NoDefaultRoot()

win1 = Tk()                                          # two indpenedent root windows
win2 = Tk()

Button(win1, text='Spam', command=win1.destory).pack()
Button(win2, text='SPAM', command=win2.destory).pack()
win1.mainloop()
