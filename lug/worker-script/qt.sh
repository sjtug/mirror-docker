#!/bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

LUG_source="master.qt.io::qt-online" LUG_path="$LUG_path/online" $DIR/rsync.sh
SYNC_SYMLINK=1 LUG_source="master.qt.io::qt-official" LUG_path="$LUG_path/official_releases" $DIR/rsync.sh
LUG_source="master.qt.io::qt-development" LUG_path="$LUG_path/development_releases" $DIR/rsync.sh
