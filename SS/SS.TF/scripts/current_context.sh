#!/bin/bash

R=$(kubectl config current-context)
jq -n --arg R "$R" '{"R":$R}'