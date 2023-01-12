
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

	if [ -d $i ]
	then 
# 1:Power, 2:Time , 3:Energy, 4:AvgFre, 5:DiffMaxAvg, 6:DiffMaxAvg, 7:DiffMaxMin,8:DiffAvgMin,9:VarianceFre, 10:SDFre, 11:MaxFre,12:MinFre, 13:FreDis >>$i.${node}avg.txt
		cd $i
                for j in `ls $i.*avg.txt`
                do
                        partfile=${j%-avg.txt}
                        filename1="${partfile}energy_avgfre_diffmaxavg_sort.txt"
                        cat $j|sort -n -k3 -k4 -k5|awk '{ print $3  " " $0  }'>$filename1
                done
                cd ..
	fi
done





