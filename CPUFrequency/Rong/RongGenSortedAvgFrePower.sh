
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


#for i in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
for i in `ls `
do

# 1:Power, 2:Time , 3:Energy, 4:AvgFre, 5:DiffMaxAvg, 6:DiffMaxAvg, 7:DiffMaxMin,8:DiffAvgMin,9:VarianceFre, 10:SDFre, 11:MaxFre,12:MinFre, 13:FreDis >>$i.${node}avg.txt
	if [ -d $i ]
	then 
		cd $i
		for j in `ls $i.*avg.txt`
		do
			partfile=${j%-avg.txt}
			filename1="${partfile}avgfre_power_sort.txt"
			filename2="${partfile}avgfre_power_sortnumber.txt"
			cat $j|sort -n -k4 -k1|awk '{ print $4  " " $1  }'>$filename1
			cat $filename1 |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}'>$filename2
		done
		cd ..

	fi
done
