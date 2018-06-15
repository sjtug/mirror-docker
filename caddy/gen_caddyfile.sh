#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")

if [ "$#" -ne 2 ]; then
    echo 'Usage:'
    echo '  ./gen_caddyfile.sh [[config.yaml]] [[outputCaddyfile]]'
    echo '  Output file will be written to ./Caddyfile'
    echo 'Example:'
    echo '  ./gen_caddyfile.sh config.example.yaml Caddyfile'
    exit 1
fi

echo "Input: $1"
echo "Output: $2"

"${BASEDIR}/p2" -t "${BASEDIR}/Caddyfile.template.p2" -i "$1" -o "$2"
