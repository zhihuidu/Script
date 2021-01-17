usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 Config Directory"
echo "# \$3 test1 test 2 ..."
echo "# \$4 00:25:00 estimated running time"
echo "# \$5 sleep time "
#echo "# \$6 00:25:00 estimated running time"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 5 ]] && usage

rm -f $1
./CreateTest.sh $3 $5 $2

CreateTime=`date '+%F'`


	echo "Generate Configure"

	filename="$CreateTime-$3.pbs"
	echo $filename
	echo "#!/bin/bash">$filename
#	echo "#PBS -q $7 ">>$filename
#	echo "#PBS -A $8 ">>$filename
	echo "#PBS -N $3">>$filename
	##PBS -l nodes=2:ppn=8:sandy
	echo "#PBS -l nodes=1:gpus=1">>$filename

	echo "#PBS -e ${filename}_\$PBS_JOBID.err">>$filename
	echo "#PBS -o ${filename}_\$PBS_JOBID.out">>$filename
	echo "#PBS -l walltime=$4">>$filename
#		echo "#PBS -j oe">>$filename
	echo "#PBS -V">>$filename
#
	echo "cd /home/zhihui/SPEC-CPU/spec2k6-v1.1">>$filename
	echo ". ./shrc">>$filename
	echo "cd \$PBS_O_WORKDIR ">>$filename
	

	cat SetUp.sh >>$filename

for ConfigFile in `ls $2`
do 

	dir="$CreateTime-$ConfigFile-$3"

	cat $2/$ConfigFile|awk '{ print "echo "$2" > /sys/devices/system/cpu/cpu"$1"/cpufreq/scaling_setspeed" }' >>$filename
	echo "/apps/power-bench/rapl -c 0,8 -f ./$dir-\$PBS_JOBID.power 2>&1 1>/dev/null &">>$filename
	echo "rapl_pid=\$!">>$filename

	echo "">>$filename

	echo "date">>$filename
	cat $2/$ConfigFile|awk '{ print "taskset -c "$1"   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg" \
		" --size=test --noreportable --iterations=1 "$3"  & " }' >>$filename

	echo "sleep $5" >>$filename

	echo "kill \${rapl_pid}">>$filename
        echo "date">>$filename

done

        echo  "qsub $filename" >>$1
chmod 777 $1



