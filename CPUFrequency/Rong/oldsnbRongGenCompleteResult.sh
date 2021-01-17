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
	if  exists_pattern_files $i/2014-*$i*.power.machine ; then 
	cd $i
	echo "enter directory $i"
	rm -f $i.sandy*avg.txt
	for node in sandy0 sandy1
	do
		for j in `ls 2014*$i*.power.machine`
		do

			grep $node $j >${node}-$j
		done

	done

	for node in sandy0 sandy1
	do

	for j in `ls ${node}-*$i*.power.machine`
	do

                TmpStr=${j##*$i-}
                Frequency=${TmpStr%-*}
                StrLen=${#Frequency}
                let half=$StrLen/2
		if [[ $i == "sandy0" ]]
		then
                	Frequency=${Frequency:0:$half}
		else
                	let half=$half+1
                	Frequency=${Frequency:$half}
		fi
                AvgFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {a=0} {a+=$1} END { print a/NR/10 }')
		MaxFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>(max+0.0)) max=$1 fi} END {print max/10}') 
		MinFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<(min+0.0)) min=$1 fi} END {print min/10}')
		DiffMaxAvg=$( echo $MaxFre " " $AvgFre|awk '{print $1-$2}')
		DiffMaxMin=$( echo $MaxFre " " $MinFre|awk '{print $1-$2}')
		DiffAvgMin=$( echo $AvgFre " " $MinFre|awk '{print $1-$2}')
		FreDis=$(echo $Frequency | tr '-' ' '|awk '{print $1/10 " " $2/10  " " $3/10" " $4/10 " " $5/10 " " $6/10  " " $7/10" " $8/10 }')

                VarianceFre=$(echo $Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                SDFre=$(echo $VarianceFre|awk '{print $VarianceFre^0.5}')

		Power=$(cat $j |awk '{a3+=$3}END{print a3/NR}')
		Time=$(cat $j|wc -l )
#                Energy=$(echo $Power " " $Time|awk '{print $1*$2}')
                Energy=`echo $Power*$Time|bc -l `

# 1:Power, 2:Time , 3:Energy, 4:AvgFre, 5:DiffMaxAvg, 6:DiffMaxMin,7:DiffAvgMin,8:VarianceFre, 9:SDFre, 10:MaxFre,11:MinFre, 12:FreDis >>$i.${node}avg.txt
		echo  $Power " " $Time " " $Energy " " $AvgFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre " " $MaxFre " " $MinFre " " $FreDis >>$i.${node}avg.txt

	done
#	sort -n -k 1  $i.${node}avg.txt -o $i.${node}avg.txt

	done
	echo "leave directory $i"

	cd ..

	fi
	echo "End of Checking $i"

done


~/bin/Rong/RongGenSortedAvgFrePower.sh
~/bin/Rong/RongGenSortedEnergyAvgFre.sh
~/bin/Rong/RongGenSortedPowerAvgFre.sh
