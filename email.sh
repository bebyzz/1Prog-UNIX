#/bin/bash
#will take in webmail name, database file and output file name as arguments
#will print out into a file all of the entries with matching webmail name

# if [ $# -ne 3 ]
# then
# 	echo "Usage: ./location.sh webmail_name input_file_name output_file_name."
# 	exit 1
#fi

#make sure webmail name entered is in the database file
# grep -q "$1" db.dat
# if [ $? -eq 0 ]
# then
#    grep -n "$1" $2 >$3
# fi
# exit 0


while true; do
	echo "Please enter your name"
	echo -n ">"
	read search
	if ! [ -z $search ] ; then
		break
	fi
done 

records=$(cut -d: -f1 db.dat | grep -n "$search" | cut -d: -f1)

#if no record exists
if [ -z "$records" ]; then
	echo "No matches found"
	exit 2
fi
#prints out the matched lines
for i in $records; do
	echo -n "$i:  "
	sed -n "$i"p db.dat
done

echo "Please select the appropriate line number"
read line

record=$(sed -n "$line"p db.dat)

email=$(echo $record| cut -d: -f4 | cut -d@ -f2)

records=$(cut -d: -f4 db.dat | grep -n "$email" | cut -d: -f1)
records=$(echo $records | sed s/$line// )

if [ -z "$records" ]; then
	echo "No one else has your email address"
	exit 2
fi
#prints out the matched lines
echo
echo "These people have the same email provider as you"
for i in $records; do
	echo -n "$i:  "
	sed -n "$i"p db.dat
done

exit 0