#!/bin/bash
R=$(docker network inspect -f '{{json .IPAM.Config}}' kind | jq -r .[1].Subnet)
jq -n --arg R "$R" '{"R":$R}'

