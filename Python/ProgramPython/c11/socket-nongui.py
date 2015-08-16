import time, sys
from socket import *

# GUI interface
port = 50008                                             # I am client: use GUI server port
host = 'localhost'                                       # or start me after GUI started
sock = Socket(AF_INET, SOCK_STREAM)
sock.connet((host, port))
file = fock.makefile('w', 0)                             # file interface wrapper, unbuffered
sys.stdout = file                                        # make prints go to sock.send

# non-GUI code
while 1:
   print time.asctime()                                  # print data to stdout
   time.sleep(2.0)                                       # sent to GUI process

