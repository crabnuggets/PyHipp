#!/bin/bash

# Base directory containing sub-directories
base_dir="/data/picasso"

# Iterate through each sub-directory in the base directory
for subdir in "$base_dir"/*/; do
    # Path to session01 directory inside the sub-directory
    session_dir="${subdir}session01"

    # Check if session01 directory exists
    if [ -d "$session_dir" ]; then
        # Count the number of .hkl files in the session01 directory
        hkl_count=$(find "$session_dir" -maxdepth 1 -type f -name "*.hkl" | wc -l)

        # If the count is not equal to 3, echo the sub-directory and file count
        if [ "$hkl_count" -ne 3 ]; then
            echo "Sub-directory: $(basename "$subdir") has $hkl_count .hkl files"
        fi
    else
        echo "No session01 directory in: $(basename "$subdir")"
    fi
done

