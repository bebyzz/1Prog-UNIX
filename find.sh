#/bin/bash
#find the user

#checks for valid arguments
#needs to have atleast two arguemtns passed
if [ $# -lt 2 ]; then
	echo "Too few argumetns passed to "$0" "  1>&2
	exit 1
else
	for i in $@;do
		#$1 is the search colum >$2 are search terms
		if [ $i == $1 ];then 
			continue
		fi
		search=$search" "$i
	done
fi

function getuserid 
{
	records=$(cut -d: -f1 db.dat | grep -n "$search" | cut -d: -f1)
	#for debuging
	#echo $recordsi
}

function getaddress
{
	records=$(cut -d: -f2 db.dat | grep -n "$search" | cut -d: -f1)
	#for debuging
	#echo $recordsi
}

function getphone
{
records=$(cut -d: -f3 db.dat | grep -n "$search" | cut -d: -f1)
	#for debuging
	#echo $recordsi
}

function getemail
{
	records=$(cut -d: -f1 db.dat | grep -n "$search" | cut -d: -f1)
	#for debuging
	#echo $recordsi
}


#searches the appropriate colums
if [[ "$1" = "u" ]] ; then 
#if [ $1 == "user" -o $1 -eq 1 ] then 
	getuserid
	
elif [[ "$1" = "a" ]] ; then
#elif [ $1 == "address" -o $1 -eq 2 ] then
	getaddress

elif [[ "$1" = "p" ]] ; then
#elif [ $1 == "phone" -o $1 -eq 3 ]; then
	getphone

elif [[ $1 = "e" ]] ; then
#elif [ $1 == "email" -o $1 -eq 4 ]; then
	getemail
	
else
	echo "Select 'user' 'address' 'phone' 'email'"	

fi
 
##final echo
#if no record exists
if [ -z $records ]; then
	echo "No matches found"
	exit 2
fi
#prints out the matched lines
for i in $records; do
	sed -n "$i"p db.dat
done

exit 0
