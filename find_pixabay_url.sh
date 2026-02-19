#!/bin/bash

animal=$1

search_term="watercolor $animal illustration"

search_url="https://pixabay.com/images/search/${search_term// /%20}/"

page=$(curl -s "$search_url")

url=$(echo "$page" | grep -o 'data-lazy="[^"]*"' | head -1 | sed 's/data-lazy="//;s/"//')

if [ -z "$url" ]; then
  echo "No image found for $animal"
else
  echo "$url"
fi