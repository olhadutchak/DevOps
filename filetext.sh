#!/bin/bash
if [ $# -ne 2 ]; then 
   echo "$0 <path> <search_text>"
fi
dir_path=$1
search_text=$2

if [ ! -d "$dir_path" ]; then
   echo "Directory $dir_path not exist"
   exit 1
fi
find "$dir_path" -type f -exec grep -l "$search_text" {} +

