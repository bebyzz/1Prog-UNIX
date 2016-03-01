#/bin/bash
#will take in webmail name, database file and output file name as arguments
#will print out into a file all of the entries with matching webmail name

if [ $# -ne 3 ]
then
	echo "Usage: ./location.sh webmail_name input_file_name output_file_name."
	exit 1
fi

#make sure webmail name entered is in the database file
grep -q "$1" db.dat
if [ $? -eq 0 ]
then
   grep -n "$1" $2 >$3
fi
exit 0
