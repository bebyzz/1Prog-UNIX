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
echo -n "Selection::"
read choice

case "$choice" in
1)
	echo "launching find.sh"
	echo "Would you like to search"
	echo "(u)Username"
	echo "(a)Address"
	echo "(p)Phone Number"
	echo "(e)Email"
	echo -n "Selection::"
	
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
	echo "Quiting the program (clean)"
	exit 0
	;;
*)
	echo "please select a valid option"
	;;
esac
echo "would you like to continue? (y/n)"

read choice 
if [$choice == 'n']; then
	echo "Good by(clean)"
	exit 0
fi

done
