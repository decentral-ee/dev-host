#!/bin/bash

export INPUT_LOCAL_PATH=$INPUT_SCRIPT_PATH
export INPUT_REMOTE_PATH=/tmp/action-$RANDOM-$(basename "$INPUT_SCRIPT_PATH")
"$(dirname "$0")"/../rsync/action.sh

# cleanup the remote script always

function finish {
    export INPUT_COMMAND="rm -f $INPUT_REMOTE_PATH"
    "$(dirname "$0")"/../exec/action.sh
}
trap finish EXIT

# fail the script if this exec action fail
set -e
export INPUT_COMMAND="$INPUT_SCRIPT_SHELL $INPUT_REMOTE_PATH $INPUT_SCRIPT_ARGS"
"$(dirname "$0")"/../exec/action.sh
