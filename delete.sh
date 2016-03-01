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
	sed -n "$line p" "db.dat" 1> match.txt
	grep -q "$1" match.txt
	rm -f match.txt
	if [ $? -ne 0 ]
	then
		echo "Line number entered does not match matched lines."
		exit 1
	else 
		#remove $line from the database file
		#sed -i "$line d" "db.dat"
		sed "$line d" "db.dat" > "temp"
		cp "temp" "db.dat"
		rm -f "temp"
		echo "Entry removed from database."
		exit 0
	fi
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
