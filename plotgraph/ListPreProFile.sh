rm -f tmp1
for i in ` find "$(pwd)" -type f -name "*.pr"` ;
do
NumEdge=$(tail $i| grep "Num Edge" | cut -d "=" -f2 |cut -d " " -f1) 
NumVertex=$(tail $i| grep "Num Vertex" | cut -d "=" -f3) 
echo "$NumEdge,$NumVertex,2,0,'$i'" >>tmp1
done
sort -t',' -k1,1n -k2,2n -k5 tmp1>tmp2
sed 's/^/[/' tmp2 | sed 's/$/]/' >tmp3
