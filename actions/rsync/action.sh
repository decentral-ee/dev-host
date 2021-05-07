#!/bin/bash

source actions/prepare_ssh_action.sh

rsync -Pav \
  -e "ssh -i ssh.key ${SSH_OPTS}" \
  ${INPUT_LOCAL_PATH} \
  ${INPUT_DEV_HOST_USER}@${INPUT_DEV_HOST_HOSTNAME}:${INPUT_REMOTE_PATH}
