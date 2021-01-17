
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
MServer="10.1.1.27"
step=500000
CreateTime=`date '+%F'`
#for j in `ls /home/zhihui/SPEC-CPU/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
#for j in 400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand 999.specrand
for j in 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
do

	TestDir="$j"
	CurrentBenchmark="$j"
	mkdir -p $CurrentBenchmark
	cd $CurrentBenchmark
	rm -f SetUp.sh
	echo "Generate SetUp.sh For $j"

for ((c0=800000;c0<=2500000;c0=c0+step))
do

if [[ $c0 == 2300000 ]] 
then
let c0=2500000
fi

for ((c1=$c0;c1<=2500000;c1=c1+step))
do

if [[ $c1 -eq 2300000 ]] 
then
let c1=2500000
fi
for ((c2=$c1;c2<=2500000;c2=c2+step))
do

if [[ $c2 -eq 2300000 ]] 
then
let c2=2500000
fi
for ((c3=$c2;c3<=2500000;c3=c3+step))
do

if [[ $c3 -eq 2300000 ]] 
then
let c3=2500000
fi
let c4=$c0
let c5=$c1
let c6=$c2
let c7=$c3


		let t0=$c0/100000
		let t1=$c1/100000
		let t2=$c2/100000
		let t3=$c3/100000
		let t4=$c4/100000
		let t5=$c5/100000
		let t6=$c6/100000
		let t7=$c7/100000

		Fre=$t0-$t1-$t2-$t3-$t4-$t5-$t6-$t7
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
		echo " " >>SetUp.sh



		echo "/apps/power-bench/mclient -H $MServer   -d /home/zhihui/duzh/$CreateTime-$1/$j">>SetUp.sh
		echo "/apps/power-bench/mclient -H $MServer  -l $CreateTime-$1-$j-$Fre-\$PBS_JOBID.power.machine">>SetUp.sh
#		echo "/apps/power-bench/mclient -H 10.1.255.100  -d /home/zhihui/duzh/$CreateTime-$1/$j">>SetUp.sh
#		echo "/apps/power-bench/mclient -H 10.1.255.100 -l $CreateTime-$1-$j-$Fre-\$PBS_JOBID.power.machine">>SetUp.sh
#		echo "/apps/power-bench/rapl -c 0,8 -f ./$CreateTime-$1-$j-$Fre-\$PBS_JOBID.power 2>&1 1>/dev/null &">>SetUp.sh
#	 	echo "rapl_pid=\$!">>SetUp.sh




		for i in 0 1 2 3 4 5 6  
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j  &">>SetUp.sh
 		#	echo "my_pid$i=\$!">>SetUp.sh
		done
		for i in 7
		do
			echo "taskset -c $i   /home/zhihui/SPEC-CPU/spec2k6-v1.1/bin/runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
		done

#		echo "kill \${rapl_pid}">>SetUp.sh
		echo "/apps/power-bench/mclient -H $MServer -e log">>SetUp.sh

#		for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
#		do
#
#			echo "kill \${my_pid$i} ">>SetUp.sh
#		done
		echo "data " >>SetUp.sh
		echo "sleep $2" >>SetUp.sh



done
done
done
done
	cd ..
done
