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
esac