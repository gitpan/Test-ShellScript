#!/bin/bash

## Testing aware output
echo "TEST: params=$*"
echo "TEST: executed=false"

## execute the command
[[ ! -z $1 ]] && echo "TEST: executed=true" && $*

## Testing aware output
echo "TEST: output=$?"
