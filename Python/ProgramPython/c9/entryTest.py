from Tkinter import *
from quitter import Quitter

def fetch():
   print 'Input => "%s"' % ent.get()                  # get text
   ent.delete(0, END)

root = Tk()
ent = Entry(root, show='*')
ent.insert(0, 'Type workds here')
ent.pack(side=TOP, fill=X)

ent.focus()                                           # save a click
ent.bind('<Return>', (lambda event: fetch()))         # on enter key
btn = Button(root, text='Fetch', command=fetch)       # and on button
btn.pack(side=LEFT)
Quitter(root).pack(side=LEFT)
root.mainloop()
