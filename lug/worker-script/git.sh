#!/bin/bash

set -xe

if [ ! -d "${LUG_path}/.git" ]; then
	git clone "$LUG_origin" "$LUG_path"
fi

cd "$LUG_path"
git pull --all --rebase
git update-server-info
git gc --auto
git repack -a -b -d
