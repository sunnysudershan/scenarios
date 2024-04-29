#! /bin/bash
#oc login
#oc adm taint node master01 node=worker:NoSchedule
#oc adm taint node master02 node=worker:NoSchedule
#oc adm taint node master03 node=worker:NoSchedule
oc apply -f oauth.yaml
oc delete groups --all
oc label node master01 trek=star --overwrite=true
echo "-----------------Creating Bluewills Project and Resources------------"
oc new-project bluewills
oc new-app --name=rocky demo/openshift-image
oc expose svc rocky
sleep 5


echo "-----------------Creating Bluewills area51 and Resources------------"
oc new-project area51
oc new-app --name=oxcart demo/openshift-image
oc expose svc oxcart --hostname=oxcart.apps.ocp4.example.com
sleep 5

echo "-----------------Creating Lerna Project and Resources------------"
oc new-project lerna
oc new-app --name=hydra demo/openshift-image
sleep 5

echo "-----------------Creating Gru Project and Resources------------"
oc new-project gru
oc new-app --name=scala demo/openshift-image  
sleep 5

echo "-----------------Creating math Project and Resources------------"
oc new-project math
oc new-app --name=qed demo/openshift-image
oc expose svc qed --hostname=qed.apps.ocp4.example.com
sleep 5

echo "-----------------Creating Apples Project and Resources------------"
oc new-project apples
oc new-app --name oranges demo/crashimage
sleep 3
oc delete svc oranges
oc create -f service.yaml
oc expose svc oranges --hostname=oranges.apps.ocp4.example.com
sleep 5

echo "-----------------Creating path-finder Project and Resources------------"
oc new-project path-finder
oc create --save-config -f deployment.yaml
oc expose deployment voyager --port 8080
oc create --save-config -f ingress.yaml
sleep 5

echo "-----------------Creating Atlas Project and Resources------------"
oc new-project atlas
oc create -f deployment2.yml
oc expose deployment mercury --port 8080
oc expose svc mercury --hostname=mercury.apps.ocp4.example.com

