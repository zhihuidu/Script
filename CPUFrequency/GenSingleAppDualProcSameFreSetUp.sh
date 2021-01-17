
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
echo "# \$4 Set up file "
#echo "# \$8 Directory of input file"
exit 1
}


ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
[[ $# -lt 4 ]] && usage

CreateTime=`date '+%F'`
rm -f $4
for k in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#for k in 1400000 1800000 
do 
for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do
	echo "">>$4
	echo "date ">>$4
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
	echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-$k-\$PBS_JOBID.power 2>&1 1>/dev/null &">>$4
 	echo "rapl_pid=\$!">>$4
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
	do
		echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters  --iterations=$3 $j  &">>$4
	done
	for i in 15
	do
		echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j ">>$4
	done
	echo "kill \${rapl_pid}">>$4
	echo "killall sh ">>$4
	echo "date ">>$4
	echo "sleep $2">>$4
done
done
