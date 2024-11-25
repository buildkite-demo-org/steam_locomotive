#!/bin/bash

set -eu

echo "steps:"

# A step for each dir in specs/

find specs/* -type d | while read -r D; do
  echo "  - command: \"$D/test.sh\""
  echo "    label: \"$(basename "$D")\""
done

exit 0
