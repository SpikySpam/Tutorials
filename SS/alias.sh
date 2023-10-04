#!/bin/bash

# SET ALIASSES
alias cdss='cd $TF_VAR_PATH; clear'
alias p='podman'
alias k='kubectl'
alias t='terraform'
alias ti='t init'
alias ta='t apply'
alias taa='ta -auto-approve'
alias taar='terraform apply -refresh=false -auto-approve'
alias tp='t plan'
alias tpr='tp -refresh=false'
alias td='t destroy'
alias tda='td -auto-approve'
alias tdar='tda -refresh=false'
alias tv='t validate'
alias tr='t refresh'