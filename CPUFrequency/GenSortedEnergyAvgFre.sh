
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
		if [ -f $i.avg.txt ] 
		then
#1-16:Fre, 17:num of samples, 18:P0 AvgPKG,19:P0 AvgPP0,20:P0 AvgDRAM,21:P1 AvgPKG,22:P1 AvgPP0 23:P1 AvgDRAM,24: AvgSumPKG,25:AvgSumPP0,26:AvgSumDram 27:AvgFre,2    8:MaxFre,29:MinFre,30:DiffMaxAvg,31:DiffMaxMin,32:DiffAvgMin,33:VarianceFre,34:SDFre
			cat $i.avg.txt  |sort -n -k35 -k27  |awk '{print $35 " " $0 }'>$i.Energy_avgfre_sort.txt 


 #  1-8:Fre, 9:num of samples, 10:P0 PKG,11:P0 PP0,12:P0 DRAM,13:P0AvgFre,14:P0MaxFre,15:P0MinFre,16:P0DiffMaxAvg,17:P0DiffMaxMin,18:P0DiffAvgMin,19:P0VarianceFre,20:P0SDFre

			cat $i.p0avg.txt  |sort -n -k21 -k13  |awk '{print $21 " " $0 }'>$i.p0_Energy_avgfre_sort.txt 


#  1-8:Fre, 9:num of samples, 10:P1 PKG,11:P1 PP0,12:P1 DRAM,13:P1AvgFre,14:P1MaxFre,15:P1MinFre,16:P1DiffMaxAvg,17:P1DiffMaxMin,18:P1DiffAvgMin,19:P1VarianceFre,20:P1SDFre

			cat $i.p1avg.txt  |sort -n -k21 -k13  |awk '{print $21 " " $0 }'>$i.p1_Energy_avgfre_sort.txt 

		fi
		cd ..
	fi
done
