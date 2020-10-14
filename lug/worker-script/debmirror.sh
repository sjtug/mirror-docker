#### Start script to automate building of Ubuntu mirror #####
## THE NEXT LINE IS NEEDED THE REST OF THE LINES STARTING WITH A # CAN BE DELETED

#!/bin/bash

## Setting variables with explanations.

#
# Don't touch the user's keyring, have our own instead
#
# Arch=         -a      # Architecture. For Ubuntu can be i386, powerpc or amd64.
# sparc, only starts in dapper, it is only the later models of sparc.
#
arch="${LUG_arch:-i386,amd64}"

# Minimum Ubuntu system requires main, restricted
# Section=      -s      # Section (One of the following - main/restricted/universe/multiverse).
# You can add extra file with $Section/debian-installer. ex: main/debian-installer,universe/debian-installer,multiverse/debian-installer,restricted/debian-installer
#
section="${LUG_section:-main,restricted,universe,multiverse}"

# Release=      -d      # Release of the system (...Hardy, Intrepid... Lucid, Precise, Quantal, Saucy, Trusty ), and the -updates and -security ( -backports can be added if desired)
# List of updated releases in: https://wiki.ubuntu.com/Releases
#

release="${LUG_release}"

# Server=       -h      # Server name, minus the protocol and the path at the end
# CHANGE "*" to equal the mirror you want to create your mirror from. au. in Australia  ca. in Canada.
# This can be found in your own /etc/apt/sources.list file, assuming you have Ubuntu installed.
#
server="${LUG_server}"

# Dir=          -r      # Path from the main server, so http://my.web.server/$dir, Server dependant
#
inPath="${LUG_inpath}"

# Proto=        --method=       # Protocol to use for transfer (http, ftp, hftp, rsync)
# Choose one - http is most usual the service, and the service must be available on the server you point at.
#
proto="${LUG_proto:-http}"

# Outpath=              # Directory to store the mirror in
# Make this a full path to where you want to mirror the material.
#
outPath="${LUG_path}"

# The --nosource option only downloads debs and not deb-src's
# The --progress option shows files as they are downloaded
# --source \ in the place of --no-source \ if you want sources also.
# --nocleanup  Do not clean up the local mirror after mirroring is complete. Use this option to keep older repository
# Start script
#
debmirror       -a $arch \
                --no-source \
                -s $section \
                -h $server \
                -d $release \
                -r $inPath \
                --progress \
                --method=$proto \
		--ignore-missing-release \
		-v \
		--diff=none \
		--no-check-gpg \
		--rsync-options="-aIL --partial --partial-dir .partial" \
		--rsync-extra=none \
		--allow-dist-rename \
                $outPath


#### End script to automate building of Ubuntu mirror ####
