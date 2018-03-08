#!/bin/bash

RSYNC_PASSWORD=$LUG_password rsync -rtlivH --delete-after --delay-updates --safe-links --max-delete=1000 --contimeout=60 $LUG_username@sync.repo.archlinuxcn.org::repo $LUG_path
