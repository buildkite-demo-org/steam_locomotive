#!/bin/bash

set -eu

echo "steps:"

# A step for each dir in specs/

find specs/* -type d | while read -r D; do
  echo "  - command: \"$D/test.sh\""
  echo "    label: \"$(basename "$D")\""
done

find config/* -name "*.sh" | while read -r D; do
  #base_name=$(basename ${D})
  echo "  - command: \"$D\""
  echo "    label: \"$(basename "$D")\""
done

# A deploy step only if it's the master branch

if [[ "$BUILDKITE_BRANCH" == "main" ]]; then
  echo "  - wait"
  echo "  - command: \"echo Deploy!\""
  echo "    label: \":rocket:\""
fi

if [[ "$BUILDKITE_BUILD_AUTHOR" == "DiogoFraga" ]]; then
  echo "  - wait"
  echo "  - command: \"echo Deploy User!\""
  echo "    label: \":rocket:\""
fi