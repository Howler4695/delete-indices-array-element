#!/bin/bash

contains_array_element() {
    local match="$1"
    shift
    local target_array_args=("$@")
    for element in "${target_array_args[@]}"; do 
        if [ "$element" = "$match" ]; then 
            echo 0
            return
        fi
    done
    echo 1
}
