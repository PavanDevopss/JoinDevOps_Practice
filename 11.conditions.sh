#!/bin/bash

user_id=$(id -u)

if  [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

echo "proceeding..."

apt update -y

if [ $? -ne 0 ]; then
    echo "apt failed to update the system"
    exit 1
else
    echo "apt updated successfully"
fi