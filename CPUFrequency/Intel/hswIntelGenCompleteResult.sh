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
#		P0Power=$(cat  $j |sed '2,$d'|awk '{ print $2}')
#		P0Time=$(cat  $j |sed '2,$d' | awk '{print $5 "/" $6}' |bc -l)

                P0Power=$(grep avgPower $j |awk '{ print $2}'|sed 's/avgPower=//')
                P0Time=$(grep time $j |awk '{ print $3}'|sed 's/time=//')
                P0Energy=$(echo $P0Power " " $P0Time|awk '{print $1*$2}')
# 1:Power, 2:Time , 3:Energy, 4:AvgFre, 5:DiffMaxAvg, 6:DiffMaxAvg, 7:DiffMaxMin,8:DiffAvgMin,9:VarianceFre, 10:SDFre, 11:MaxFre,12:MinFre, 13:FreDis >>$i.${node}avg.txt
                echo  $P0Power " " $P0Time " " $P0Energy " " $P0AvgFre " " $P0DiffMaxAvg " " $P0DiffMaxAvg " " $P0DiffMaxMin " " $P0DiffAvgMin " " $P0VarianceFre " " $P0SDFre " " $P0MaxFre " " $P0MinFre " " $P0FreDis >>$i.p0avg.txt


	done
	sort -n -k 1  $i.p0avg.txt -o $i.p0avg.txt
	echo "leave directory $i"



B

	cd ..

	fi
	echo "End of Checking $i"

done


~/bin/Intel/hswGenSortedAvgFrePower.sh 
echo "End of Sort AvgFrePower"


~/bin/Intel/hswGenSortedPowerAvgFre.sh 
echo "End of Sort PowerAvgFre"

~/bin/Intel/hswGenSortedEnergyAvgFre.sh 
echo "End of Sort PowerAvgFre"
