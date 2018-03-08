#!/bin/bash

aws s3 sync --no-sign-request "$LUG_source" "$LUG_path"
