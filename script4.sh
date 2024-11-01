#!/bin/bash
while getopts p:e: opt; do
  case $opt in
    p) DIRECTORY=$OPTARG ;;
    e) EXTENSION=$OPTARG ;;
    *) echo "Використання: $0 -p <path> -e <extension>"; exit 1 ;;
  esac
done
[ -z "$DIRECTORY" ] || [ -z "$EXTENSION" ] && { echo "Використання: $0 -p <path> -e <extension>"; exit 1; }
[ ! -d "$DIRECTORY" ] && { echo "Директорія $DIRECTORY не існує."; exit 1; }

COUNT=$(find "$DIRECTORY" -type f -name "*.$EXTENSION" | wc -l)
echo "Кількість файлів з розширенням .$EXTENSION: $COUNT"
