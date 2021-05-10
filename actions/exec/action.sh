#!/bin/bash

source "$(dirname "$0")"/../prepare_ssh_action.sh

ssh -i ssh.key ${SSH_OPTS} \
    ${INPUT_DEV_HOST_USER}@${INPUT_DEV_HOST_HOSTNAME} -- \
    "${INPUT_COMMAND}"
