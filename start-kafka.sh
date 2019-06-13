#!/bin/bash
echo "Iniciando zookeepers"
for file in $(ls ./dc | grep zookeeper)
do
    echo $file
    oc create -f ./dc/$file
done

sleep 40

echo "Iniciando kafkas"
for file in $(ls ./dc | grep kafka )
do 
    echo $file
    oc create -f ./dc/$file
done

sleep 25

echo "Iniciando orderers"
for file in $(ls ./dc | grep orderer )
do 
    echo $file
    oc create -f ./dc/$file
done

sleep 25

echo "Iniciando peers"
for file in $(ls ./dc | grep peer )
do 
    echo $file
    oc create -f ./dc/$file
done
