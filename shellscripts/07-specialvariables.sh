#!/bin/bash

### special variables ###

echo "all args passed to the script $@"

echo "all args passed to the script as word: $*" ## word by word when used $*

echo "Number of args passed to the script $#"

echo "First variable passed : $1"

echo "name of the script : $0"

echo "Realpath of the script: $(realpath $0)"

echo "Who is the running the current script : $USER"

echo "Directory of the current script $PWD"

echo "Home directory of the current user : $HOME"

echo "PID of the current scipt : $$"

sleep 3 &

echo "PID of the command running in background now: $!"

wait $! # script will wait untill command completes

echo "Line number: $LINENO"

echo "Status code of the previous command: $?"


echo "total time of the script execution: $SECONDS seconds"

export COURSE="SHELL PAVAN SCRIPTING"