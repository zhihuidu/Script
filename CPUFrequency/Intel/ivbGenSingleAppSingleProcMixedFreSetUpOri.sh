
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
echo "# \$4 frequency step "
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 4 ]] && usage

#ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
#ExeParameters=" --config=ppx-SNB-4.cfg --size=test --noreportable --tune=base "
#ExeParameters=" --config=ppx-basic-4.cfg --size=test --noreportable --tune=base "
ExeParameters=" --config=ppx-basic-4.cfg --nobuild --action onlyrun --size=test --noreportable "

step=$4
CreateTime=`date '+%F'`
SPECDIR="~"
for j in `ls ~/ppx_tm/Benchmarks/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"

MinFre=1600000
MaxFre=3500000

#		echo "curdir=$(pwd)">>SetUp.sh
#		echo "cd ~/ppx_tm">>SetUp.sh
#		echo "source set.sh">>SetUp.sh
#		echo "cd \$curdir">>SetUp.sh

for ((c0=$MinFre;c0<=$MaxFre;c0=c0+step))
do

	if [ $c0 -eq 1800000 ]
	then
	let	c0=$c0+100000
	fi

	if [ $c0 -eq 2300000 ]
	then
	let	c0=$c0+100000
	fi


	if [ $c0 -eq 2800000 ]
	then
	let	c0=$c0+100000
	fi


	if [ $c0 -eq 3300000 ]
	then
	let	c0=$c0+100000
	fi


	for ((c1=$c0;c1<=$MaxFre;c1=c1+step))
	do

		if [ $c1 -eq 1800000 ]
		then
		let	c1=$c1+100000
		fi

		if [ $c1 -eq 2300000 ]
		then
		let	c1=$c1+100000
		fi

		if [ $c1 -eq 2800000 ]
		then
		let	c1=$c1+100000
		fi

		if [ $c1 -eq 3300000 ]
		then
		let	c1=$c1+100000
		fi

		for ((c2=$c1;c2<=$MaxFre;c2=c2+step))
		do

			if [ $c2 -eq 1800000 ]
			then
			let	c2=$c2+100000
			fi

			if [ $c2 -eq 2300000 ]
			then
			let	c2=$c2+100000
			fi

			if [ $c2 -eq 2800000 ]
			then
			let	c2=$c2+100000
			fi

			if [ $c2 -eq 3300000 ]
			then
			let	c2=$c2+100000
			fi

			for ((c3=$c2;c3<=$MaxFre;c3=c3+step))
			do

				if [ $c3 -eq 1800000 ]
				then
				let	c3=$c3+100000
				fi

				if [ $c3 -eq 2300000 ]
				then
				let	c3=$c3+100000
				fi

				if [ $c3 -eq 2800000 ]
				then
				let	c3=$c3+100000
				fi

				if [ $c3 -eq 3300000 ]
				then
				let	c3=$c3+100000
				fi
				let t0=$c0/100000
				let t1=$c1/100000
				let t2=$c2/100000
				let t3=$c3/100000
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
