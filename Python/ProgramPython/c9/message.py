from Tkinter import *
fontstat = ('times', 16, 'italic')                            # added
msg = Message(text="Oh by the way, which one's Pink?")
msg.config(bg='pink', font=fontstat)                          # I prefer the font tuple on its own line
msg.pack()
mainloop()
