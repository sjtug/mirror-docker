#!/bin/bash
set -xe
/worker-script/git.sh
pushd "$LUG_path"
jq 'setpath(["dl"]; "https://mirrors.sjtug.sjtu.edu.cn/static.crates.io/crates/{crate}/{crate}-{version}.crate")' config.json > config.json.temp
mv config.json.temp config.json
git config user.name 'SJTUG mirrors'
git config user.email 'mirrors@sjtug.org'
git add .
git commit -m "update config.json" || true
popd
