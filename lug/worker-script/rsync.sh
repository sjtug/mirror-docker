#!/bin/bash

if [ "$LUG_exclude_hidden" ]; then
	exclude_hidden_flags="--exclude=.*"
fi

rsync -aHvh --no-o --no-g --stats --delete --delete-delay --safe-links --partial-dir=.rsync-partial --timeout=120 --contimeout=120 $exclude_hidden_flags "$LUG_source" "$LUG_path"
