#/bin/bash
#find and delete from text based database
#assuming $1 is the string we are trying to find
#CASE SENSITIVE, deletes entire contents otherwise

if [ $# -ne 1 ]
then
	echo "Must enter only one argument"
	exit 1
fi

#test if string is in file
grep -q "$1" db.dat
if [ $? -eq 0 ]
#if string is found
then
	#find all instances of the string to be deleted	
	grep -n "$1" db.dat
	echo "Enter the line number of the entry you would like to delete"
	read line
	#remove $line from the database file
	sed -i "$line d" "db.dat"
	echo "Entry removed from database."
	exit 0
else
#if string is not found in file
	echo "Not found in database."
	exit 1
fi


#function deleteempty
#{
	#delete empty lines in database
	#sed -n '/^$/d' db.dat
#}
