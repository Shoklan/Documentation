######################
# Programming Python #
######################
This project is for learning more advanced ideas associated with Python.
The source material is  "Programming Python" - Mark Lutz ISBN-13: 978-0-596-00925-0

{2013/02/15} Currently sitting in the middle of chapter 2. I was missing the
             Tkinter library on my laptop; it seems like it is not included
             with the linux install for Fedora

{2013/02/18} Beginning Chapter 3; seems like the website and scripts were not
             working properly. Still more interested in moving on. Especially,
             since the book's going to do more than just give me basic code
             examples beyond copy paste. Let's get to the good stuff.

{2013/02/20} So, I've gotton to the part talking about the command line
             utilities and built in functions. I'll probably write a python script
             to add all the files from a directy to the current Git repo, ask for
             the commit name, then attempt to push to the server. That should make
             life a lot easier for updating.

{2013/02/21} gitCommit.py is working so far. I don't have access to the Internet though,
             so I have to wait and ensure passing the ssh password works online. Adding
             the script to PATH would be easier so I can run it at anytime. I may
             even edit it so that it will accept the GIT repo name. This way it
             can full commit any repo in ~/Code dir. (Linux 0nly)

             Annoyingly, it seems the books age did end up causing me one problem;
             sys.stdout.text no longer exists in Python 2.7. So, the Stream
             examples don't seem to work. I'll still add them with the repo for
             completion sake.

             It's also cool to see Functional Programming Paradigms being added
             to the Imperative Paradigm: list comprehensions, no type declarations
             (heh I don't remember the name XD), and lambda expressions. That
             work with Haskell and Scala isn't leaving me disappointed yet.
             [Haskell still better :> ]

             Started chapter 4 now, and it's pretty unimpressive. I find Glob to be
             interesting, but lots of material is dry. The os.path.walker module seems
             like it has potential. Mark talks about writing our own walker and
             I hope it's done. I may be able to write my own though. So, if he dodges
             out I'll code up one anyway.

{2013/02/22} I've started my journey again. The book did end up writing the walker
             which is nice. Python really is a nice language to work in; the code
             really is straightforward to read. And, upon finishing the chapter I'm
             not that impressed. It's important to go over basics, but I feel like
             there is something more useful that can be done with the walkers.
             You can obviously apply any function imaginable using the code. This
             feels more completist than informative with the chapter. At least I
             gained find.py since the Python Standard Library doesn't include it
             anymore.

             Chapter 5 is already starting to look awesome though. I don't know
             much about multithreading but I will soon.
             Or not. It's about forks and Parallel Processing which is not really
             the same thing. I picked up a bit about this stuff from "Hacking: The
             Art of Exploitation" by Jon Erickson. Another wonderful book full of
             code and concepts. *** Note: Add code from that book to GitHub    ***************
             I lied: discussing threads now. Mark points out that threads are
             great for GUI programs just as I thought. So, maybe there is a future
             in this yet :D . Or, I'm wrong again. We're not talking about true
             multithreading when it comes to CPUs.

{2013/02/24} I attempted to use my program and it failed pretty badly. Amusingly,
             the commit worked since after the program crashed the command was
             still passed via the system and I can still update. But, that
             is not helpful. Still needs some work, but I don't have time to
             play with it today. Too much else to worry about.

{2013/02/26} Work and interviews keeping me busy; not it's back to coding. Threads
             do seem interesting, but I don't find them all the useful. I am
             probably being uncreative though. Perhaps I can run multiple threads
             for the GUI I'll be building. That way, if they're searching or
             adding combatents it wont freeze the window. Only another 83 pages
             until I'm working on the GUI portion. That, really, is the part I
             need the most work on.

             Note that the threading class requires a run method. It MUST have one.

{2013/02/27} Atomic = Thread safe [Vocab].
             Sum up: Threads are different in that they share memory with the main
             program instead of parallel processes that get a copy, then retain
             their memory seperate. He's really pushing that idea hard lol.

{2013/02/28} I finally got pipes.py working. Way to many typos from not paying attention.
             I'll need to get some music that wont distract me while I'm coding.
             [Important] There are three ways to stop deadlock:
             1] use flush() calls
             2] use an unbuffered pipe
             3] set flag -u when calling Python

             Named Pipes(FIFOs) are what I think I'll use for the Combat application
             since if it closes it will need to know the last state to pull it
             back up. Whether it does this after every change I will decide later.

             Note: Keep launchmodes.py from Chapter 5
             
             Beginning Chapter 6 now. Academia => Real World inc.
             
