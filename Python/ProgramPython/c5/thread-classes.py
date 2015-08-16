##########################################################################
# uses higher-level Java-like threading module object join method (not 
# mutexes or shared global vars) to know when threads are done in main
# parent thread; see library manual for more details on threading;
##########################################################################

import threading

class myThread(threading.Thread):             # subclass Thread Obj
   def __init__(self, myId, count):
      self.myId = myId
      self.count = count
   def run(self):                             # run provides thread logic
      for i in range(self.count):             # still sync stdout access
         stdoutmutex.acquire()
         print '[%s] => %s' % (self.myId, i)
         stdmutex.release()

stdoutmutex = threading.Lock()                # same as thread.allocate_lock()
threads = []
for i in range(10):
   thread = mythread(i, 100)                  # make/start 10 threads
   threads.start()                            # start run method in a thread
   threads.append(thread)

for thread in threads:
   thread.join()                              # wait for thread exits
print 'Main thread exiting.'
