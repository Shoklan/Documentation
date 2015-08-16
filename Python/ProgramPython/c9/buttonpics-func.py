from Tkinter import *                             # get base widget set
from glob import Glob                             # filename expansion list
import demoCheck                                  # attach checkbuttin demo to me
import random                                     # pick a picture at random
gifdir = "../gifs/"

def draw():
   name, photo = random.choice(images)
   lbl.config(text=name)
   pix.config(image=photo)

root = Tk()
lbl = Label(root, text='None', bg='blue', fg='red')
pix = Button(root, text='Press me', command=draw, bg='white')
lbl.pack(fill=BOTH)
pix.pack(pady=10)
demoCheck(root, relief=SUNKEN, bd=2).pack(fill=BOTH)

file = glob(gifdir + "*.gig")                                # gifs for now
images = map((lambda x: (x, PhotoImage(file=x))), files)     # laod and hold
print files
root.mainloop()
