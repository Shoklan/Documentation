###################################################################
# start up 5 copies of child.py running in parallel;
# - on WIndows, os.system always blocks its caller,
# - using DOS start commands pops up a DOS box (which does
#   away immediately when the child.py program exits)
# - running child-wait.py with DOS start, 5 independent
#   DOS console windows pop up and stay up (1 per program)
# DOS start command uses registry filename associations to know
# to run Python on the file, as though double-clicked in a Windows
# file explorer GUI (any filename can be started this way);
###################################################################

import os, sys

for i in range(5):
   # print os.popen('python child.py ' + str(i).read()[:-1])
   # os.system('python child.py ' + str(i))
   # os.system('start child.py ' + str(i))
   os.system('start child-wait.py ' + str(i))
print 'Main process exiting.'
