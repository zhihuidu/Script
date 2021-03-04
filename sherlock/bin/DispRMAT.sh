#grep "$1" $2 | tr '\n' ' ' | se-e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
echo "RMAT Generate Graph"
grep "generat" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'

echo " "
echo " "
echo " Graph sorting"
grep "sorting" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
echo " "
echo " "
echo "RMAT Graph BFS"
grep "graph BFS takes" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'


