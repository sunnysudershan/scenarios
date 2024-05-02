#!/usr/bin/bash

if oc get project -o jsonpath='{.items[*].metadata.name}' | grep -q atlas
then
  echo "==================================================================="
  echo "PROJECT: atlas"
  echo
  oc get pods -o custom-columns="POD NAME:.metadata.name,IP ADDRESS:.status.podIP" -n atlas
  echo
  oc get svc -o custom-columns="SERVICE NAME:.metadata.name,CLUSTER-IP:.spec.clusterIP" -n atlas
  echo
  oc get route -o custom-columns="ROUTE NAME:.metadata.name,HOSTNAME:.spec.host,PORT:.spec.port.targetPort" -n atlas
  echo
  echo "==================================================================="
fi

if oc get project -o jsonpath='{.items[*].metadata.name}' | grep -q bluewills
then
  echo "PROJECT: bluewills"
  echo
  oc get pods -o custom-columns="POD NAME:.metadata.name" -n bluewills
  echo
  echo "==================================================================="
fi
