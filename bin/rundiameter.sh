d=`date +%F-%H-%M-%S`
outputname="$d-diameter.txt"
for i in `cat mtxfile` 
do
    echo "python diameter.py $i >>$outputname"
    python diameter.py $i >>$outputname
done
