playList  = [1, 2, "apple", 5, 7, "banana", 11]
playList2 = [ "apple", "banana"]
playList3 = ["apple", "turtle"]

IO.puts playList -- playList2
IO.puts playList -- playList3 # what happens when elem is missing?
                              # the extra elem gets ignored.
