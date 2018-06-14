#!/bin/bash

if [ ! -d "${LUG_path}/.git" ]; then
	git clone --mirror "$LUG_origin" "$LUG_path"
fi

cd "$LUG_path"
git pull origin --all
git update-server-info
git gc --auto
git repack -a -b -d
