#!/bin/bash

# Create a list of channels
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt

# FOR FINDING MISSING RPLHIGHPASS FILES
# Search for channels that already have rplhighpass files
find . -name "rplhighpass*hkl" | grep -v -e eye | sort | cut -d "/" -f 1-4 > hps.txt

# Output channel directories that are missing rplhighpass files
comm -23 chs.txt hps.txt > missing_highpass_chs_dirs.txt
