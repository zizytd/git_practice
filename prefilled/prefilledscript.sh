#!/bin/bash
#Default values
name=prefilled 
number=0

#set RESETPOSITIONAL as an empty array
RESETPOSITIONAL=()

#help message to be echoed when you use the -h option
HelpMessage="This is a help page for this script.\nThis script have the format ./create-prefilled-file.sh [options] <text>\nif you use the optional option \n\t--name, it creates a text file with name of your input parameter as the name of the text file e.g name.txt.\nIf you use the optional option \n\t--number it appends a number your inputed to the name of the file e.g name1.txt.\nIf you use the optional option \n\t-h it opens this help page.\n<text> should end up in the text file."


while [ $# -gt 0 ]
do 
  case "$1" in
    --name)
      name=$2
      shift
      shift
      ;;
    --number) 
      number=$2
      shift
      shift
      ;;
    -h)
      echo -e "$HelpMessage"
      shift
      ;;
    *)
      RESETPOSITIONAL+=("$1")
      shift
      ;;
    
   esac
  
done
touch $name$number.txt
#resetting positional arguments after options. 
set -- "${RESETPOSITIONAL[@]}"

echo "$1" > $name$number.txt
open $name$number.txt

 


