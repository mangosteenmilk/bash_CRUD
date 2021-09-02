#!/bin/bash

printf "Item number: "
read item_num
   
if [[ -e "$item_num.item" ]]
then

	#reading in
	{
	read item_nameOG simple_nameOG
	read unit_priceOG cur_qtyOG max_qtyOG
	read item_descOG
	} < $item_num.item

	#------------------------------------------
	printf "Item name: "; read item_name
	if [[ $item_name == '' ]]
	then
	        item_name=$item_nameOG
	else
		printf '' 
	fi
	#------------------------------------------
        printf "Simple name: "; read simple_name
        if [[ $simple_name == '' ]]
        then
                simple_name=$simple_nameOG
        else
                printf ''
        fi
	#------------------------------------------
        printf "Unit price: "; read unit_price
        if [[ $unit_price == '' ]]
        then
                unit_price=$unit_priceOG
        else
                printf ''
        fi
	#------------------------------------------
        printf "Current quantity: "; read cur_qty
        if [[ $cur_qty == '' ]]
        then
                cur_qty=$cur_qtyOG
        else
                printf ''
        fi
	#------------------------------------------
        printf "Maximum quantity: "; read max_qty
        if [[ $max_qty == '' ]]
        then
                max_qty=$max_qtyOG
        else
                printf ''
        fi
	#------------------------------------------
        printf "Description: "; read item_desc
        if [[ $item_desc == '' ]]
        then
                item_desc=$item_descOG
        else
                printf ''
        fi
	#------------------------------------------

	{
	echo $item_name $simple_name
	echo $unit_price $cur_qty $max_qty
	echo $item_desc
	} > $item_num.item

	echo "The file has been updated"
	echo ''
	echo [$(date '+%Y-%m-%d %H:%M:%S')] UPDATED: $item_num - $item_name - $cur_qty / $max_qty >> queries.log
else
	echo "ERROR: item $item_num not found"; ./update.bash
fi       
