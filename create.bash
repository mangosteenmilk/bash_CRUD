#!/bin/bash

read -p "Item number: " item_num
notNum='^[0-9]'
if [[ "$item_num" =~ $notNum ]]
then
	if [[ "$item_num" -ge 1000 && "$item_num" -le 9999 ]]
	then	
		printf '' 
	else
		echo "Enter a four digit number"
		./create.bash
	fi
else
	echo "That is not a number"
	./create.bash
fi
#------------------------------------------
read -p "Item name: " item_name

read -p "Simple name: " simple_name
#------------------------------------------
read -p "Unit price: " unit_price
if ! [[ "$unit_price" =~ $notNum ]]
    then 
        echo "integers only, start over" >&2; ./create.bash
fi
#------------------------------------------
read -p "Current quantity: " cur_qty
if ! [[ "$cur_qty" =~ $notNum ]]
    then
        echo "integers only, start over" >&2; ./create.bash
fi
#------------------------------------------
read -p "Maximum quantity: " max_qty
if ! [[ "$max_qty" =~ $notNum ]]
    then
        echo "integers only, start over" >&2; ./create.bash
fi
#------------------------------------------
read -p "Description: " item_desc
#------------------------------------------

if [[ -e "$item_num.item" ]]
then
	echo "ERROR: item $item_num already exists"
else
	{
	echo $item_name $simple_name
	echo $unit_price $cur_qty $max_qty
	echo $item_desc
	} > $item_num.item
	
	if [[ -e "$queries.log" ]]
	then	
	chmod 700 $item_num.item
	echo "File created."
	echo [$(date '+%Y-%m-%d %H:%M:%S')] CREATED: $item_num - $item_name - $cur_qty / $max_qty >> queries.log
	else
		touch queries.log
		chmod 700 $item_num.item
	        echo "File created."
       		 echo [$(date '+%Y-%m-%d %H:%M:%S')] CREATED: $item_num - $item_name - $cur_qty / $max_qty >> queries.log
	fi
fi

echo ''

./assign1.bash
