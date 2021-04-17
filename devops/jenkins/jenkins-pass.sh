#!/bin/sh

printf $(kubectl get secret --namespace devops jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
