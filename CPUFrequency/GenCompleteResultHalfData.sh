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
for i in `ls `
do
	echo "Checking $i"
	if  exists_pattern_files $i/*$i*.power ; then 
	mkdir -p  $i/tmp
	cd $i
	~/bin/PreProcessing.sh
	echo "enter directory $i/tmp"
	rm -f $i.avg.txt
	rm -f $i.p0avg.txt
	rm -f $i.p1avg.txt
	rm -f $i.reg.avg.txt
	cd tmp



        for t in `ls *.power`
        do  
                EffectLine=$(cat $t |wc -l) 
                let EffectLine=$EffectLine/2
                tail $t -n $EffectLine >tmp
                cat tmp |awk '{print NR " " $1 " "$2" " $3 " " $4 " " $5 " " $6}' >$t
        done


	rm -f $i.avg.txt
	rm -f $i.p0avg.txt
	rm -f $i.p1avg.txt
	rm -f $i.reg.avg.txt
	for j in `ls *$i*.power`
	do
                TmpStr=${j##*$i-}
                Frequency=${TmpStr%-*}
                StrLen=${#Frequency}
                let half=$StrLen/2
                P0Frequency=${Frequency:0:$half}
                let half=$half+1
                P1Frequency=${Frequency:$half}

#               Frequency=${j:(-54):31}
#               P0Frequency=${j:(-54):15}
#               P1Frequency=${j:(-38):15}
		echo "Frequency is: $Frequency, P0 frequency is: $P0Frequency, P1 frequency is: $P1Frequency"

		AvgFre=$(echo $Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		P0AvgFre=$(echo $P0Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		P1AvgFre=$(echo $P1Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		MaxFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		P0MaxFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		P1MaxFre=$(echo $P1Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		MinFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		P0MinFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		P1MinFre=$(echo $P1Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		DiffMaxAvg=$( echo $MaxFre " " $AvgFre|awk '{print $1-$2}')
		P0DiffMaxAvg=$( echo $P0MaxFre " " $P0AvgFre|awk '{print $1-$2}')
		P1DiffMaxAvg=$( echo $P1MaxFre " " $P1AvgFre|awk '{print $1-$2}')
		DiffMaxMin=$( echo $MaxFre " " $MinFre|awk '{print $1-$2}')
		P0DiffMaxMin=$( echo $P0MaxFre " " $P0MinFre|awk '{print $1-$2}')
		P1DiffMaxMin=$( echo $P1MaxFre " " $P1MinFre|awk '{print $1-$2}')
		DiffAvgMin=$( echo $AvgFre " " $MinFre|awk '{print $1-$2}')
		P0DiffAvgMin=$( echo $P0AvgFre " " $P0MinFre|awk '{print $1-$2}')
		P1DiffAvgMin=$( echo $P1AvgFre " " $P1MinFre|awk '{print $1-$2}')
		FreDis=$(echo $Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2" " $9/10+1.2" " $10/10+1.2" " $11/10+1.2" " $12/10+1.2" " $13/10+1.2" " $14/10+1.2" " $15/10+1.2 " " $16/10+1.2}')
		P0FreDis=$(echo $P0Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2 }')
		P1FreDis=$(echo $P1Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2 }')

                VarianceFre=$(echo $Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                P0VarianceFre=$(echo $P0Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                P1VarianceFre=$(echo $P1Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                SDFre=$(echo $VarianceFre|awk '{print $VarianceFre^0.5}')
                P0SDFre=$(echo $P0VarianceFre|awk '{print $P0VarianceFre^0.5}')
                P1SDFre=$(echo $P1VarianceFre|awk '{print $10VarianceFre^0.5}')
#		echo $Frequency
#		echo $FreDis " " $AvgFre
		power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR " " (a2+a5)/NR " " (a3+a6)/NR " " (a4+a7)/NR}')
		P0power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR }')
		P1power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a5/NR " " a6/NR " " a7/NR }')
		reg=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR}')

#  1-16:Fre, 17:num of samples, 18:P0 PKG,19:P0 PP0,20:P0 DRAM,21:P1 PKG,22:P1 PP0 23:P1 DRAM,24:AvgFre,25:MaxFre,26:MinFre,27:DiffMaxAvg,28:DiffMaxMin,29:DiffAvgMin,30:VarianceFre,31:SDFre
		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre  >>../$i.avg.txt

#  1-8:Fre, 9:num of samples, 10:P0 PKG,11:P0 PP0,12:P0 DRAM,13:P0AvgFre,14:P0MaxFre,15:P0MinFre,16:P0DiffMaxAvg,17:P0DiffMaxMin,18:P0DiffAvgMin,19:P0VarianceFre,20:P0SDFre
		echo $P0FreDis " " $P0power " " $P0AvgFre " " $P0MaxFre " " $P0MinFre " " $P0DiffMaxAvg " " $P0DiffMaxMin " " $P0DiffAvgMin " " $P0VarianceFre " " $P0SDFre  >>../$i.p0avg.txt

#  1-8:Fre, 9:num of samples, 10:P1 PKG,11:P1 PP0,12:P1 DRAM,13:P1AvgFre,14:P1MaxFre,15:P1MinFre,16:P1DiffMaxAvg,17:P1DiffMaxMin,18:P1DiffAvgMin,19:P1VarianceFre,20:P1SDFre
		echo $P1FreDis " " $P1power " " $P1AvgFre " " $P1MaxFre " " $P1MinFre " " $P1DiffMaxAvg " " $P1DiffMaxMin " " $P1DiffAvgMin " " $P1VarianceFre " " $P1SDFre  >>../$i.p1avg.txt
	done
	echo "leave directory $i/tmp"

	cd ../..

	fi
	echo "End of Checking $i"

done

#for i in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
for i in `ls `
do

	echo "Checking $i"
	if  exists_pattern_files $i/tmp/*$i*.power ; then 

	echo "enter directory $i"
	cd $i

	rm -f $i.samefre.avg.txt
	rm -f $i.p0samefre.avg.txt
	rm -f $i.p1samefre.avg.txt

	for ((k=0;k<=8;k++))
	do


		for j in `ls *$i*$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k-$k*.power`
		do

		Frequency=${j:(-54):31}
		P0Frequency=${j:(-54):15}
		P1Frequency=${j:(-38):15}

		AvgFre=$(echo $Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		P0AvgFre=$(echo $P0Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		P1AvgFre=$(echo $P1Frequency | tr '-' '\n' |awk '{a+=$1}END{print a/NR/10+1.2 }')
		MaxFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		P0MaxFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		P1MaxFre=$(echo $P1Frequency | tr '-' '\n' |awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print max/10+1.2}') 
		MinFre=$(echo $Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		P0MinFre=$(echo $P0Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		P1MinFre=$(echo $P1Frequency | tr '-' '\n' |awk 'BEGIN {min = 1999} {if ($1<min) min=$1 fi} END {print min/10+1.2ls}')
		DiffMaxAvg=$( echo $MaxFre " " $AvgFre|awk '{print $1-$2}')
		P0DiffMaxAvg=$( echo $P0MaxFre " " $P0AvgFre|awk '{print $1-$2}')
		P1DiffMaxAvg=$( echo $P1MaxFre " " $P1AvgFre|awk '{print $1-$2}')
		DiffMaxMin=$( echo $MaxFre " " $MinFre|awk '{print $1-$2}')
		P0DiffMaxMin=$( echo $P0MaxFre " " $P0MinFre|awk '{print $1-$2}')
		P1DiffMaxMin=$( echo $P1MaxFre " " $P1MinFre|awk '{print $1-$2}')
		DiffAvgMin=$( echo $AvgFre " " $MinFre|awk '{print $1-$2}')
		P0DiffAvgMin=$( echo $P0AvgFre " " $P0MinFre|awk '{print $1-$2}')
		P1DiffAvgMin=$( echo $P1AvgFre " " $P1MinFre|awk '{print $1-$2}')
		FreDis=$(echo $Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2" " $9/10+1.2" " $10/10+1.2" " $11/10+1.2" " $12/10+1.2" " $13/10+1.2" " $14/10+1.2" " $15/10+1.2 " " $16/10+1.2}')
		P0FreDis=$(echo $P0Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2 }')
		P1FreDis=$(echo $P1Frequency | tr '-' ' '|awk '{print $1/10+1.2 " " $2/10+1.2  " " $3/10+1.2" " $4/10+1.2" " $5/10+1.2" " $6/10+1.2" " $7/10+1.2" " $8/10+1.2 }')

                VarianceFre=$(echo $Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                P0VarianceFre=$(echo $P0Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                P1VarianceFre=$(echo $P1Frequency | tr '-' ' ' |  awk '{for(i=1;i<=NF;i++) total+=$i;ave=total/NF;for(i=1;i<=NF;i++) tmp+=(($i-ave)*($i-ave)); print tmp/NF}')
                SDFre=$(echo $VarianceFre|awk '{print $VarianceFre^0.5}')
                P0SDFre=$(echo $P0VarianceFre|awk '{print $P0VarianceFre^0.5}')
                P1SDFre=$(echo $P1VarianceFre|awk '{print $10VarianceFre^0.5}')
#		echo $Frequency
#		echo $FreDis " " $AvgFre
		power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR " " (a2+a5)/NR " " (a3+a6)/NR " " (a4+a7)/NR}')
		P0power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a2/NR " " a3/NR " " a4/NR }')
		P1power=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print NR " " a5/NR " " a6/NR " " a7/NR }')
		reg=$(cat $j |awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7}END{print a2/NR " " a3/NR " " a4/NR " " a5/NR " " a6/NR " " a7/NR}')
#		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre 
		echo $FreDis " " $power " " $AvgFre " " $MaxFre " " $MinFre " " $DiffMaxAvg " " $DiffMaxMin " " $DiffAvgMin " " $VarianceFre " " $SDFre " " $P0AvgFre " " $P0MaxFre " " $P0MinFre " " $P0DiffMaxAvg " " $P0DiffMaxMin " " $P0DiffAvgMin " " $P0VarianceFre " " $P0SDFre   >>$i.samefre.avg.txt
		echo $P0FreDis " " $P0power " " $P0AvgFre " " $P0MaxFre " " $P0MinFre " " $P0DiffMaxAvg " " $P0DiffMaxMin " " $P0DiffAvgMin " " $P0VarianceFre " " $P0SDFre  >>../$i.p0samefrequency.avg.txt
		echo $P1FreDis " " $P1power " " $P1AvgFre " " $P1MaxFre " " $P1MinFre " " $P1DiffMaxAvg " " $P1DiffMaxMin " " $P1DiffAvgMin " " $P1VarianceFre " " $P1SDFre  >>../$i.p1samefrequency.avg.txt


		done

	done
	echo "leave directory $i"
	rm -f -r tmp
	cd ../..
	fi
	echo "End of Checking $i"

done

~/bin/GenSortedAvgFrePower.sh 
echo "End of Sort AvgFrePower"


~/bin/GenSortedPowerAvgFre.sh 
echo "End of Sort PowerAvgFre"

