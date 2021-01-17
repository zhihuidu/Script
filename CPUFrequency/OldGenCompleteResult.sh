
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}


#$[[ $# -lt 3 ]] && usage


for i in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do

	rm -f $i.avg.txt
	rm -f $i.reg.avg.txt
	for j in `ls *$i*.power`
	do
		Frequency=${j:(-54):31}
		P0Frequency=${j:(-54):15}
		P1Frequency=${j:(-69):15}
		AvgFre=$(echo $Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		MaxFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		MinFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		DiffMaxAvg=$( echo $MaxFre " " $AvgFre|awk '{print $1-$2}')
		DiffMaxMin=$( echo $MaxFre " " $MinFre|awk '{print $1-$2}')
		DiffAvgMin=$( echo $AvgFre " " $MinFre|awk '{print $1-$2}')
		FreDis=$(echo $Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2" " $9/10+1.2" " $10/10+1.2" " $11/10+1.2" " $12/10+1.2" " $13/10+1.2" " $14/10+1.2" " $15/10+1.2 " " $16/10+1.2}')

                VarianceFre=$(echo $Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                SDFre=$(echo $VarianceFre|awk '{print $VarianceFre^0.5}')
#		echo $Frequency
#		echo $FreDis " " $AvgFre
		power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR " " (a2+a5)/NR " " (a3+a6)/NR " " (a4+a7)/NR}')
		reg=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR}')
#		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre 
		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre >>$i.avg.txt
#		echo $AvgFre " " $reg " " $MaxFre " " $MinFre " " $DiffFre  >>$i.reg.avg.txt
	done
done

for i in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do
	rm -f $i.samefre.avg.txt

	for ((k=0;k<=8;k++))
	do


		for j in `ls *$i*$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k*.power`
		do


		Frequency=${j:(-54):31}
		AvgFre=$(echo $Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		MaxFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		MinFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		DiffMaxAvg=$( echo $MaxFre " " $AvgFre|awk '{print $1-$2}')
		DiffMaxMin=$( echo $MaxFre " " $MinFre|awk '{print $1-$2}')
		DiffAvgMin=$( echo $AvgFre " " $MinFre|awk '{print $1-$2}')
		FreDis=$(echo $Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2" " $9/10+1.2" " $10/10+1.2" " $11/10+1.2" " $12/10+1.2" " $13/10+1.2" " $14/10+1.2" " $15/10+1.2 " " $16/10+1.2}')

                VarianceFre=$(echo $Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                SDFre=$(echo $VarianceFre|awk '{print $VarianceFre^0.5}')
		power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR " " (a2+a5)/NR " " (a3+a6)/NR " " (a4+a7)/NR}')
		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre >>$i.samefre.avg.txt




		done

	done


done
