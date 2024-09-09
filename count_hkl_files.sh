#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <directory_pattern_1> [<directory_pattern_2> ...]"
  exit 1
fi

# Loop through each directory pattern passed as an argument
for pattern in "$@"; do
  # Find directories that match the pattern
  for dir in $(find . -maxdepth 1 -type d -name "$pattern" | sort); do
    echo "Number of hkl files in $(basename "$dir")"
    # Count the number of .hkl files in the current directory
    find "$dir" -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l
  done
done
