#!/bin/sh
helm install chartmuseum -n devops -f chartmuseum-conf.yaml stable/chartmuseum
helm plugin install https://github.com/chartmuseum/helm-push

helm lint charts/backend-scm/
helm push charts/backend-scm/ questcode

helm lint charts/backend-user/
helm push charts/backend-user/ questcode

helm lint charts/frontend/
helm push charts/frontend/ questcode

helm repo update
