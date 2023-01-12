mkdir -p tmp
for j in t.power
#for i in `ls *.power`
do
	read PreLine <$i
	cat $j  |awk 'for(i=2;i<NF;i++) {printf $i} printf "\n"}'
#	echo $PreLine|awk '{print $1 "  "  ; $2}'
#	eo $PreLine|awk '{a=$1;b=$2}'
#	cat $PreLine
#	read CurLine<$i
#	read NextLine<$ils
#	while read line
#	do
#		echo $line
#	done < $i

done


