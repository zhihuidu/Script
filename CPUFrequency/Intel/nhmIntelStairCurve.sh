
usage()
{
echo $1 $2 $3 SetUp.sh $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
#echo "# \SetUp.sh Set up file "
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage

InitialTime=10
CreateTime=`date '+%F'`
rm -f SetUp.sh



#3500000 3400000 3200000 3100000 3000000 2900000 2700000 2600000 2500000 2400000 2200000 2100000 2000000 1900000 1700000 1600000 

#3325000 3192000 3059000 2926000 2793000 2660000 2527000 2394000 2261000 2128000 1995000 1862000 1729000 1596000 
for j in StableWorkLoad 
do
#Initinalize all the cores to Lowest Fre
	for i in 0 1 2 3 
	do
		echo "echo 1596000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>SetUp.sh
	done

	echo "">>SetUp.sh
	echo "">>SetUp.sh
#Assign workload to all the cores
	for i in 0 1 2 3 
	do
		echo "taskset -c $i   ~/bin/$j  &">>SetUp.sh
		echo "myid$i=\$!">>SetUp.sh
	done
	echo "">>SetUp.sh
#Starting Monitoring the Power	


	echo "export PPX_USE_REMOTE=1">>SetUp.sh
	echo "export PPX_LOGFILE=$CreateTime-$1-$j-StairTest.power">>SetUp.sh
	echo "echo >> \$PPX_LOGFILE">>SetUp.sh
	echo "date >> \$PPX_LOGFILE ">>SetUp.sh

	echo "BeginRecording ">>SetUp.sh
	echo "export PPX_REGION_LABEL=${j}" >>SetUp.sh
	echo "RegisterRegion ${j} ">>SetUp.sh
	echo "StartRegion ">>SetUp.sh

	echo "sleep $InitialTime">>SetUp.sh
#Change the frequency of P0
for k in  1596000 2128000 2660000 3325000
do 
	for i in 0 1 2 3 
	do
		echo "sleep 5">>SetUp.sh
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>SetUp.sh
	done
done

echo "sleep 5">>SetUp.sh


	echo "">>SetUp.sh

	echo "">>SetUp.sh
#Initinalize all the cores to 3.5G
	for i in 0 1 2 3 
	do
		echo "echo 3500000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>SetUp.sh
	done

	echo "sleep $InitialTime">>SetUp.sh
	echo "">>SetUp.sh

#Change the frequency of P0
for k in 3325000 2660000 2128000 1596000
do 
	for i in 0 1 2 3 
	do
		echo "sleep 5">>SetUp.sh
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>SetUp.sh
	done
done


#Ending the power  monitoring


	echo "StopRegion ">>SetUp.sh
	echo "EndRecording ">>SetUp.sh
	for i in 0 1 2 3 
	do
		echo "kill -9 \${my_pid$i} ">>SetUp.sh
	done
done
echo "sleep $2">>SetUp.sh
