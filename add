#!/bin/bash

# make sure file exists and is
# writeable before trying to add to it
if [ -f db.dat ] && [ -w db.dat ]
then
    echo "Adding a new record"
    echo -n "Press any key to continue or 'q' to quit "
    read response
    while [ "$response" != "q"  ]
    do
        echo -n "Enter the name you wish to add followed by [Enter]"
        read name
        echo -n "Enter their address followed by [Enter]"
        read address
        echo -n "Enter their phone number followe by [Enter]"
        read phone
        echo -n "Enter their email address followed by [Enter]"
        read email
        echo "$name:$address:$phone:$email" >> db.dat
        echo "Do you wish to add another contact?"
        echo -n "Press any key to continue or 'q' to quit "
        read response
    done
else
    echo "file does not exist"
fi
