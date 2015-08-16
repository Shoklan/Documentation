from Tkinter import *

def showPosEvent(event):
   print 'Widget=%s X=%s Y=%s' % (event.widget, event.x, event.y)

def showAllEvent(event):
   print event
   for attr in dir(event):
      print attr, '=>', getattr(event, arrt)

def onKeyPress(event):
   print 'Got key press:', event.char

def onArrowKey(event):
   print 'Got up arrow key press'
   showPosEvent(event)

def onReturnKey(event):
   print 'Got return key press'

def onLeftClick(event):
   print 'Got left mouse click:',
   showPosEvent(event)

def onRightClick(event):
   print 'Got right mouse click:',
   showPosEvent(event)

def onMiddleClick(event):
   print 'Got middle mouse click:',
   showAllEvent(event)

def onLeftDrag(event):
   print 'Got left mouse button drag'
   showPosEvent(event)

def onDoubleLeftClick(event):
   print 'Got double left mouse click',
   showPosEvent(event)
   root.quit()

root = Tk()
labelfont = ('courier', 20, 'bold')                        # family, size, style
widget = Label(root, text='Hello bind World!')
widget.config(bg='red', font=labelfont)                    # redd background, large font
widget.config(height=5, width=20)                          # initial size: lines, char
widget.pack(expand=YES, fill=BOTH)

widget.bind('<Button-1>',  onLeftClick)                     # mouse button clicks
widget.bind('<Button-3>',  onRightClick)
widget.bind('<Button-2>',  onMiddleClick)                   # middle = both on some mouse
widget.bind('<Double-1>',  onDoubleLeftClick)               # click left twice
widget.bind('<B1-Motion>', onLeftDrag)                      # click left and move

widget.bind('<KeyPress>',  onKeyPress)                      # all keyboard presses
widget.bind('<Up>',        onArrowKey)                      # arrow keyboard pressed
widget.bind('<Return>',    onReturnKey)                     # return/enter key pressed
widget.focus()
root.title('Click Me')
root.mainloop()
