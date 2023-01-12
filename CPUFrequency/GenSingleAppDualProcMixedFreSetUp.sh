
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

for ((c0=1200000;c0<=2600000;c0=c0+step))
do

for ((c1=$c0;c1<=2600000;c1=c1+step))
do

for ((c2=$c1;c2<=2600000;c2=c2+step))
do

for ((c3=$c2;c3<=2600000;c3=c3+step))
do

for ((c4=$c3;c4<=2600000;c4=c4+step))
do


for ((c5=$c4;c5<=2600000;c5=c5+step))
do

for ((c6=$c5;c6<=2600000;c6=c6+step))
do

for ((c7=$c6;c7<=2600000;c7=c7+step))
do

for ((c8=$c7;c8<=2600000;c8=c8+step))
do

for ((c9=$c8;c9<=2600000;c9=c9+step))
do

for ((c10=$c9;c10<=2600000;c10=c10+step))
do

for ((c11=$c10;c11<=2600000;c11=c11+step))
do

for ((c12=$c11;c12<=2600000;c12=c12+step))
do

for ((c13=$c12;c13<=2600000;c13=c13+step))
do

for ((c14=$c13;c14<=2600000;c14=c14+step))
do

for ((c15=$c14;c15<=2600000;c15=c15+step))
do

##let c1=$c0
##while [ $c1 -le 2000000 ]
##for c1 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##for c1 in 1200000 1400000 1600000 1800000 2000000
##do
#
##let c2=$c1
##while [ $c2 -le 2000000 ]
##for c2 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do
#
##let c3=$c2
##while [ $c3 -le 2000000 ]
##for c3 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do
#
##let c4=$c3
##while [ $c4 -le 2000000 ]
##for c4 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do
#
##let c5=$c4
##while [ $c5 -le 2000000 ]
##for c5 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do 
#
#
##let c6=$c5
##while [ $c6 -le 2000000 ]
##for c6 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do 
#
#
##let c7=$c6
##while [ $c7 -le 2000000 ]
##for c7 in 1200000 1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
##do 
#
##let c8=$c7
##hile [ $c8 -le 2000000 ]
##for c8 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do 
#
#
#let c9=$c8
#while [ $c9 -le 2000000 ]
##for c9 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c10=$c9
#while [ $c10 -le 2000000 ]
##for c10 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c11=$c10
#while [ $c11 -le 2000000 ]
##for c11 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c12=$c11
#while [ $c12 -le 2000000 ]
##for c12 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c13=$c12
#while [ $c13 -le 2000000 ]
##for c13 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c14=$c13
#while [ $c14 -le 2000000 ]
##for c14 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do
#
#let c15=$c14
#while [ $c15 -le 2000000 ]
##for c15 in 1200000 
##1300000 1400000 1500000 1600000 1700000 1800000 1900000 2000000
#do

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




		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j  &">>SetUp.sh
		done
		for i in 15
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
		done

		echo "kill \${rapl_pid}">>SetUp.sh
		echo "/apps/power-bench/mclient -H 10.1.255.101 -e log">>SetUp.sh
		echo "killall sh">>SetUp.sh
		echo "sleep $2" >>SetUp.sh

#	#	let c15=$c15+$Step
#done
##	let c14=$c14+$Step
#done
##	let c13=$c13+$Step
#done
##	let c12=$c12+$Step
#done
##	let c11=$c11+$Step
#done
##	let c10=$c10+$Step
#done
##	let c9=$c9+$Step
#done
##	let c8=$c8+$Step
#done
##	let c7=$c7+$Step
#done
##	let c6=$c6+400000
#done
##	let c5=$c5+400000
#done
##	let c4=$c4+400000
#done
##	let c3=$c3+400000
#done
##	let c2=$c2+400000
#done
##	let c1=$c1+400000



done
done
done
done
done
done
done
done
done
done
done
done
done
done
done
done
	cd ..
done
