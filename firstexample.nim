import parseopt
import os
import strutils
import random
import system

var lang: string = "en"

#[
a little help procedure, which shows usage and options
]#
proc hilfe() =
 echo "Usage: "
 echo " Parameters: "
 echo " -l | --lang .... set the language eg -l:de sets german"
 echo " -h | --help .... show this help"
 quit(1)

when declared(commandLineParams):
 # echo commandLineParams()
 var p = initOptParser()
 while true:
  p.next()
  case p.kind
  of cmdEnd: break
  of cmdShortOption, cmdLongOption:
    if p.val == "":
      # echo "Option: ", p.key
      if p.key == "h" or p.key == "help":
        hilfe()
    else:
      # echo "Option and value: ", p.key, ", ",p.val
      if p.key == "l":
        lang = p.val
  of cmdArgument:
    echo "Argument: ", p.key

let contents = readFile("zitate.de.txt")
var lines = contents.splitLines()
    
randomize()
shuffle(lines)

var count: int = 0

for line in lines:
 if count < 1:
  if startsWith(line, lang & ":"):
   var ausgabe = line
   ausgabe.removePrefix(lang & ":")
   echo ausgabe
   count = count + 1
