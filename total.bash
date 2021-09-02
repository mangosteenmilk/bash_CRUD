#!/bin/bash

read -p "Enter an item number: " item_num

if [[ -e $item_num.item ]]
then
	#reading in 
	{
	read item_name simple_name 
	read unit_price cur_qty max_qty 
	read item_desc
	} < $item_num.item
	
	A=$unit_price
	B=$cur_qty
	
	total=$(echo "scale=2;$A*$B"|bc )
	echo "$item_num - $simple_name - "$total" total"
else
	echo "ERROR: item $item_num not found"
fi
echo ''
echo ''
