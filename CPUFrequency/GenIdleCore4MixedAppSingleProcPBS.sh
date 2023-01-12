usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 00:25:00 estimated running time"
echo "# \$4 sleep time "
echo "# \$5 iteration number"
echo "# \$6 benchmark1"
echo "# \$7 Benchmark2"
echo "# \$8 benchmark3"
echo "# \$9 Benchmark4"
exit 1
}


[[ $# -lt 5 ]] && usage

rm -f $1

CreateTime=`date '+%F'`


	echo "Generate Configure"

	dir="$CreateTime-$2"
	mkdir -p $dir
	cd $dir
#	../GenSingleProcessorSetUp.sh $2 $4 $5 $6 $7 
	~/bin/GenIdleCore4MixedAppSingleProcSetUP.sh $2 $4 $5 $6 $7 $8 $9
	j="$6-$7-$8-$9"

# 	for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
#	do

		echo "Genete Testing for $j"
		cd $j
		filename="$CreateTime-$j.pbs"

		echo "#!/bin/bash">$filename
#		echo "#PBS -q $7 ">>$filename
#		echo "#PBS -A $8 ">>$filename
		echo "#PBS -N $j">>$filename
		##PBS -l nodes=2:ppn=8:sandy
#		echo "#PBS -l nodes=1:gpus=1">>$filename
		echo "#PBS -l nodes=1:ppn=16:sandy">>$filename

		echo "#PBS -e ${filename}_\$PBS_JOBID.err">>$filename
		echo "#PBS -o ${filename}_\$PBS_JOBID.out">>$filename
		echo "#PBS -l walltime=$3">>$filename
#		echo "#PBS -j oe">>$filename
		echo "#PBS -V">>$filename
#
		echo "cd /home/zhihui/SPEC-CPU/spec2k6-v1.1">>$filename
		echo ". ./shrc">>$filename
		echo "cd \$PBS_O_WORKDIR ">>$filename
	
		echo "echo ----------------------------------------">>$filename	
		echo "echo Start of the Testing">>$filename	
		echo "date">>$filename	
	
		cat SetUp.sh >>$filename
		echo "date">>$filename	
		echo "echo End of the Testing">>$filename	
		echo "echo ----------------------------------------">>$filename	
		cd ..

		echo "cd $dir/$j">>../$1
	        echo  "qsub $filename" >>../$1

#		hour=$(echo $3|sed 's/:/ /g'|awk '{print $1 }')
#		minute=$(echo $3|sed 's/:/ /g'|awk '{print $2}')
#		second=$(echo $3|sed 's/:/ /g'|awk '{print $3}')
#		let sleeptime=$hour*3600+$minute*60+$second
#		echo "sleep $sleeptime ">>../$1
		echo "cd ../.." >>../$1
		echo "" >>../$1
#	done
	cd ..
chmod 777 $1



