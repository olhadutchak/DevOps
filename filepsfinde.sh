#!/bin/bash
while getopts p:s: opt; do
  case $opt in
    p) DIRECTORY=$OPTARG ;;
    s) SEARCH_TEXT=$OPTARG ;;
    *) echo " $0 -p <path> -s <text>"; exit 1 ;;
  esac
done

[ -z "$DIRECTORY" ] || [ -z "$SEARCH_TEXT" ] && { echo "$0 -p <path> -s <text>"; exit 1; }
[ ! -d "$DIRECTORY" ] && { echo "$DIRECTORY no found."; exit 1; }
find "$DIRECTORY" -type f -exec grep -l "$SEARCH_TEXT" {} +
