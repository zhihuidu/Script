
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



#3500000 3400000 3200000 3100000 3000000 2900000 2700000 2600000 2500000 2400000 2200000 2100000 2000000 1900000 1700000 1600000 

#3325000 3192000 3059000 2926000 2793000 2660000 2527000 2394000 2261000 2128000 1995000 1862000 1729000 1596000 
for j in StableWorkLoad 
do
#Initinalize all the cores to Lowest Fre
	for i in 0 1 2 3 
	do
		echo "echo 1596000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done

	echo "">>$4
	echo "">>$4
#Assign workload to all the cores
	for i in 0 1 2 3 
	do
		echo "taskset -c $i   ~/bin/$j  &">>$4
		echo "myid$i=\$!">>$4
	done
	echo "">>$4
#Starting Monitoring the Power	


	echo "export PPX_USE_REMOTE=1">>$4
	echo "export PPX_LOGFILE=$CreateTime-$1-$j-StairTest.power">>$4
	echo "echo >> \$PPX_LOGFILE">>$4
	echo "date >> \$PPX_LOGFILE ">>$4

	echo "BeginRecording ">>$4
	echo "export PPX_REGION_LABEL=${j}" >>$4
	echo "RegisterRegion ${j} ">>$4
	echo "StartRegion ">>$4

	echo "sleep $InitialTime">>$4
#Change the frequency of P0
for k in  1596000 2128000 2660000 3325000
do 
	for i in 0 1 2 3 
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done

echo "sleep 5">>$4


	echo "">>$4

	echo "">>$4
#Initinalize all the cores to 3.5G
	for i in 0 1 2 3 
	do
		echo "echo 3500000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done

	echo "sleep $InitialTime">>$4
	echo "">>$4

#Change the frequency of P0
for k in 3325000 2660000 2128000 1596000
do 
	for i in 0 1 2 3 
	do
		echo "sleep 5">>$4
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done
done


#Ending the power  monitoring


	echo "StopRegion ">>$4
	echo "EndRecording ">>$4
	for i in 0 1 2 3 
	do
		echo "kill -9 \${my_pid$i} ">>$4
	done
done
echo "sleep $2">>$4
