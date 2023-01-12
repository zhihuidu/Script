
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

#ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
#ExeParameters=" --config=ppx-SNB-4.cfg --size=test --noreportable --tune=base "
#ExeParameters=" --config=ppx-basic-4.cfg --size=test --noreportable --tune=base "
ExeParameters=" --config=ppx-basic-4.cfg --nobuild --action onlyrun --size=test --noreportable "
CreateTime=`date '+%F'`
rm -f $4

#for k in 3500000 3400000 3200000 3100000 3000000 2900000 2700000 2600000 2500000 2400000 2200000 2100000 2000000 1900000 1700000 1600000 
for k in 3500000 3400000 3200000 3100000 3000000 2900000 2700000 2600000 2500000 2400000 2200000 2100000 2000000 1900000 1700000 1600000 
do 
for j in `ls ~/ppx_tm/Benchmarks/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do
	echo "">>$4
	echo "date ">>$4
	for i in 0 1 2 3 
	do
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>$4
	done




				echo "export PPX_USE_REMOTE=1">>$4
				echo "export PPX_LOGFILE=$CreateTime-$1-$j-$k.power">>$4
				echo "echo >> \$PPX_LOGFILE">>$4
				echo "date >> \$PPX_LOGFILE ">>$4

				echo "BeginRecording ">>$4
				echo "export PPX_REGION_LABEL=${j}" >>$4
				echo "RegisterRegion ${j} ">>$4
				echo "StartRegion ">>$4

	for i in 0 1 2  
	do
		echo "taskset -c $i   runspec $ExeParameters  --iterations=$3 $j  &">>$4
	done
	for i in 3
	do
		echo "taskset -c $i   runspec $ExeParameters --iterations=$3 $j ">>$4
	done



				echo "StopRegion ">>SetUp.sh
				echo "EndRecording ">>SetUp.sh

	echo "date ">>$4
	echo "sleep $2">>$4
done
done
chmod a+x SetUp.sh
