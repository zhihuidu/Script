
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage

ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
step=400000
MServer="10.1.1.29"
CreateTime=`date '+%F'`
for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"

for ((c0=1200000;c0<=2500000;c0=c0+step))
do
let c1=$c0
#for ((c1=$c0;c1<=2500000;c1=c1+step))
#do

for ((c2=$c1;c2<=2500000;c2=c2+step))
do
let c3=$c2
#for ((c3=$c2;c3<=2500000;c3=c3+step))
#do

for ((c4=$c3;c4<=2500000;c4=c4+step))
do

let c5=$c4
#for ((c5=$c4;c5<=2500000;c5=c5+step))
#do

for ((c6=$c5;c6<=2500000;c6=c6+step))
do
let c7=$c6
#for ((c7=$c6;c7<=2500000;c7=c7+step))
#do

for ((c8=$c7;c8<=2500000;c8=c8+step))
do
let c9=$c8
#for ((c9=$c8;c9<=2500000;c9=c9+step))
#do





let c10=$c0
let c11=$c1
let c12=$c2
let c13=$c3
let c14=$c4
let c15=$c5
let c16=$c6
let c17=$c7
let c18=$c8
let c19=$c9


		let t0=$c0/100000
		let t1=$c1/100000
		let t2=$c2/100000
		let t3=$c3/100000
		let t4=$c4/100000
		let t5=$c5/100000
		let t6=$c6/100000
		let t7=$c7/100000
		let t8=$c8/100000
		let t9=$c9/100000
		let t10=$c10/100000
		let t11=$c11/100000
		let t12=$c12/100000
		let t13=$c13/100000
		let t14=$c14/100000
		let t15=$c15/100000
		let t16=$c16/100000
		let t17=$c17/100000
		let t18=$c18/100000
		let t19=$c19/100000

		Fre=$t0-$t1-$t2-$t3-$t4-$t5-$t6-$t7-$t8-$t9-$t10-$t11-$t12-$t13-$t14-$t15-$t16-$t17-$t18-$t19
#		echo Test Frequency Combine : $Fre

		echo "data " >>SetUp.sh

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
		echo "echo $c16  > /sys/devices/system/cpu/cpu15/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c17  > /sys/devices/system/cpu/cpu15/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c18  > /sys/devices/system/cpu/cpu15/cpufreq/scaling_setspeed">>SetUp.sh
		echo "echo $c19  > /sys/devices/system/cpu/cpu15/cpufreq/scaling_setspeed">>SetUp.sh


		echo "/apps/power-bench/mclient -H $MServer  -d /home/zhihui/duzh/$CreateTime-$1/$j">>SetUp.sh
		echo "/apps/power-bench/mclient -H $MServer  -l $CreateTime-$1-$j-$Fre-\$PBS_JOBID.power.machine">>SetUp.sh
#		echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-$Fre-\$PBS_JOBID.power 2>&1 1>/dev/null &">>SetUp.sh
#	 	echo "rapl_pid=\$!">>SetUp.sh




		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j  &">>SetUp.sh
 			echo "my_pid$i=\$!">>SetUp.sh
		done
		for i in 19
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
		done

#		echo "kill \${rapl_pid}">>SetUp.sh
		echo "/apps/power-bench/mclient -H $MServer -e log">>SetUp.sh

		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		do

			echo "kill \${my_pid$i} ">>SetUp.sh
		done
		echo "data " >>SetUp.sh
		echo "sleep $2" >>SetUp.sh



done
done
done
done
done
	cd ..
done
