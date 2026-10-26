#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run the script with sudo access...."
    exit 1
fi

validate(){
    if [$1 -ne 0 ]; then
        echo "$2 ...Failed"
        exit 1
    else
        echo "$2 ...Success"
    fi
}

echo "proceding..."
dnf install nginx -y
validate $? "Nginx Installation"

# if [$? -ne 0 ]; then
#     echo "Nginx is not installed successfully" ---> is replaced with the function of validate
#     exit 1
# else
#     echo "Nginx is successfully installed"
# fi

echo "proceding..."
dnf install mysql -y
validate $? "Mysql Installation"