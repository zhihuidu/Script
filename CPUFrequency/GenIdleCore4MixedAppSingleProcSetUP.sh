
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo " \$1 test1 test 2 ..."
echo " \$2 sleep time "
echo " \$3 iteration number"
echo " \$4 name1"
echo " \$5 name2"
echo " \$6 name3"
echo " \$7 name4"

#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage

step=200000
CreateTime=`date '+%F'`
j="$4-$5-$6-$7"
#for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
#do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"

for ((c0=1200000;c0<=2000000;c0=c0+step))
do

for ((c1=$c0;c1<=2000000;c1=c1+step))
do

for ((c2=$c1;c2<=2000000;c2=c2+step))
do

for ((c3=$c2;c3<=2000000;c3=c3+step))
do

for ((c4=$c3;c4<=2000000;c4=c4+step))
do


for ((c5=$c4;c5<=2000000;c5=c5+step))
do

for ((c6=$c5;c6<=2000000;c6=c6+step))
do

for ((c7=$c6;c7<=2000000;c7=c7+step))
do
let c8=$c0
let c9=$c1
let c10=$c2
let c11=$c3
let c12=$c4
let c13=$c5
let c14=$c6
let c15=$c7


		let t0=$c0/100000-12
		let t1=$c1/100000-12
		let t2=$c2/100000-12
		let t3=$c3/100000-12
		let t4=$c4/100000-12
		let t5=$c5/100000-12
		let t6=$c6/100000-12
		let t7=$c7/100000-12
		let t8=$c8/100000-12
		let t9=$c9/100000-12
		let t10=$c10/100000-12
		let t11=$c11/100000-12
		let t12=$c12/100000-12
		let t13=$c13/100000-12
		let t14=$c14/100000-12
		let t15=$c15/100000-12

		Fre=$t0-$t1-$t2-$t3-$t4-$t5-$t6-$t7-$t8-$t9-$t10-$t11-$t12-$t13-$t14-$t15
#		echo Test Frequency Combine : $Fre


		echo "">>SetUp.sh
		echo "echo $c0  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c1  > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c2  > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c3  > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c4  > /sys/devices/system/cpu/cpu4/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c5  > /sys/devices/system/cpu/cpu5/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c6  > /sys/devices/system/cpu/cpu6/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c7  > /sys/devices/system/cpu/cpu7/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c8  > /sys/devices/system/cpu/cpu8/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c9  > /sys/devices/system/cpu/cpu9/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c10  > /sys/devices/system/cpu/cpu10/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c11  > /sys/devices/system/cpu/cpu11/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c12  > /sys/devices/system/cpu/cpu12/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c13  > /sys/devices/system/cpu/cpu13/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c14  > /sys/devices/system/cpu/cpu14/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c15  > /sys/devices/system/cpu/cpu15/cpufreq/scaling_setspeed">>SetUp.sh


		echo "/apps/power-bench/mclient -H 10.1.255.101  -d /home/zhihui/duzh/$CreateTime-$1/$j">>SetUp.sh
		echo "/apps/power-bench/mclient -H 10.1.255.101 -l $CreateTime-$1-$j-$Fre-\$PBS_JOBID.power.machine">>SetUp.sh
		echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-$Fre-\$PBS_JOBID.power 2>&1 1>/dev/null &">>SetUp.sh
	 	echo "rapl_pid=\$!">>SetUp.sh




				echo "taskset -c 4   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $4  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh
				echo "taskset -c 5   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $5  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh

				echo "taskset -c 6   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $6  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh

				echo "taskset -c 7   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $7  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh



				echo "taskset -c 12   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $4  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh
				echo "taskset -c 13   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $5  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh

				echo "taskset -c 14   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $6  &">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh

				echo "taskset -c 15   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg  --nobuild --size=test --noreportable --iterations=$3 $7  ">>SetUp.sh
	#			echo "/home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec --config=Tong-linux.cfg --nobuild --size=test --noreportable --iterations=$3 $j  &">>SetUp.sh


		echo "kill \${rapl_pid}">>SetUp.sh
		echo "/apps/power-bench/mclient -H 10.1.255.101 -e log">>SetUp.sh
		echo "sleep $2" >>SetUp.sh



done
done
done
done
done
done
done
done
	cd ..
#done
