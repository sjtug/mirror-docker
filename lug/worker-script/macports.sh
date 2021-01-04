#!/bin/bash

rsync --compress --delete-delay --hard-links --links --no-motd --perms --recursive --stats --timeout=600 --times "$LUG_source" "$LUG_path"
