# Delete Indices Array Elements

### IMPORTANT

Theres a better way to do this using bashs reference variables introduced in 4.3 `local -n`, but I did it this way so that it can be portable to other shell scripting languages / versions. 

### Input

1st: length of array containing elements you want to remove (ik this is weird, but it makes since if you read the code)

2nd: array containing element to be removed

3rd: target array

### Example

```bash
# shellcheck source=libraries/delete_indices_array_element.sh 
. "$sauce"/delete_indices_array_element.sh "${sauce}"

elements_to_remove=("foo" "bar")
target_array=("foo" "yes" "no" "I hate flutter" "bar")

# new array gets returned 
return_array="$(delete_indice_array_elements "${#elements_to_remove[@]}" "${elements_to_remove[@]}" "${target_array[@]}")"

printf "New Array With Elements Removed\n"

printf "%s | " "${return_array[@]}"
```
