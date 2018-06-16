#!/bin/bash
set -xe
/worker-script/git.sh
cd "$LUG_path" && sed -i 's/"dl": *"https:\/\/crates.io/"dl": "https:\/\/crates-io.mirrors.sjtug.sjtu.edu.cn/' config.json
