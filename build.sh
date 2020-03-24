#!/usr/bin/bash

USER=vmware
PASSWORD='VMware1!'
REGISTRY=harbor.az-rbx.cloud-garage.net
LIBRARY=example
CONTAINER=nginx
RELEASE=latest

cd artifacts

docker build -t ${CONTAINER} .
docker tag nginx ${REGISTRY}/${LIBRARY}/${CONTAINER}:${RELEASE}
docker login ${REGISTRY} -u ${USER} -p {PASSWORD}
docker push ${REGISTRY}/${LIBRARY}/${CONTAINER}:${RELEASE}
