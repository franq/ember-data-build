#!/bin/bash

version="$1"

if [ -z "$version" ]; then
  echo "Usage: $0 <version>"
  exit
fi

(cd .. && npm run dist)
cd ../dist/*.* ./
find . -name *.json -exec perl -pi -e 's/VERSION_STRING_PLACEHOLDER/$version/g' {} \;
