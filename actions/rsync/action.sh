#!/bin/bash

# create temporary ssh key
echo "${INPUT_DEV_HOST_SSH_KEY}" > ssh.key
chmod 600 ssh.key

set -ex

SSH_OPTS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

rsync -Pav \
  -e "ssh -i ssh.key $SSH_OPTS" \
  ${INPUT_LOCAL_PATH} \
  ${INPUT_DEV_HOST_USER}@${INPUT_DEV_HOST_HOSTNAME}:${INPUT_REMOTE_PATH}
