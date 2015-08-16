#######################################################################
# implementing a web server in Python that knows how to run a server-
# side CGI scripts; serves files/scripts from current working dir;
# Python scripts must be stored in webdir\cgi-bin or webdir\htbin;
#######################################################################

webdir = '.'     # where you html files and cgi-bin script directory live
port   = 80      # default http://localhost/, else use http://localhost:xxxx/

import os, sys
from BaseHTTPServer import HTTPServer
from CGIHTTPServer  import CGIHTTPRequestHandler

# hack for windows: os.environ not propagated
# to subprocess by os.popen2, force in-process
if sys.platform[:3] == 'win':
   CGIHTTPRequestHandler.have_popen2 = False
   CGIHTTPRequestHandler.have_popen3 = False

os.chdir(webdir)           # run in web root dir
srvraddr = ("", port)
srvrobj = HTTPServer(srvraddr, CGIHTTPRequestHandler)
srvrobj.serve_forever()    # run as perpetual daemon

