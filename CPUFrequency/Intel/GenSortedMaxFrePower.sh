
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

# 1:Power, 2:Time , 3:Energy, 4:AvgFre, 5:DiffMaxAvg, 6:DiffMaxMin,7:DiffAvgMin,8:VarianceFre, 9:SDFre, 10:MaxFre,11:MinFre, 12:FreDis >>$i.${node}avg.txt
	if [ -d $i ]
	then 
		cd $i
		for j in `ls $i.*avg.txt`
		do
			rm -f *maxfre_power_sort.txt
			rm -f *maxfre_power_sortnumber.txt
			partfile=${j%avg.txt*}
			filename1="${partfile}maxfre_power_sort.txt"
			filename2="${partfile}maxfre_power_sortnumber.txt"
			filename3="${partfile}_variance.txt"
			filename4="${partfile}maxfre_power_variance.txt"
			rm -f $filename3
			cat $j|sort -n -k10 -k1|awk '{ print $10  " " $1  }'>$filename1
			cat $filename1 |awk '{print $1}'|uniq -c|awk '{print $2 " " $1}'>$filename2
			cp -f $filename1 tmp.txt
			for num in `cat $filename2|awk '{ print $2}' `
			do 
				head tmp.txt -n ${num}|awk '{print $2}' >mytmp.txt
				Variance=$(awk '{a[++i]=$1;} END{for(i in a)sum += a[i];ave=sum/i;for(i in a) delta += (a[i]-ave)*(a[i]-ave);print delta}' mytmp.txt) 

				SD=$(echo $Variance|awk '{print $Variance^0.5}')
				echo "$num $Variance $SD"
				echo "$Variance $SD">>$filename3
				cat tmp.txt|sed 1,${num}d >mytmp.txt
				cp -f mytmp.txt tmp.txt	
			done 
			paste $filename2 $filename3 >$filename4
		done
		cd ..

	fi
done
