#!bash

files=$(config files)

if test -z "$files"; then
  for i in $(git status --short | awk 'match($1, "M"){print $2}' |  grep -P '\.(yml|yaml)$'); do
    run_task linux/lint file $i; 
  done
  for i in $(git status --short | awk 'match($1, "A"){print $2}' |  grep -P '\.(yml|yaml)$'); do
    run_task linux/lint file $i; 
  done
else
  for i in $files; do 
    run_task linux/lint file $i; 
  done
fi

