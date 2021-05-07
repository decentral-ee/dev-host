#!/bin/bash

source actions/prepare_ssh_action.sh

# We do not use "--delete", because some error in workflow could lead
# to a wipeout of data.
rsync -Pav \
  -e "ssh -i ssh.key ${SSH_OPTS}" \
  ${INPUT_LOCAL_PATH} \
  ${INPUT_DEV_HOST_USER}@${INPUT_DEV_HOST_HOSTNAME}:${INPUT_REMOTE_PATH}