{2013/03/01} I'll need to hang onto the site-forward.py section too. I don't have
             my own website yet, but considering how much I may end up moving around
             I may need this script. I have a complete computer already that I can
             use for hosting, but it needs a video card that is not about to die
             as well as a power supply that wont consume so much power. Actually,
             I could probably get it running right now with no trouble at all.
             That can be included in the project list. The list is getting long
             though, so I will need to start clearing it out. If I can get to 
             page 300 today I think I'll set that up tomorrow.

             Note: SAVE StreamApp and App.py for my own purposes.
             Holy fuck. I am not typing out all of Launcher.py. That can get
             copied from online. I know in comparison to a lot of code it may
             be small, but that is a lot of typing right now. I can just feel
             the millions of typos I'm going to punch right into that.
             I'll just look this one over :3
 
             I'm skipping over LaunchBrowser too. It's not that important to
             code up either. Not that the code is large, but I really want
             to make the 300 page goal today. And, it will be close. 

{2013/03/04} Ended up being late anyways; work likes to get in the way. Anyways,
             I'm starting chapter 8: GUI's finally. After this chapter the program
             can be started. I have to focus. 
             Note: PyGTK | Pmw (Python MEga Widgets) | Then, to OpenGL I think is a
             good graphics path to walk. This gives me a good robust set of GUI
             experience and also leads me into Game Design with OpenGL code in
             case I ever want to really write video games. I'll just need the C++
             experience after this. So, Python, C++, and MySQL are the important
             points to hit on in the near future.

{2013/03/07} There must have been a change in the way lambda is passed since
             demoDlg.py is not working properly. I've reviewed the code and there
             is nothing different about it from te book. The Parenthesis don't help
             but I don't feel like removing them; it's not like taking them out makes
             the program run or anything.

             This GUI stuff is harder than I thought it would be. I cannot think of
             anything that I'd rather be doing. The difficulty is getting everything
             in the same window. Tk really likes spawning separate windows. I've
             got to find a way how to remove objects of the window. This way the
             Button/Label can be replaced with an alternate.

             I'm not sure if I am not payhing enough attention, or if I'm not
             far enough in yet, but I'm having a real hard time getting even
             a box to look like this:
             ----------------------------
             |<character name>          |
             |<iniative>                |
             ----------------------------

             I'll need these things to be stacking up on top of each other. But,
             I cannot get the second label under the first one. There is nothing
             close to it from all the examples so far; I'll just have to keep
             moving.

             I think I've got it. There is an example later on, entry2.py, 
             that helps clarify. It seems under normal circumstances Tk
             gives each widget all of the space it demands. But, it's not demanding
             the space to the left of it, so when I add the second label it aligns
             itself next to it. I am more surprised anchoring didn't have any
             effect.

             Fuck. The CheckButtons, etc.., section requires dialogTables.py and mine
             doesn't work lol. I guess this section will go fast. Or, I could find the
             missing comma in one of the entries and fix the whole thing lol.
             
             Scales don't seem to have much use, but I think I can make something
             out of them. How about two thermometer (Celsius, Farenheit) that
             when you move one of them it changes the other to match that degree.
             I can just include them in the same window too. I do doubt that
             it is a function though; I'll need to do the math. I'll leave that
             for work tomorrow night. Just need to make sure I write down the
             conversion :3

{2013/03/08} Don't run anything involving the launchermodes.py file; it doesn't
             work. Something is wrong with the assert code and I cannot find the
             original code in the book right now. And, none of the image code is
             going to work since I don't have any of the images. I could fill in
             random ones, but I've got a few things I need to do today outside of
             the book. I cannot run any of the examples with PIL either. I'll
             need to add them after I install the PIL. For now though, I'm done
             as I've other work that needs my attention

{2013/03/09} Starting chapter 10 now: the beginning of menu's. 

{2013/03/10} I didn't get that far, but considering I woke up late and hard work,
             it's not all that suprising. I have time today though: 6 hours or
             so. There is more work with PhotoImage that I cannot do. Having a
             connection to the internet would be really nice about now.

             The layout is designed for Combatant.py: Menu[1], ReadyList[2], 
             Scrollbar[3], and CharacterList[4]. All I need to do is start
             rolling out some code, but I want to finish the GUI section.
             I'm on page 516/706; there is some time left. I work tonight and
             Wednesday, but I can do 190 pages in 2 days. If I dig in Monday after
             work and Tuesday I can begin. Thursday and Friday can be used to
             prototype and bugfix. I should at least have a basic working program
             to take with me Sunday afternoon.

