#!/bin/bash

user_id=$(id -u)
logs_folder="/var/logs/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access...."
    exit 1
fi

mkdir -p $logs_folder # it creates if not existing if exists then nothing will happen !!

echo "Script started executing at $(date +"%F %T")" &>> $logs_file

validate(){
    if [$1 -ne 0 ]; then
        echo "$2 ...Failed" | tee -a $logs_file
        exit 1
    else
        echo "$2 ...Success" | tee -a $logs_file
    fi
}

for package in $@
do 
    echo "Going to install : ${package}"
    dnf install $package -y &>> $logs_file
    validate $? "Installing ${package}"
done

echo "Script execution completed at $(date +"%F %T"})" &>> $logs_file