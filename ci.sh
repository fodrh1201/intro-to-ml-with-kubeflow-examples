#!/bin/bash

set -ex

# Check all the shell scripts
find ./ -iregex '^.+\.sh$' -type f -print0 | xargs -0 shellcheck -e SC1091
# Check for cases where I use tags rather than tag
bad_tags=$(grep -r "tags::" ./ | grep -v "ci.sh:")
if [[ ! -z "$bad_tags" ]]; then
  echo "Found bad tags $bad_tags replace tags with tag"
  exit 1
fi
