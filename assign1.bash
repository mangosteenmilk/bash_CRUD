#!/bin/bash

while true; do
	echo "Enter one of the following actions or press CTRL-D to exit."
	echo "C - create a new inventory item"
	echo "R - read an existing inventory item"
	echo "U - update an existing inventory item"
	echo "D - delete an existing inventory item"
	echo "T - calculate total value of an inventory item"
	if ! read ans; then 
		break
	fi
	
	case $ans in 
		C) ./create.bash 
		   ;;
		c) ./create.bash
		   ;;
		R) ./read.bash
		   ;;
		r) ./read.bash
		   ;;
		U) ./update.bash
		   ;;
		u) ./update.bash
		   ;;
		D) ./delete.bash
		   ;;
		d) ./delete.bash
		   ;;
		T) ./total.bash
		   ;;
		t) ./total.bash
		   ;;
		*) echo ERROR: invalid option
	esac
done

