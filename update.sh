#/bin/bash
#update a record

function getuserid 
{	
	records=$(cut -d: -f1 db.dat | grep -n "$search" | cut -d: -f1)
}
function getaddress
{
	records=$(cut -d: -f2 db.dat | grep -n "$search" | cut -d: -f1)
}
function getphone
{
	records=$(cut -d: -f3 db.dat | grep -n "$search" | cut -d: -f1)
}

function getemail
{
	records=$(cut -d: -f1 db.dat | grep -n "$search" | cut -d: -f1)
}

function general
{
	records=$(grep -n "$search" db.dat | cut -d: -f1)
}

echo "how do you want to find the record?"
echo "(u) user"
echo "(a) address"
echo "(p) phone number"
echo "(e) email address"
echo "(g)gerneral shearch"
echo "(c) cancle "
echo -n ">"

read choice


while true; do
 
	while true; do
		echo -n "Please enter your search term::"
		read search

		if ! [ -z $search ]; then
			break
		fi
	done



	#searches the appropriate colums
	if [[ "$choice" = "u" ]] ; then 
		getuserid
		break

	elif [[ "$choice" = "a" ]] ; then
		getaddress
		break

	elif [[ "$choice" = "p" ]] ; then
		getphone
		break
	
	elif [[ $choice = "e" ]] ; then
		getemail
		break
	
	elif [[ $choice = "g" ]] ; then
		general
		break	
	elif [[ $choice = "c" ]] ; then
		echo Leaveing update
		exit 0
	else	
		echo "Pleaes enter a valid input"
		read choice
	fi

done

#if no record exists
if [ -z "$records" ]; then
	echo "No matches found"
	exit 2
fi
#prints out the matched lines
line=1
for i in $records; do
	echo -n $i:
	sed -n "$i"p db.dat
done

echo
echo "Please select the line number of the record you would like to edit"
echo -n ">"

read choice
if [ -z $choice ] ; then 
	echo please enter a number
 
elif [ $choice -ne $choice ] 2>/dev/null ; then
	echo please enter a number
fi

#prints the line
sed -n 1p db.dat
record=$(sed -n "$choice"p db.dat)
echo $record

while true; do 
	echo "what field would you like to change?"
	echo "(u) user"
	echo "(a) address"
	echo "(p) phone number"
	echo "(e) email address"
	echo "(c) cancel"
	
	read input
	
	if [ $input = "u" -o  $input = "a" -o $input = "p" -o $input = "e" ]; then
		break
	elif [ $input = "c"] ; then
		echo "leaving update (clean)"
		exit 0 
	fi
	echo "Pleaes enter a valid input"

done

while true; do
	echo "what would you like to change it to?"
	read update

	if ! [ -z $update ] 2>/dev/null; then
		break
	fi
done


if [[ "$input" = "u" ]] ; then 
	replace=$(echo $record| cut -d: -f1)

elif [[ "$input" = "a" ]] ; then
	replace=$(echo $record| cut -d: -f2)

elif [[ "$input" = "p" ]] ; then
	replace=$(echo $record| cut -d: -f3)

elif [[ $input = "e" ]] ; then
	replace=$(echo $record| cut -d: -f4)

elif [[ $input = "c" ]] ; then
	echo "Leaving Update. Bye! (clean)"
	exit 0
fi


sed s/"$replace"/"$update"/ db.dat > temp
cp "temp" "db.dat"
rm -f "temp"
echo "updating recored"
record=$(sed -n "$choice"p db.dat)
echo "The record has been updated"
sed -n "$choice"p db.dat

exit 0

