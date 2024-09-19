#!/bin/bash

# Base directory containing sub-directories
base_dir="/data/picasso"

# Output file to store paths of directories with missing .hkl files
output_file="missing_hkl_dirs.txt"

# Empty the output file if it exists
> "$output_file"

# Iterate through each sub-directory in the base directory
for subdir in "$base_dir"/*/; do
    # Path to session01 directory inside the sub-directory
    session_dir="${subdir}session01"

    # Check if session01 directory exists
    if [ -d "$session_dir" ]; then
        # Count the number of .hkl files in the session01 directory
        hkl_count=$(find "$session_dir" -maxdepth 1 -type f -name "*.hkl" | wc -l)

        # If the count is not equal to 3, append the sub-directory path and file count to the output file
        if [ "$hkl_count" -ne 3 ]; then
            echo "$subdir" >> "$output_file"
        fi
    fi
done

# Inform the user that the script has finished
echo "Directories with missing .hkl files are listed in $output_file"

