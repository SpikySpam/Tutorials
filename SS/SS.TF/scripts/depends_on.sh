#!/bin/bash

kind=${1^^}
namespace=$2
name=$3

if [ -z $name ]
then
  if [ "$kind" = "PODS" ]; then
    R=$(kubectl get $kind -n $namespace -o jsonpath='{.items[0].metadata.namespace}')
  else
    R=$(kubectl get $kind $namespace -o jsonpath='{.metadata.name}')
  fi
else
  R=$(kubectl get $kind $name -n $namespace -o jsonpath='{.metadata.name}')
fi

jq -n --arg R "$R" '{"R":$R}'
