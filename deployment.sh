#!/usr/bin/bash

PASSWD='VMware1!'

printf "namespace: "
read NAMESPACE

exec-kubectl() {
	cat ${1} | sed -e "s/\$\${namespace}/${NAMESPACE}/g" | kubectl create -f -
}

# Create Namespace
exec-kubectl 1-create_namespace.yaml

# Deploy Nginx
exec-kubectl 2-deploy_nginx.yaml 

# Exposer SVC
exec-kubectl 3-expose_nginx.yaml 

# Create route
oc login -u root -p ${PASSWD} https://console.openshift-311.cpod-sddc-arch.az-rbx.cloud-garage.net:8443/
oc project ${NAMESPACE}
oc expose service nginx
oc get route
