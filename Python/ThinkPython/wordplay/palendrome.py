def rotate_word(s):
	finalS = ""
	for c in s:
		finalS = finalS + chr(ord(c) - 13)
	return finalS
