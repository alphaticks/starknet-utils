#!/bin/bash
set -e

case $1 in 
    "cairo-run" )
        shift 1
        /usr/local/bin/cairo-run $@
        ;;
    "cairo-compile" )
        shift 1
        /usr/local/bin/cairo-compile $@
        ;;
    "starknet" )
        shift 1
        /usr/local/bin/starknet $@
        ;;
    "starknet-compile" )
        shift 1
        /usr/local/bin/starknet-compile $@
        ;;
esac
