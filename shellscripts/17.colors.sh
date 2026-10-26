#!/bin/bash

user_id=$(id -u)
logs_folder="/var/logs/shell-practice"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access...."
    exit 1
fi

mkdir -p $logs_folder # it creates if not existing if exists then nothing will happen !!

echo "Script started executing at $(date +"%F %T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ...${R}Failed${N}" | tee -a $logs_file
        exit 1
    else
        echo -e "$2 ...${G}Success${N}" | tee -a $logs_file
    fi
}

for package in $@
do 
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install : ${package}"
        dnf install $package -y &>> $logs_file
        validate $? "Installing ${package}"
    else
        echo -e "${package} already installed ...${Y}Skipping${N}"
    fi
done

echo "Script execution completed at $(date +"%F %T")" &>> $logs_file