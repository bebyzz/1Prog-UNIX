#/bin/bash
#will rearrange the database, in alphabetical order
#must take the filename in as first argument

if [ $# -ne 1 ]
then
	echo "Must enter only one argument."
	exit 1
fi

file=$1
sort "$file" > db.txt
cat db.txt > "$file"
rm -f db.txt
echo "Reordered"
exit 0
