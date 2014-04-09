#!/usr/local/bin/io

# === Q: Is Io strongly typed? 
#     A: Yes - this throws an exception
try(1 + "one")


# === Q: What do 0, "", and nil evaluate to? 
#     A: true, true, and false respectively
(false or 0) println
(false or "") println
(false or nil) println

# === Q: list the slots a prototype supports
Object slotNames println
Object clone slotNames println


# === Q: What are the three assignment operators
#     A: = operator updates a slot or throws exception  ("updateSlot")
#        := operator creates a slot and adds a setter ("setSlot")
#        ::= operator creates a slot without creating a setter ("newSlot")


# === Execute the code in a slot given its name
Object getSlot("println") call

