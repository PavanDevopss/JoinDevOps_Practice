#!/bin/bash

echo "Please enter the marks"
read marks

if [ $marks -lt 33 ]; then
    echo "fail"
elif [ $marks -lt 50 ]; then
    echo "third class"
elif [ $marks -lt 60 ]; then
    echo "second class"
elif [ $marks -lt 80 ]; then
    echo "first class"
else 
    echo "Distinction"
fi

echo "End"