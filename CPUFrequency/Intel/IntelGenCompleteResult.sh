usage()
{
echo "# \$1 the input file which include all the directories to be processed"
#echo "# \$2 sleep time "
#echo "# \$3 iteration number"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}
exists_pattern_files(){  
    [ -e "$1" ]  
}  


#[[ $# -lt 1 ]] && usage


#for i in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
for i in `ls  `
do
	echo "Checking $i"
	if  exists_pattern_files $i/*$i*.power ; then 
	cd $i
	echo "enter directory $i"
	rm -f $i.p0avg.txt
	rm -f $i.reg.avg.txt
	for j in `ls *$i*.power`
	do
                TmpStr=${j##*$i-}
                P0Frequency=${TmpStr%.*}
                P0AvgFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {a=0} {a+=$1} END { print a/NR/10 }')
		P0MaxFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>(max+0.0)) max=$1 fi} END {print max/10}') 
		P0MinFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<(min+0.0)) min=$1 fi} END {print min/10}')
		P0DiffMaxAvg=$( echo $P0MaxFre " " $P0AvgFre|awk '{print $1-$2}')
		P0DiffMaxMin=$( echo $P0MaxFre " " $P0MinFre|awk '{print $1-$2}')
		P0DiffAvgMin=$( echo $P0AvgFre " " $P0MinFre|awk '{print $1-$2}')
		P0FreDis=$(echo $P0Frequency | tr '-' ' '|awk '{print $1/10 " " $2/10  " " $3/10" " $4/10 }')

                P0VarianceFre=$(echo $P0Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                P0SDFre=$(echo $P0VarianceFre|awk '{print $P0VarianceFre^0.5}')
		P0power=$(grep avgPower $j |awk '{ print $2}'|sed 's/avgPower=//')

#  1-16:Fre, 17:num of samples, 18:P0 PKG,19:P0 PP0,20:P0 DRAM,21:P1 PKG,22:P1 PP0 23:P1 DRAM,24:AvgFre,25:MaxFre,26:MinFre,27:DiffMaxAvg,28:DiffMaxMin,29:DiffAvgMin,30:VarianceFre,31:SDFre

#  1-8:Fre, 9:num of samples, 10:P0 PKG,11:P0 PP0,12:P0 DRAM,13:P0AvgFre,14:P0MaxFre,15:P0MinFre,16:P0DiffMaxAvg,17:P0DiffMaxMin,18:P0DiffAvgMin,19:P0VarianceFre,20:P0SDFre
		echo $P0FreDis " " $P0power " " $P0AvgFre " " $P0MaxFre " " $P0MinFre " " $P0DiffMaxAvg " " $P0DiffMaxMin " " $P0DiffAvgMin " " $P0VarianceFre " " $P0SDFre  >>$i.p0avg.txt

#  1-8:Fre, 9:num of samples, 10:P1 PKG,11:P1 PP0,12:P1 DRAM,13:P1AvgFre,14:P1MaxFre,15:P1MinFre,16:P1DiffMaxAvg,17:P1DiffMaxMin,18:P1DiffAvgMin,19:P1VarianceFre,20:P1SDFre
	done
	sort -n -k 1  $i.p0avg.txt -o $i.p0avg.txt
	echo "leave directory $i"

	cd ..

	fi
	echo "End of Checking $i"

done


~/bin/GenSortedAvgFrePower.sh 
echo "End of Sort AvgFrePower"


~/bin/GenSortedPowerAvgFre.sh 
echo "End of Sort PowerAvgFre"

