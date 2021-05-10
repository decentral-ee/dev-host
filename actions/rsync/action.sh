#!/bin/bash

source "$(dirname "$0")"/../actions/prepare_ssh_action.sh

REMOTE_PATH=${INPUT_DEV_HOST_USER}@${INPUT_DEV_HOST_HOSTNAME}:${INPUT_REMOTE_PATH}
# We do not use "--delete", because some error in workflow could lead
# to a wipeout of data.
if [ -z "$INPUT_DOWNLOAD" ];then
    rsync -Pav \
      -e "ssh -i ssh.key ${SSH_OPTS}" \
      ${INPUT_LOCAL_PATH} \
      ${REMOTE_PATH}
else
    rsync -Pav \
      -e "ssh -i ssh.key ${SSH_OPTS}" \
      ${REMOTE_PATH} \
      ${INPUT_LOCAL_PATH}
fi
