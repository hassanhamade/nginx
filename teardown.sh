#!/usr/bin/bash

printf "namespace: "
read NAMESPACE

kubectl delete namespace ${NAMESPACE} 
