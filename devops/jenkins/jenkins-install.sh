#!/bin/sh

helm install --name-template jenkins --set persistence.existingClaim=jenkins --set master.serviceType=NodePort --set master.nodePort=30808 -n devops --values jenkins-values.yaml stable/jenkins

export NODE_PORT=$(kubectl get --namespace devops -o jsonpath="{.spec.ports[0].nodePort}" services jenkins)
export NODE_IP=$(kubectl get nodes --namespace devops -o jsonpath="{.items[0].status.addresses[0].address}")