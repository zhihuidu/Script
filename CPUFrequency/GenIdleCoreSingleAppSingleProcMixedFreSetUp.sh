
usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
echo "# \$4 number of idle cores"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage
#echo "idle core=$4"
ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
step=200000
CreateTime=`date '+%F'`
for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"

#for ((c0=1200000;c0<=2000000;c0=c0+step))
let c0=1200000
let flag0=1
while ( [[ $c0 -le 2000000 ]] && [[ $flag0 -ge 1 ]] )
do
let flag1=1
let c1=$c0

while  ( [[ $c1 -le 2000000 ]] && [[ $flag1 -ge 1 ]] )
#for ((c1=$c0;c1<=2000000;c1=c1+step))
do
let flag2=1
let c2=$c1

while  [[ $c2 -le 2000000 ]] && [[ $flag2 -ge 1 ]] 
#for ((c2=$c1;c2<=2000000;c2=c2+step))
do
let flag3=1
let c3=$c2

while  [[ $c3 -le 2000000 ]] && [[ $flag3 -ge 1 ]] 
#for ((c3=$c2;c3<=2000000;c3=c3+step))
do
let flag4=1
let c4=$c3

while  [[ $c4 -le 2000000 ]] && [[ $flag4 -ge 1 ]] 
#for ((c4=$c3;c4<=2000000;c4=c4+step))
do
let flag5=1
let c5=$c4

while  [[ $c5 -le 2000000 ]] && [[ $flag5 -ge 1 ]] 
#for ((c5=$c4;c5<=2000000;c5=c5+step))
do
let flag6=1
let c6=$c5

while  ([[ $c6 -le 2000000 ]] && [[ $flag6 -ge 1 ]]) 
#for ((c6=$c5;c6<=2000000;c6=c6+step))
do
let flag7=1
let c7=$c6

while  ([[ $c7 -le 2000000 ]] && [[ $flag7 -ge 1 ]]) 
#for ((c7=$c6;c7<=2000000;c7=c7+step))
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


		echo "/apps/power-bench/mclient -H 10.1.255.101  -d /home/zhihui/duzh/$CreateTime-$1/$j">>SetUp.sh
		echo "/apps/power-bench/mclient -H 10.1.255.101 -l $CreateTime-$1-$j-$Fre-\$PBS_JOBID.power.machine">>SetUp.sh
		echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-$Fre-\$PBS_JOBID.power 2>&1 1>/dev/null &">>SetUp.sh
	 	echo "rapl_pid=\$!">>SetUp.sh




		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		do

			let curcore=$i%8
			if [ $curcore -ge $4 ]
			then 
				echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j  &">>SetUp.sh
 				echo "my_pid$i=\$!">>SetUp.sh
			fi 
		done
		for i in 15
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
		done

		echo "kill \${rapl_pid}">>SetUp.sh
		echo "/apps/power-bench/mclient -H 10.1.255.101 -e log">>SetUp.sh

		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		do
			let curcore=$i%8
			if [ $curcore -ge $4 ]
			then 

				echo "kill \${my_pid$i} ">>SetUp.sh
			fi
		done
		echo "data " >>SetUp.sh
		echo "sleep $2" >>SetUp.sh



let c7=$c7+$step
if [[ $4 -gt 7 ]]
then
	let flag7=0
	echo "flag7=$flag7"
fi
done

let c6=$c6+$step
if [[ $4 -gt 6 ]]
then
	let flag6=0
	echo "flag6=$flag6"
fi

done
let c5=$c5+$step
if [[ $4 -gt 5 ]]
then
	let flag5=0
fi
done
let c4=$c4+$step
if [[ $4 -gt 4 ]]
then
	let flag4=0
fi
done
let c3=$c3+$step
if [[ $4 -gt 3 ]]
then
	let flag3=0
fi
done
let c2=$c2+$step
if [[ $4 -gt 2 ]]
then
	let flag2=0
fi
done
let c1=$c1+$step
if [[ $4 -gt 1 ]]
then
	let flag1=0
fi
done
let c0=$c0+$step
if [[ $4 -gt 0 ]]
then
	let flag0=0
fi
done
	cd ..
done
