m -f filename
grep "TC:" $1  | cut  -f 2 |sed 's/ //'|tee -a filename
#grep "read file" $1  | cut -d "/" -f4 
rm -f vertices
grep "TC:" $1  | cut  -f 3 |sed 's/ //'|tee -a vertices
rm -f edges
grep "TC:" $1  | cut  -f 4 |sed 's/ //'|tee -a edges
rm -f algorithms
grep "TC:" $1  | cut  -f 5 |sed 's/ //'|tee -a algorithms
rm -f times
grep "TC:" $1  | cut  -f 6 |sed 's/ //'|tee -a times
awk 'ORS=NR%27?" ":"\n"' <times >executiontime
rm -f triangles
grep "TC:" $1  | cut  -f 7 |sed 's/ //'|tee -a triangles
awk 'ORS=NR%27?" ":"\n"' <triangles >trianglenum

rm -f palgorithms
grep "TC_P:" $1  | cut  -f 5 |sed 's/ //'|tee -a palgorithms
rm -f ptimes
grep "TC_P:" $1  | cut  -f 6 |sed 's/ //'|tee -a ptimes
awk 'ORS=NR%15?" ":"\n"' <ptimes >pexecutiontime
rm -f ptriangles
grep "TC_P:" $1  | cut  -f 7 |sed 's/ //'|tee -a ptriangles
awk 'ORS=NR%15?" ":"\n"' <ptriangles >ptrianglenum
d=`date +%F-%H-%M-%S`
outputname="$1-OutPutData-$d.txt"
#paste tmp11 tmp22 tmp33 -d " " >$outputname

