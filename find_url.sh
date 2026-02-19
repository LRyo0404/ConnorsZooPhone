#!/bin/bash

animal=$1
search_term="watercolor $animal illustration"
search_url="https://commons.wikimedia.org/w/index.php?search=${search_term// /+}&title=Special:MediaSearch&go=Go&type=illustration"

file_path=$(curl -s "$search_url" | grep -o '/wiki/File:[^"]*\.png' | head -1)

if [ -z "$file_path" ]; then
  echo "No PNG found for $animal"
  exit 1
fi

file=$(echo $file_path | sed 's|/wiki/File:||')
wiki_url="https://commons.wikimedia.org$file_path"

png_path=$(curl -s "$wiki_url" | grep -o 'upload.wikimedia.org/wikipedia/commons/[^"]*\.png' | head -1)

if [ -z "$png_path" ]; then
  echo "No PNG URL found for $animal"
  exit 1
fi

echo "https://$png_path"