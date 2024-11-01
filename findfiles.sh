#!/bin/bash
if [ $# -ne 2 ]; then 
   echo "$0 <path> <file_ext>"
fi
dir_path=$1
ext=$2

if [ ! -d "$dir_path" ]; then
   echo "Directory $dir_path not exist"
   exit 1
fi

files=$(find "$dir_path" -type f -name "*.$ext")
if [ -z "$files" ]; then
  echo "file with this extension $ext not found in $dir_path"
else
   echo "Found files"
   echo "$files"
fi
