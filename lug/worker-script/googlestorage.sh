#!/bin/bash

# path: sync destination
# access_key_id: https://cloud.google.com/storage/docs/migrating#keys
# access_secret_id: Same as above
# project_id: The project name where you create a new key
# source: source googlestorage path. Example: gs://flutter_intra

mkdir -p "LUG_path"
env "GS_ACCESS_KEY_ID=$LUG_access_key_id" "GS_ACCESS_SECRET_KEY=$LUG_access_secret_key" ./google-cloud-sdk/bin/gsutil  -o "GSUtil:default_project_id=$LUG_project_id" -m rsync -d -r "LUG_source" "$LUG_path"
