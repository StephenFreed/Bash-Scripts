#!/bin/bash

echo "Running Build Script..."

# get first line of file
firstline=$ (head -n 1 source/changelog.md)

# split first line by spaces into array
read -a splitfirstline <<< $firstline

# get second element in array which is version
version=${splitfirstline[1]}

echo "You are building version" $version

echo "Would you like to continue? 1 == YES | 0 == NO"

# reads input from user into variable
read versioncontinue

if [ $versioncontinue -eq 1 ]
  then

    # loops through all files in directory
    for filename in source/*
      do
        if [ $filename == "source/secretinfo.md" ]
          then
              echo $filename "NOT COPIED"
          else
              echo $filename "COPIED TO BUILD"
              cp $filename build/
        fi
      done

    cd build/
      echo "Build version $version contains:"
      ls
    cd ..

  else
   echo "Please come back when you are ready"
fi
