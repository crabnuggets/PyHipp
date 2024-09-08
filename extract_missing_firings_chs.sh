#!/bin/bash

# Create a list of channels
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt

# Extract channels from firings.mda files
find ./mountains -name "firings.mda" | cut -d "/" -f 3 > firings.txt

# Extract channel??? strings from chs.txt
cut -d "/" -f 4 chs.txt > chs_channels.txt

# Sort both lists for comm comparison
sort firings.txt -o firings.txt
sort chs_channels.txt -o chs_channels.txt

# Find missing channels
comm -23 chs_channels.txt firings.txt > missing_firings_chs.txt

# Search for missing channel paths in chs.txt
while read channel; do
    grep "$channel" chs.txt
done < missing_firings_chs.txt > missing_firings_chs_dirs.txt

