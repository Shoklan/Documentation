# Documentation
This Repo is about consolidating all the different languages, technology, Documenation, and walkthroughs placing them in one location.
As the list of expands, I will keep adding, moving, and updating my opinions and experiences here.

# R Language 
### R Programming Language - 7/2/2015
       Source: http://cran.r-project.org/doc/manuals/R-intro.pdf
       Folder: /rProgramming/IntroToR
       Page #: 30
Relevant Data: 
* Vectors = Variables
* ?[function]
* mode(variableName)  | Tells the kind of vector type

### R Programming Basics - 7/23/15
       Source: https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf
       Folder: /rProgramming/RForBeginners
       Page #: Done.
Relevant Data: 
* expression()
* eval()        | call to evaluate expressions
* REMEMBER indexing[rowFirst,columnSecond]

### Handling and Processing Strings in R - 10/14/15
		Source: http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf
		Folder: /rProgramming/StringsInR
		Page #: Done.
Relevant Data:
* Set Functions:
    * union()
	* intersect()
	* setdiff()   | selective !union based on first variable.
* is.element() is cool, but %in% is better.
* metacharacters require "\\" escapes for regex
* stringr package has functions for regex:
	* str_detect
	* str_extract
	* str_extract_all
	* str_match
	* str_locate
	* str_locate_all
	* str_replace
	* str_replace_all
	* str_split
	* str_split_fixed
* wordcloud package

## Introduction to dplyr - 8/20/15
       Source: https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
       Folder: /rProgramming/IntroToDplyr
       Page #: N/A

Relevant Data:
* filter()    | Grab only the columns you care about in a dataframe.
* slice()     | Grab rows based upon indexes.
* arrange()   | Sort based on column, column2, column3, etc.
* select()    | Similar to filter.
* rename()    | Don't use it.
* distinct()  | Return only unique values.
* mutate()    | Create new columns based upon old columns.
* transmute() | Same as mutate, but replaces all columns with mutated columns.
* summarise() | Collapse 

## Understanding Statistics | Using R Language
		Source: Understanding Statistics: Concepts and Methods
		Folder: /rProgramming/StatsUnderstand
Relevant Data : TBL

## Shiny Tutorial
		Source  : http://shiny.rstudio.com/tutorial/
		Folder  : /rProgramming/Shiny
		Progress: Done.
Relevant Data   :
	* You can add any css value to any attribute function.
	* Shiny uses Bootstrap, so columns are out of 12.
	* functions	widget
		1. actionButton	Action Button
		2. checkboxGroupInput	A group of check boxes
		3. checkboxInput	A single check box
		4. dateInput	A calendar to aid date selection
		5. dateRangeInput	A pair of calendars for selecting a date range
		6. fileInput	A file upload control wizard
		7. helpText	Help text that can be added to an input form
		8. numericInput	A field to enter numbers
		9. radioButtons	A set of radio buttons
		10. selectInput	A box with choices to select from
		11. sliderInput	A slider bar
		12. submitButton	A submit button
		13. textInput	A field to enter text
	* connect widgets via their name to objects on the server.R


# Web design

## Wordpress Documentation - 7/24/15
		Source: https://codex.wordpress.org/Theme_Development
		Folder: /Wordpress
		Page #: ---
Relevant Data : TBL

# Python 

## Think Python - 8/16/15
		Source: http://www.greenteapress.com/thinkpython/
		Folder: /Python/ThinkPythonPage #: ---
Relevant Data: TBL

## Programming Python - 8/16/15
		Source : "Programming Python" by Mark Lutz
		ISBN-13: 978-0-596-00925-0
		Folder : /Python/ProgrammingPython
		Page # : Done.
Relevant Data  : TBL

# C Programming

## Learn C the Hard Way - 10/15/15
		Source: http://c.learncodethehardway.org/book/
		Folder: /C/TheHardWay
		Page  : "Exercise 10: Arrays Of Strings, Looping"
Relevant Data : TBL

# Java Programming

## Algorithms, 4th Edition - 10/29/15
		Source: "Algorithms" by Robert Sedgewick
		ISBN  : 978-0321573513
		Folder: /Java/Algorithm
		Page  : #364 / 931
Relevant Data :
		- Basic Data Structures
		- Predicting Algorithm Performance [Big O | Big Theta]
		- Selection Sort
		- Shell Sort
		- Quick Sort
		- Merge Sort
		- Priority Queue
		- Kendall Tau Distance - distance between two differently arranged arrays
		- Symbol table = dictionary = indice


# Go Programming

## Go Programming Language Documentation
		Source: https://golang.org/doc/
		Folder: /Go/Docs



# Projects:

## Google Hangouts
	Source: https://developers.google.com/+/hangouts/

