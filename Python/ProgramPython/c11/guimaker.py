###########################################################################
# An extended Frame that makes window menus and toolbars automatically.
# Use GuiMakerFrameMenu for embedded componenets (make frame-based menus).
# UseGuiMakerFrameMenu for top-level windows (makes Tk8.0 window menus).
# See the self-test code (and PyEdit) for an example layout tree format
###########################################################################
import sys                                                             ####
from Tkinter import *                                                  # widget classes
from types   import *                                                  # type constants

class GuiMaker(Frame):
   menuBar    = []                                                     # class defaults
   toolBar    = []                                                     # change per instance in subclass
   helpButton = 1                                                      # set there in start() if need self

   def __init__(self, parent=None):
      Frame.__init__(self, parent)
      self.pack(expand=YES, fill=BOTH)                                 # make frame stretchable
      self.start()                                                     # for subclass: set menu/toolbar
      self.makeMenuBar()                                               # done here: build menu bar
      self.makeToolBar()                                               # done here: build toolbar
      self.makeWidgets()                                               # for subclasses: add middle part

   def makeMenuBar(self):
      """
      make a menubar at the top (Tk8.0 menus below)
      expand=no, fill=x os same width on resize
      """
      menubar = Frame(self, relief=RAISED, bd=2)
      menubar.pack(side=TOP, fill=X)

      for (name, key, items) in self.menuBar:
         mbutton = MenuButton(menubar, text=name, underline=key)
         mbutton.pack(side=LEFT)
         pulldown = Menu(mbutton)
         self.addMenuItems(pulldown, items)
         mbutton.config(menu=pulldown)

      if self.helpButton:
         Button(menubar, text    = 'Help',
                         cursor  = 'gumby',
                         relief  = FLAT,
                         command = self.help).pack(side=RIGHT)

   def addMenuItems(self, menu, items):
      for item in items:                                               # scan nested items list
         if item == 'separator':                                       # string: add separator
            menu.add_separator({})
         elif type(item) == ListType:                                  # list: disabled item list
            for num in item:
               menu.entryconfig(num, state=DISABLED)
         elif type(item[2]) != ListType:
            menu.add_command(label     = item[0],                      # command:
                             underline = item[1],                      # add command
                             command   = item[2])                      # cmd=callable
         else:
            pullover = Menu(menu)
            self.addMenuItems(pullover,  item[2])                      # sublist:
            menu.add_cascade(label     = item[0],                      # make submenu
                             underline = item[1],                      # add cascade
                             menu      = pullover)

   def makeToolBar(self):
      """
      make button bar at bottom, if any
      expand = no, fill=x os same width on resize
      """
      if self.toolbar:
         toolbar = Frame(self, cursor='hand2', relief=SUNKEN, bd=2)
         toolbar.pack(side=BOTTOM, fill=X)
         for (name, action, where) in self.toolbar:
            Button(toolbar, text=name, command=action).pack(where)

   def makeWidgets(self):
      """
      make 'middle' part last, so menu/toolbar
      is always on top/bottom and clipped last;
      override this default, pack middle any side;
      for grid: grid middle part in a packed frame
      """
      name = Label(self,
                   width=40, height=10,
                   relief=SUNKEN, bg='white',
                   text   = self.__class__.__name__,
                   cursor = 'crosshair')
      name.pack(expand=YES, fill=BOTH, side=TOP)

   def help(self):
      """
      override me in subclass
      """
      from tkMessageBox import showinfo
      showinfo('Help', 'Sorry, no help for ' + self.__class__.__name__)

   def start(self): pass                                               # override me in subclass

##########################################################################################################
# For Tk8.0 main window menu bar, instead of a frame
##########################################################################################################
                                                                  ########################################
GuiMakerFrameMenu = GuiMaker                                      # use this for embeded component menus

class GuiMakerWindowMenu(GuiMaker):                               # use this for top-level window menus
   def makeMenuBar(self):
      menubar = Menu(self.master)
      self.master.config(menu=menubar)

      for (name, key, items) in self.menuBar:
         pulldown = Menu(menubar)
         self.addMenuItems(pulldown, items)
         menubar.add_cascade(label=name, underline=key, menu=pulldown)

      if self.helpButton:
         if sys.platform[:3] == 'win':
            menubar.add_command(label='Help', command=self.help)
         else:
            pulldown = Menu(menubar)   # linux needs real pull down
            pulldown.add_command(label='About', command=self.help)
            menubar.add_cascade(label='Help', menu=pulldown)

##########################################################################################################
# Self-test whne file run standalone: 'python guimaker.py'
##########################################################################################################

if __name__ == '__main__':
   from guimixin import GuiMixin                                       # mix in a help method

   menuBar = [
             ('File', 0, 
               [('Open',  0, lambda:0),                                 # lambda:0 is a no-op
                ('Quit',  0, sys.exit)]),                               # use sys, no self here
             ('Edit', 0,
               [('Cut',   0, lambda:0),
                ('Paste', 0, lambda:0)]) ]
   toolBar = [('Quit', sys.exit, {'side': LEFT})]

   class TestAppFrameMenu(GuiMixin, GuiMakerFrameMenu):
      def start(self):
         self.menuBar = menuBar
         self.toolBar = toolBar
   class TestAppWindowMenu(GuiMixin, GuiMakerFrameMenu):
      def start(self):
         self.menuBar = menuBar
         self.toolBar = toolBar
   class TestAppWindowMenuBasic(GuiMakerWindowMenu):
      def start(self):
        self.menuBar = menuBar
        self.toolBar = tooBar                      # guimaker help, not guimixin

root = Tk()
TestAppFrameMenu(Toplevel())
TestAppWindowMenu(Toplevel())
TestAppWindowMEnuBasic(Toplevel())
root.mainloop()
