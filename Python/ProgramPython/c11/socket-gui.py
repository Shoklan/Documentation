import sys, os
from socket     import *
from Tkinter    import *
from guiStreams import GuiOutput

myport = 50008
sockobj = socket(AF_INET, SOCK_STREAM)                      # GUI is server; script is client
sockobj.bind(('', myport))                                  # configure server before client
sockobj.listen(5)
os.startfile('socket-nongui.py')                            # spawn non-GUI on Windows(os.popen)

conn, addr = sockobj.accept()                               # wait for client to connect
sockobj.setblocking(0)                                      # use nonblocking socket

def checkdata():
   try:
      print conn.recv(1024),                                # if ready, show text in GUI window
   except error:                                            # raises socket.error if not ready
      pass                                                  # or message to sys.__stdout__
   root.after(1000, checkdata)                              # check once per second

root = Tk()
sys.stdout = GuiOutput(root)                                # socket text is displayed on this
checkdata()
root.mainloop()
