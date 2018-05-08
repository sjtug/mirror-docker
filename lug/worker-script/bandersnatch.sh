#!/bin/bash

cd "$(dirname "$0")"
tmp_stderr=$(mktemp "/tmp/bandersnatch-$LUG_name.XXX")
perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < bandersnatch/bandersnatch.conf > /tmp/bandersnatch.conf
bandersnatch -c /tmp/bandersnatch.conf mirror 2> "$tmp_stderr"
retcode="$?"
cat "$tmp_stderr" >&2
if [ "$LUG_retry_on_ssl_fail" ]; then
       if [ "$retcode" -ne 0 ]; then
	       if grep 'requests.packages.urllib3.exceptions.MaxRetryError' "$tmp_stderr"; then
			bandersnatch -c /tmp/bandersnatch.conf mirror
			exit $?
		fi
	fi
fi
rm -f "$tmp_stderr"
exit "$retcode"
