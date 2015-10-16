# Documentation
This Repo is about consolditating all the different languages and technologies Documenation walkthroughs and placing them in one location.
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

### Handling and Processing Strings in R - 10/14/2015
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
Relevant Data: TBL

# Web design

## Wordpress Documentation - 7/24/15
		Source: https://codex.wordpress.org/Theme_Development
		Folder: /Wordpress
		Page #: ---
Relevant Data: TBL

# Python 

## Think Python - 8/16/15
		Source: http://www.greenteapress.com/thinkpython/
		Folder: /Python/ThinkPythonPage #: ---
Relevant Data: TBL

## Think Python - 8/16/15
		Source: "Programming Python" | Mark Lutz ISBN-13: 978-0-596-00925-0
		Folder: /Python/ProgrammingPython
		Page #: Done.
Relevant Data: TBL

# C Programming

## Learn C the Hard Way - 10/15/15
		Source: http://c.learncodethehardway.org/book/
		Folder: /C/TheHardWay
		Page: "Exercise 0: The Setup"
Relevant Data: TBL