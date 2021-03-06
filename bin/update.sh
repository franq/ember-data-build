#!/bin/bash

version="$1"

if [ -z "$version" ]; then
  echo "Usage: $0 <version>"
  exit
fi

sha=$(cd .. && git rev-parse HEAD)
(cd .. && npm run dist) \
  && cp ../dist/*.* . \
  && find . -name '*.json' -exec perl -pi -e "s/VERSION_STRING_PLACEHOLDER/$version/g" {} \; \
  && find . \(  -name '*.js' -o -name '*.map' -o -name '*.json' \) -exec perl -pi -e "s/<%= versionStamp %>/$version/g" {} \; \
  && git commit -m "$sha" -a \
  && git tag "v$version"
