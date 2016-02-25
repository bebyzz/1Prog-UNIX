#/bin/bash
#find and delete from text based database
#assuming $1 is the string we are trying to find
#CASE SENSITIVE, deletes entire contents otherwise

<<<<<<< HEAD
=======
if [ $# -ne 1 ]
then
	echo "Must enter only one argument"
	exit 1
fi

>>>>>>> master
#test if string is in file
grep -q "$1" db.dat
if [ $? -eq 0 ]
#if string is found
then
	#find first instance of string to be deleted, save to $line
	line=$(grep -n "$1" db.dat)
	#remove all but number from line
	line=${line%%:*}
	#remove $line from the database file
	sed -i "$line d" "db.dat"
	echo "Entry removed from database."
	exit 0
else
#if string is not found in file
	echo "Not found in database."
	exit 1
fi

<<<<<<< HEAD

=======
#This might be helpful later on if we need more functions to add to the project.
>>>>>>> master
#function deleteempty
#{
	#delete empty lines in database
	#sed -n '/^$/d' db.dat
#}
