#!/bin/bash
for deploy in $(oc get deploymentconfig | grep -v NAME | grep -iE 'orderer' |awk '{print $1}')
do
    echo "Removendo deploy: $deploy"
    oc delete deploymentconfig $deploy
done  