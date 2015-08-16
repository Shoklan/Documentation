import os
print 'set environment'
print os.environ['USER']       # show current shell variable value

os.environ['USER'] = 'Brian'   # runs os.putenv behind the scenes
os.system('python echoenv.py')

os.environ['USER'] = 'Arthur'  # change passed to spawned programs
os.system('python echoenv.py') # and linked in C libraries

os.environ['USER'] = raw_input('?: ')
print os.popen('python echoenv.py').read()


