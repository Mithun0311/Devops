#!/bin/bash

read -p "Enter the file name to pass: " file
read -p "Enter the age to check: " check

# Remove header (first line) and save to a temporary file
sed '1d' "$file" > temp

none_found=true
while read -r line
do
    emp_age=$(echo "$line" | awk '{print $3}')
    emp_name=$(echo "$line" | awk '{print $2}')
    
    if [ "$emp_age" -gt "$check" ]; then
        echo "$emp_name"
        none_found=false
    fi
done < temp

if $none_found; then
    echo "None of the employees are older than"
fi
