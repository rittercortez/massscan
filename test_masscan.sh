#!/bin/bash
while read -r ip 
do 
	for item in ${ip[*]} 
	do 
		sudo masscan -v -sS $item/16 --rate 10000 -p445 >> $item".txt"
	done
done <<< $(cat  ip_inicio.txt)
