#!/bin/bash

# Function to remove files that end with '.out'
remove() {
  # Default string to remove
  substr=".out"
    # Convert file name to lowercase
  str=$(echo "$1" | tr '[:upper:]' '[:lower:]')
   # If file name ends with '.out', remove it
  if [[ $str == *"$substr" ]]; then
    rm "$1"
  fi
}

# Function to compile C files that contain a specific word
compile() {
    # 'word' is the search term, 'file' is the file to compile
  local word="$2"
  local file="$1"
   # If the file is a C file and contains the search term, compile it
  if [[ "$file" == *".c" ]]; then
    if grep -i -r -E -q "\b$word\b" "$file"; then
      local toCompile=${file%.c}
      gcc "$file" -w -o "$toCompile".out
    fi
  fi
}

#checks if number of parameters is matched
if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]; then
  echo Not enough parameters
  exit
fi
# Get the absolute path of this script
script=$(realpath "$0")
# Change the current directory to the path specified by the user
cd "$1" || exit
# If there are two parameters, run the script on all files in the directory
if [ "$#" = 2 ]; then

   # Remove files that end with '.out'
    # Compile files that contain the search term
  for i in $(ls); do
    remove "$i"
    compile "$i" "$2"
  done

# If there are three parameters and the third is '-r', run the script recursively on all directories
elif [ "$3" == "-r" ]; then
  # Remove files that end with '.out'
    # Compile files that contain the search term
  for i in $(ls); do
    remove "$i"
  done
  for i in $(ls); do
    compile "$i" "$2"
  done
  for i in $(ls); do
    if [ -d "$i" ]; then
      # Call this script recursively on the subdirectory
      $script "$i" "$2" "-r"
    fi
  done

# If the third parameter is not '-r', print an error message
else
  echo no such flag
  exit
fi
