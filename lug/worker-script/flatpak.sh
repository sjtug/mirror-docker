#!/bin/bash

set -ex

ostree pull --repo=$LUG_path --mirror flathub --depth=1
flatpak build-update-repo $LUG_path
