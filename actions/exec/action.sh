#!/bin/bash

source actions/prepare_ssh_action.sh

OUTPUT=$(ssh -i ssh.key ${SSH_OPTS} -- ${INPUT_COMMAND})

echo "::set-output name=command_output::${OUTPUT}"
