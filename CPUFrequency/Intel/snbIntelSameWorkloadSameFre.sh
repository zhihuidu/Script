
usage()
{
echo $1 $2 $3 SetUp.sh $5 $6 $7 $8 
echo "# \$1 test1 test 2 ..."
echo "# \$2 sleep time "
echo "# \$3 iteration number"
echo "# \SetUp.sh Set up file "
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 3 ]] && usage

#ExeParameters="--config=Tong-linux.cfg --nobuild --action onlyrun --size=test --noreportable"
#ExeParameters=" --config=ppx-SNB-4.cfg --size=test --noreportable --tune=base "
#ExeParameters=" --config=ppx-basic-4.cfg --size=test --noreportable --tune=base "
ExeParameters=$(cat ~/bin/Intel/SPECRUNPARAMETERS) 
CreateTime=`date '+%F'`
rm -f SetUp.sh

#3400000 3200000 3000000 2800000 2600000 2400000 2200000 2000000 1800000 1600000 
for k in 3400000 3200000 3000000 2800000 2600000 2400000 2200000 2000000 1800000 1600000 
do 
#for j in `ls ~/ppx_tm/Benchmarks/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
#for j in 400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand 999.specrand
for j in 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
do
	echo "">>SetUp.sh
	echo "date ">>SetUp.sh
	for i in 0 1 2 3 
	do
		echo "echo $k > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_setspeed">>SetUp.sh
	done




				echo "export PPX_USE_REMOTE=1">>SetUp.sh
				echo "export PPX_LOGFILE=$CreateTime-$1-$j-$k.power">>SetUp.sh
				echo "echo >> \$PPX_LOGFILE">>SetUp.sh
				echo "date >> \$PPX_LOGFILE ">>SetUp.sh

				echo "BeginRecording ">>SetUp.sh
				echo "export PPX_REGION_LABEL=${j}" >>SetUp.sh
				echo "RegisterRegion ${j} ">>SetUp.sh
				echo "StartRegion ">>SetUp.sh

	for i in 0 1 2  
	do
		echo "taskset -c $i   runspec $ExeParameters  --iterations=$3 $j  &">>SetUp.sh
	done
	for i in 3
	do
		echo "taskset -c $i   runspec $ExeParameters --iterations=$3 $j ">>SetUp.sh
	done



				echo "StopRegion ">>SetUp.sh
				echo "EndRecording ">>SetUp.sh

	echo "date ">>SetUp.sh
	echo "sleep $2">>SetUp.sh
done
done
chmod a+x SetUp.sh
