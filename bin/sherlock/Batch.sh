for file in `find  ~/Adata/ |egrep '\.nde$'`
do

rm -f tmpc
for (( c=0; c<$1;c++))
do
echo "./truss_decomposition_parallel < $file"
./minsearch < $file 2>>tmpc
done
./ExeTime.sh tmpc >tmp

sum=$(paste -sd+ tmp | bc)
googlesearch=$(echo "$sum / $1" | bc)


rm -f tmpm
for (( c=0; c<$1;c++))
do
echo "./myminsearch < $file"
./minsearch < $file 2>>tmpm
done
./ExeTime.sh tmpm >tmp

sum=$(paste -sd+ tmp | bc)
minsearch=$(echo "$sum / $1" | bc)
echo $file>>Comparison.txt
echo "$googlesearch   $minsearch">>Comparison.txt
done

