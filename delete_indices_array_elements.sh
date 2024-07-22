#!/bin/bash

# shellcheck source=contains_array_element.sh
. "contains_array_element.sh"

delete_indice_array_elements() {
    local elements_to_remove_length="$1"
    local shift_length=$(( $1 + 1 ))
    local elements_to_remove=("$@")
    shift $shift_length
    local return_array=("$@")

    # fix elements to remove
    for i in "${!elements_to_remove[@]}"; do
        if [ "$i" -eq 0 ] || [ "$i" -gt "$elements_to_remove_length" ]; then
            unset -v "elements_to_remove[i]"
        fi
    done

    # deletes targets
    local return_array_length=${#return_array[@]}
    declare -i deletions=0
    for i in "${!return_array[@]}"; do
        if [ "$(contains_array_element "${return_array[i]}" "${elements_to_remove[@]}")" -eq 0 ]; then
            unset -v "return_array[i]"
            deletions+=1
        fi
    done

    # if all elements get removed, return_array throws when being printed. This removes that possibility
    if [ "$return_array_length" -eq $deletions ]; then
        return_array+=("")
    fi

    # will return array with updated indices
    echo "${return_array[@]}"
}
