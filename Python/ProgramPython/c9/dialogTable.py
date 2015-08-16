# define a name:callback demos table

from tkFileDialog   import askopenfilename                        # get standard dialogs
from tkColorChooser import askcolor                               # they live in Liv/lib-tk
from tkMessageBox   import askquestion, showerror
from tkSimpleDialog import askfloat

demos = {
   'open' : askopenfilename,
   'color': askcolor,
   'Query': lambda: askquestion('Warning', 'You typed "rm *\"\nconfirm?'),
   'Error': lambda: showerror('Error!', "He's dead, Jim"),
   'Input': lambda: askfloat('Entry', 'Enter credit card number')
}
