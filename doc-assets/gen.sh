#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for filepath in $DIR/*.dot; do
	filename="$(basename $filepath)"
	echo "Generating $filename"
	dot -T png -o "images/${filename%.*}.png" "$filepath"
done
