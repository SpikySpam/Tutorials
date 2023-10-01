#!/bin/bash

if [ $TF_VAR_OSTYPE == $TF_VAR_OSTYPE_LINUX ]; then
  sensible-browser $1
elif [ $TF_VAR_OSTYPE == $TF_VAR_OSTYPE_WINDOWS ]; then
  start $1
fi
