#!/bin/bash
# Leo el archivo ip_inicio.txt con contiene las IPs limpias 
# Escaneo cada una de las IPs que tengo en la lista para averiguar cual tiene el puerto 445 abierto
# Creo un archivo con el resultado del escaneo por cada IP de la lista
while read -r ip 
do 
	for item in ${ip[*]} 
	do 
		sudo masscan -v -sS $item/16 --rate 10000 -p445 >> $item".txt"
	done
done <<< $(cat  ip_inicio.txt)
