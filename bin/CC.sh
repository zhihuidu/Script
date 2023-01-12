#grep "$1" $2 | tr '\n' ' ' | se-e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'



grep "read file" $1  | cut -d "=" -f2|rev| cut -d "/" -f1 |rev
#grep "read file" $1  | cut -d "/" -f4 
grep "cc: " $1  | cut -d ":" -f5 
#grep "Total execution time" $1  | cut -d "=" -f2 
#grep "Total execution time" $1   |sed -e 's#.*=\(\)#\1#' 
#grep "Total execution time" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
