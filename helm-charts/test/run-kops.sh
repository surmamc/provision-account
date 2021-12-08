#!/usr/bin/env bash

# Run e2e tests

set -o errexit


kops create cluster --name=k8s-cluster.k8s.local \
  --state=s3://cz-kops-base \
  --cloud=aws \
  --vpc=vpc-d4b483af \
  --zones="us-east-1a,us-east-1b" \
  --subnets="subnet-3574f87f,subnet-80b149dc" \
  --node-count=2 \
  --container-runtime=containerd \
  --kubernetes-version="1.20.9" \
  --dry-run \
  -oyaml > erase.yaml

