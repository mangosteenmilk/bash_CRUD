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


	echo Item Number: $item_num
	echo Item Name: $item_name
	echo Simple Name: $simple_name
	echo Unit Price: $unit_price
	echo Quantity: $cur_qty / $max_qty
	echo Description: $item_desc
else
	echo "ERROR: item $item_num not found"
fi

echo ''
echo ''
