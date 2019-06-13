#!/bin/bash
echo "Parando zookeepers"
for file in $(ls ./dc | grep zookeeper)
do
    echo $file
    oc delete -f ./dc/$file
done

echo "Parando kafkas"
for file in $(ls ./dc | grep kafka )
do 
    echo $file
    oc delete -f ./dc/$file
done

echo "Parando Peers"
for file in $( ls ./dc | grep peer)
do
	echo $file
	oc delete -f ./dc/$file
done

echo "Parando Orderers"
for file in $( ls ./dc | grep orderer)
do
	echo $file
	oc delete -f ./dc/$file
done


