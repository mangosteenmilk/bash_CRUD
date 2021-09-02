#!/bin/bash

read -p "Enter an item number: " item_num

if [[ -e $item_num.item ]]
then

	#reading in 
	{
	read item_nameOG simple_name 
	read unit_price cur_qty max_qty 
	read item_desc
	} < $item_num.item

	echo [$(date '+%Y-%m-%d %H:%M:%S')] DELETED:$item_num - $item_nameOG - $simple_name - $cur_qty >> queries.log
	rm $item_num.item
	echo File has been deleted.

else
	echo "ERROR: item $item_num not found"
fi
echo ''
echo ''
