#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access...."
    exit 1
fi

git fetch origin

git reset origin/main --hard

sudo chmod -R 777 *

echo "Successfully Git Pull is Completed with Executing Permissions"