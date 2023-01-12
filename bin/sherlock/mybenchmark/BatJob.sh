d=`date +%F-%H-%M-%S`
output="$2-Locales-$3-$d"
echo "python bfsrmat.py $1 5555 2>&1 |tee -a rmat-$output-Client"
#echo "python delaunay.py $1 5555 2>&1 |tee -a delaunay-$output-Client"
#echo "python kron.py $1 5555 2>&1 |tee -a kron-$output-Client"
#echo "python rgg.py $1 5555 2>&1 |tee -a rgg-$output-Client"
echo "continue?"
read x
python bfsrmat.py $1 5555 2>&1 |tee -a rmat-$output-Client
#python delaunay.py $1 5555 2>&1 |tee -a delaunay-$output-Client
#python kron.py $1 5555 2>&1 |tee -a kron-$output-Client
#python rgg.py $1 5555 2>&1 |tee -a rgg-$output-Client
