
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

#	if [ -d $i/tmp ]
	if [ -d $i ]
	then 
		cd $i
		rm -f $i.power_avgfresort.txt
		if [ -f $i.p0avg.txt ] 
		then

#  1-4:Fre, 5:P0 AVG,6:P0AvgFre,7:P0MaxFre,8:P0MinFre,9:P0DiffMaxAvg,10:P0DiffMaxMin,11:P0DiffAvgMin,12:P0VarianceFre,13:P0SDFre
			cat $i.p0avg.txt  |sort -n -k 6 -k 5  |awk '{print $6 " " $5  }'>$i.p0avgfre_power_sort.txt 
			cat $i.p0avgfre_power_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.p0avgfre_power_sortnum.txt
# AveFre Number 
		fi
		cd ..
	fi
done