{2013/03/11} When I go to the shop later tomorrow morning I need to make sure that
             I download the complete working directory and get those gif images.
             The error from not having them has become tiresome. I want all of this
             code working: not some. I am behind where I wanted to be though; my
             body decided it wanted to sleep all day. I've now got ~200 pages to
             complete in 1 day. I can do this; I think it can happen.

             And, then the Canvas section starts...

             Not everything is bad though. The canvas could be used to graph the
             power arcs of Champions in League. It would be complicated probably,
             but it could be done. Hopefully, there will be a better tool for
             creating graphs coming up; pain is all this would cause. I can only
             imagine how annoying it would be to smooth over the lines creating
             a useful looking graph.

{2013/03/13} Work keeps calling me and putting me behind my schedule. Not that I
             am complaining about the hours; I just dislike being behind my plans.

{2013/03/14} Something is defintely wrong. They might have changed the Tkinter
             move command because it wont even draw the shapes when I start the
             program. Or, I could just not remember that I have to left click to
             draw shapes. Even then, after I draw them it works but it crashes
             hard when I close the window. It says something about canvas.move
             and it looks like they changed the code inside of Tkinter.
             Weird. The second one seems to work fine. Also, make sure when you
             run canvasDraw_tags_after.py that you hold down 'r' or 'o' :]; those
             shapes run for the hills lol.
             
             Mark states that at the time of his writing the book canvasDraw_tags_threads
             did not work on Linux, but it is now working. Woo.

             Note: Check out the Python IDLE implementation.

             Now it looks like there is something wrong with launchmodes.py.
             It's claiming that something is wrong with the syntax of 
             "return pypath." There must be something before it, but that code
             seems fine. SADSAFESsDFSADSFADFASFSAR. How am I to complete the book
             if this keeps happening. I suppose it's good practice for when nothing
             is working properly later on a Coding Project.

{2013/03/15} Just going to finish up chapter 11 and then I'll start the Combat program.
             This code requires that lauchmodes code so I cannot test any of it.
             I need to do more research on Lambda becuase it is saying something is
             wrong with redirectedGuiFunc, but it is defined and spell accurately. So,
             another one that makes no sense :\
 
{2013/03/19} Been working on the D&D Initiative Loader aka Combatant.py. It has its
             own repo on my github, and I'll be updating it as I go along still.
             But, the program works and is running well enough. There are features
             I want to add, and I'm going to reread the GUI section once over again;
             a lot of the material did not stick as well as I hoped. I'm on chapter
             12 now so soon.

             Chapter 12 has nothing in it; all that is there is like 3 projects of
             6 pages of code. That is ... disappointing. Well, it's time to review
             those chapters again.
             Collin vs. GUI  programming | REBEL 2: ACTION.

             Note: Research python lambda; may help with the button problem.
             Otherwise, I'm going to have to subclass it and pass the unitList.             
             Problem solved; lambda is amazing.

             I really want to move on and not do a review. There is a lot I know
             I forgot though. I'll at least review grid since I'm changing the
             layout of contentFrame to be much more consistent. I'll do the ready
             list and that tonight instead. If that works I think I'll consider
             the program completed until Sunday when it goes for a test run.
             I have to remember to add comments for descriptions for the code.

             All set. The comments are listed, the readyList works, it doesn't
             crash, and nothing is lost. The only thing that bothers me left is
             if you add a million items it wont add the scrollbar yet. This, finally,
             will be left for after the first meeting. Time to start chapter 13.


                ----------------- Project: D&D  Spell Compendium --------------
                | Reqs: SQL work | chapter 19  (So, in like a month probably) |
                | ########################################################### |
                \-------------------------------------------------------------/

                ----------------- Project: D&D Init Loader --------------------
                | Reqs: GUI work |              chapter 12                    |
                | ########################################################### |
                | Completed: March 19th, 2013 | Status: Ongoing               |
                \-------------------------------------------------------------/

                ------------------ Project: Webserver--------------------------
                | Reqs: None     | Can be done at anytime.                    |
                | ########################################################### |
                \-------------------------------------------------------------/

                ------------------ Project ChampScale -------------------------
                | Reqs: GUI work | Need a graphing portion; Canvas maybe?     |
                | ########################################################### |
                \-------------------------------------------------------------/

                ------------------ Project: Item Efficiency -------------------
                | Reqs: None     | Needs details of LoL Item stats            |
                | ########################################################### |
                \-------------------------------------------------------------/
