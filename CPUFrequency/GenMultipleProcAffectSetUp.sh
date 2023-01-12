
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


[[ $# -lt 4 ]] && usage

InitialTime=10
CreateTime=`date '+%F'`
rm -f $4
for j in StableWorkLoad 
do
	echo "">>$4
#Initinalize all the cores to 1.2G
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "echo 1200000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
	echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-\$PBS_JOBID.power 2>&1 1>/dev/null &">>$4
 	echo "rapl_pid=\$!">>$4
        echo "/apps/power-bench/mclient -H 10.1.255.101  -d /home/zhihui/duzh/$CreateTime-$1">>$4
        echo "/apps/power-bench/mclient -H 10.1.255.101 -l $CreateTime-$1-$j-\$PBS_JOBID.power.machine">>$4

	echo "">>$4
	echo "">>$4
#Assign workload to all the cores
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "taskset -c $i   ~/bin/$j  &">>$4
#		echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --size=test --noreportable --iterations=$3 $j  &">>$4
	done

	echo "">>$4


	echo "sleep $InitialTime">>$4
#Change the frequency of P0
for k in  1400000 1600000 1800000 2000000 
do 
#	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	for i in 0 1 2 3 4 5 6 7 
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done

		echo "sleep 5">>$4


	echo "">>$4
#Initinalize all the cores to 1.2G
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "echo 1200000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done


	echo "">>$4



	echo "sleep $InitialTime">>$4
#Change the frequency of P0
for k in  1400000 1600000 1800000 2000000 
do 
#	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	for i in 8 9 10 11 12 13 14 15
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done

		echo "sleep 5">>$4


	echo "">>$4
#Initinalize all the cores to 2G
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "echo 2000000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done

	echo "sleep $InitialTime">>$4
	echo "">>$4

#Change the frequency of P0
for k in 1800000 1600000 1400000 1200000
do 
#	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	for i in 0 1 2 3 4 5 6 7 
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done


	echo "">>$4
#Initinalize all the cores to 2G
	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
		echo "echo 2000000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done

	echo "sleep $InitialTime">>$4
	echo "">>$4
#Change the frequency of P1
for k in 1800000 1600000 1400000 1200000
do 
#	for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	for i in 8 9 10 11 12 13 14 15
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done

		echo "sleep 30">>$4


	echo "">>$4

        echo "/apps/power-bench/mclient -H 10.1.255.101 -e log">>$4
	echo "kill \${rapl_pid}">>$4
	echo "killall sh ">>$4
#	echo "killall $j ">>$4
done
	echo "sleep $2">>$4
