#!/bin/bash

START_TIME=$(date +%s)

echo "script started execution at: $START_TIME"

sleep 10

END_TIME=$(date +%s)
echo "script ended execution at: $END_TIME"

TOTAL_TIME=$(($END_TIME - $START_TIME))

echo "Total time taken for this script execution is $TOTAL_TIME seconds"