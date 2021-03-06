
usage()
{
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
#echo "# \$4 frequency step "
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage

#ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
#ExeParameters=" --config=ppx-SNB-4.cfg --size=test --noreportable --tune=base "
#ExeParameters=" --config=ppx-basic-4.cfg --size=test --noreportable --tune=base "
ExeParameters=$(cat ~/bin/Intel/SPECRUNPARAMETERS) 

CreateTime=`date '+%F'`

for j in 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"



#for c0 in 1596000 1729000 1862000 1995000 2128000 2261000 2394000 2527000 2660000 2793000 2926000 3059000 3192000 3325000
for c0 in 1596000 1995000 2394000 2793000 3325000
do
#	for c1  in 1596000 1729000 1862000 1995000 2128000 2261000 2394000 2527000 2660000 2793000 2926000 3059000 3192000 3325000
	for c1 in 1596000 1995000 2394000 2793000 3325000
	do
		if [ $c1 -lt $c0 ]
		then
			continue
		fi
#		for c2 in  1596000 1729000 1862000 1995000 2128000 2261000 2394000 2527000 2660000 2793000 2926000 3059000 3192000 3325000
		for c2 in 1596000 1995000 2394000 2793000 3325000
		do
			if [ $c2 -lt $c1 ]
			then
				continue
			fi
#			for c3 in  1596000 1729000 1862000 1995000 2128000 2261000 2394000 2527000 2660000 2793000 2926000 3059000 3192000 3325000
			for c3 in 1596000 1995000 2394000 2793000 3325000
			do

				if [ $c3 -lt $c2 ]
				then
					continue
				fi

				let t0=$c0/1000
				let t1=$c1/1000
				let t2=$c2/1000
				let t3=$c3/1000
				Fre=$t0-$t1-$t2-$t3
				echo "">>SetUp.sh
				echo "echo $c0  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed">>SetUp.sh
				echo "echo $c1  > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed">>SetUp.sh
				echo "echo $c2  > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed">>SetUp.sh
				echo "echo $c3  > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed">>SetUp.sh

				echo "export PPX_USE_REMOTE=1">>SetUp.sh
				echo "export PPX_LOGFILE=$CreateTime-$1-$j-$Fre.power">>SetUp.sh
				echo "echo >> \$PPX_LOGFILE">>SetUp.sh
				echo "date >> \$PPX_LOGFILE ">>SetUp.sh

				echo "BeginRecording ">>SetUp.sh
				echo "export PPX_REGION_LABEL=${j}" >>SetUp.sh
				echo "RegisterRegion ${j} ">>SetUp.sh
				echo "StartRegion ">>SetUp.sh
				for i in 0 1 2  
				do
					echo "taskset -c $i   runspec $ExeParameters --iterations=$3 $j  &">>SetUp.sh
					echo "my_pid$i=\$!">>SetUp.sh
				done
				for i in 3
				do
					echo "taskset -c $i   runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
				done
		#		echo "runspec $ExeParameters --rate 4 --iterations=$3 $j ">>SetUp.sh
				echo "StopRegion ">>SetUp.sh
				echo "EndRecording ">>SetUp.sh
				for i in 0 1 2 
				do
					echo "kill -9 \${my_pid$i} ">>SetUp.sh
				done
				echo "date " >>SetUp.sh
				echo "sleep $2" >>SetUp.sh


			done
		done
	done
done
cd ..
done
