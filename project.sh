#!/bin/bash
oc login
oc new-project demo

oc new-app --name openshift-image --docker-image quay.io/abdulmajeed86/hello-openshift-rhel8
oc new-app --name crashimage --docker-image quay.io/abdulmajeed86/myimage

sleep 20