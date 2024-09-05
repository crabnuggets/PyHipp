#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Start times"
for file in *.out; do
	echo  "==> $file <=="
	grep -m 1 'time.struct_time' "$file"
done

echo "End times"
for file in *.out; do
	echo "==> $file <=="
	tail -n 5 "$file"
done

