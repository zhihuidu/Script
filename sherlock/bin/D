#grep "$1" $2 | tr '\n' ' ' | se-e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
echo "Graph File"
grep "Reading File takes" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
echo " "
echo " "
echo "Sorting Edges takes"
grep "Sorting Edges takes" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
echo " "
echo " "
echo "graph BFS takes"
grep "graph BFS takes" $1  | tr '\n' ' ' | sed -e 's/[^0-9.]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /\n/g'
