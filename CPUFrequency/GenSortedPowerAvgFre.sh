
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


for i in `ls `
do

#	if [ -d $i/tmp ]
	if [ -d $i ]
	then 
		cd $i
		rm -f $i.pkg_power_avgfresort.txt
		rm -f $i.pp0_power_avgfresort.txt
		rm -f $i.p0pkg_power_avgfresort.txt
		rm -f $i.p0pp0_power_avgfresort.txt
		rm -f $i.p1pkg_power_avgfresort.txt
		rm -f $i.p1pp0_power_avgfresort.txt
		if [ -f $i.avg.txt ] 
		then
#1-16:Fre, 17:num of samples, 18:P0 AvgPKG,19:P0 AvgPP0,20:P0 AvgDRAM,21:P1 AvgPKG,22:P1 AvgPP0 23:P1 AvgDRAM,24: AvgSumPKG,25:AvgSumPP0,26:AvgSumDram 27:AvgFre,2    8:MaxFre,29:MinFre,30:DiffMaxAvg,31:DiffMaxMin,32:DiffAvgMin,33:VarianceFre,34:SDFre
			cat $i.avg.txt  |sort -n -k24 -k27  |awk '{print $24 " " $27 }'>$i.pkg_power_avgfre_sort.txt 
			cat $i.pkg_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.pkg_power_avgfre_sortnum.txt

			cat $i.avg.txt  |sort -n -k25 -k27  |awk '{print $25 " " $27 }'>$i.pp0_power_avgfre_sort.txt 
			cat $i.pp0_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.pp0_power_avgfre_sortnum.txt

 #  1-8:Fre, 9:num of samples, 10:P0 PKG,11:P0 PP0,12:P0 DRAM,13:P0AvgFre,14:P0MaxFre,15:P0MinFre,16:P0DiffMaxAvg,17:P0DiffMaxMin,18:P0DiffAvgMin,19:P0VarianceFre,20:P0SDFre

			cat $i.p0avg.txt  |sort -n -k10 -k13  |awk '{print $10 " " $13 }'>$i.p0pkg_power_avgfre_sort.txt 
			cat $i.p0pkg_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.p0pkg_power_avgfre_sortnum.txt

			cat $i.p0avg.txt  |sort -n -k11 -k13  |awk '{print $11 " " $13 }'>$i.p0pp0_power_avgfre_sort.txt 
			cat $i.p0pp0_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.p0pp0_power_avgfre_sortnum.txt


#  1-8:Fre, 9:num of samples, 10:P1 PKG,11:P1 PP0,12:P1 DRAM,13:P1AvgFre,14:P1MaxFre,15:P1MinFre,16:P1DiffMaxAvg,17:P1DiffMaxMin,18:P1DiffAvgMin,19:P1VarianceFre,20:P1SDFre

			cat $i.p1avg.txt  |sort -n -k10 -k13  |awk '{print $10 " " $13 }'>$i.p1pkg_power_avgfre_sort.txt 
			cat $i.p1pkg_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.p1pkg_power_avgfre_sortnum.txt

			cat $i.p1avg.txt  |sort -n -k11 -k13  |awk '{print $11 " " $13 }'>$i.p1pp0_power_avgfre_sort.txt 
			cat $i.p1pp0_power_avgfre_sort.txt |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}' >$i.p1pp0_power_avgfre_sortnum.txt

		fi
		cd ..
	fi
done
