#!/bin/bash

if [ "$LUG_exclude_hidden" ]; then
	exclude_hidden_flags="--exclude=.*"
fi

if [ "$LUG_ignore_vanish" ]; then
	IGNOREEXIT=24
	IGNOREOUT='^(file has vanished: |rsync warning: some files vanished before they could be transferred)'
fi

tmp_stderr=$(mktemp "/tmp/rsync-$LUG_name.XXX")

rsync -aHvh --no-o --no-g --stats --delete --delete-delay --safe-links --exclude '.~tmp~/' --partial-dir=.rsync-partial --timeout=120 --contimeout=120 $exclude_hidden_flags "$LUG_source" "$LUG_path" 2> "$tmp_stderr"
retcode="$?"

cat "$tmp_stderr" >&2

if [ "$LUG_ignore_vanish" ]; then
	if [ "$retcode" -eq "$IGNOREEXIT" ]; then
		if egrep "$IGNOREOUT" "$tmp_stderr"; then
			retcode=0
		fi
	fi
fi

rm -f "$tmp_stderr"

exit "$retcode"

