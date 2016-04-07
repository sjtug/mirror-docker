#!/bin/sh

# generate `.tar.gz` packages from git repos

# set PACKAGEURL
set_pack_url() {
	unset PACKAGEURL
	case "$1" in
	tunasync)	PACKAGEURL=https://github.com/sjtug/tunasync.git ;;
	mirror-web)	PACKAGEURL=https://github.com/sjtug/mirror-web.git ;;
	*)
	esac
}

gen_pack() {
	if [ -d "$1" ]; then
		if [ ! -d "$1/.git" ]; then
			# fail to find .git/ in the directory
			echo "error: $1/ does not seem to be a git repo"
			return
		fi
		# sadly, git 1.8.3.1 on Centos 7 does not support -C option
		# use `cd` instead
		cd "$1"
		git pull && git archive -o "$OLDPWD/$1.tar.gz" HEAD
		cd "$OLDPWD"
	else
		git clone $PACKAGEURL && gen_pack "$1"
	fi
}

if [ $# -lt 1 ]; then
	echo "Usage: $0 <package> ..."
	exit 1
fi

for PACKAGE in "$@"; do
	set_pack_url "$PACKAGE"
	if [ -z $PACKAGEURL ]; then
		echo "error: unknown package $PACKAGE"
		continue
	fi
	echo "===== processing $PACKAGE ====="
	gen_pack "$PACKAGE"
done
