import math

def check_fermat(a,b,c,n):
   if(n > 2):
	if(a.pow(n) + b.pow(n) == c.pow(n)):
		"Holy smokes, Fermat was wrong!"
	else:
		"No, that doesn't work"

