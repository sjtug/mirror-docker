#!/bin/bash

cd "$(dirname "$0")"
perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < bandersnatch/bandersnatch.conf > /tmp/bandersnatch.conf
bandersnatch -c /tmp/bandersnatch.conf mirror

