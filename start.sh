#bin/bas
#start menu

while true; do
clear
echo "Hello! Please selecte one of the options bellow, followed by [ENTER]"
echo "(1)Find a record"
echo "(2)Add a new record"
echo "(3)Update a record"
echo "(4)Remove a reocrd"
echo "(q)Quit"
echo "Selection::\c"
read choice

case "$choice" in
1)
	echo "launching find.sh"
	echo "Would you like to search"
	echo "(u)Username"
	echo "(a)Address"
	echo "(p)Phone Number"
	echo "(e)Email"
	echo "Selection::\c"
	read what
	echo "search term::\c"
	read who
	sh ./find.sh $what $who
	;;
2)
	echo "launching Add a new record"
	;;
3)
	echo "launching Update a record "
	;;
4)
	echo "launching Remove a record"
	;;
q)
	echo "Good bye (clean)"
	exit 0
	;;
*)
	echo "please select a valid option"
	;;
esac

echo "\nWould you like to continue? ('n' to quit anything else to continue)\n>\c"
read choice
 
if [ $choice = "n" ]; then
	echo "Good bye (clean)"
	exit 0
fi

done
