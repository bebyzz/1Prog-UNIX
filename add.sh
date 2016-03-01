#!/bin/bash


if [ -f db.dat ] && [ -w db.dat ]
then
    echo "Adding a new record"
    echo -n "Press any key to continue or 'q' to quit "
    read response
    while [ "$response" != "q"  ]
    do
        echo -n "Enter the name you wish to add followed by [Enter]"
        read name
        if [[ -z "$name" ]]
        then
            printf "No input"
            exit 1
        fi

        echo -n "Enter the address followed by [Enter]"
        read address
        if [[ -z "$address" ]]
        then
            echo "No input"
            exit 1
        fi

        echo -n "Enter the phone number followed by [Enter]"
        read phone
        if [[ -z "$phone" ]]
        then
            echo "No input"
            exit 1
        fi

        echo -n "Enter the email address followed by [Enter]"
        read email
        if [[ -z "$email" ]]
        then
            echo "No input"
            exit 1
        fi

        echo "$name:$address:$phone:$email" >> db.dat
        echo "Do you wish to add another contact?"
        echo -n "Press any key to continue or 'q' to quit "
        read response
    done
    exit 0

else
    echo "file does not exist"
    exit 1
fi
