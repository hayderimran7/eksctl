#!/bin/bash -e

kubectl get secret \
$(kubectl get serviceaccount vault-reviewer -o jsonpath={.secrets[0].name}) \
-o jsonpath={.data.token} | base64 -D -
export REVIEWER_TOKEN=$(kubectl get secret \
$(kubectl get serviceaccount vault-reviewer \
-o jsonpath={.secrets[0].name}) -o jsonpath={.data.token} | base64 -D -)
