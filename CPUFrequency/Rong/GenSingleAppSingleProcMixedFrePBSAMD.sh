usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 test name such as TestSP01"
echo "# \$2 sleep time "
echo "# \$3 iteration number"
echo "# \$4 estimated running time, such as 00:25:00 "
#echo "# \$5  what queue should be submitted"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 4 ]] && usage

rm -f $1.sh

CreateTime=`date '+%F'`


	echo "Generate Configure"

	dir="$CreateTime-$1"
	mkdir -p $dir
	cd $dir
	~/bin/GenSingleAppSingleProcMixedFreSetUpAMD.sh $1 $2 $3

	index=0
	#for j in 400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand 999.specrand
	for j in 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
	do

		let index=$index%3
		let nodeid=$index+3
		let index=$index+1
		echo "Genete Testing for $j"
		cd $j
		filename="$CreateTime-$j.pbs"

		echo "#!/bin/bash">$filename
		echo "#PBS -q meter_q ">>$filename
#		echo "#PBS -A $8 ">>$filename
		echo "#PBS -N $j">>$filename
		##PBS -l nodes=2:ppn=8:sandy
#		echo "#PBS -l nodes=1:gpus=1">>$filename
#		echo "#PBS -l nodes=n0${nodeid}:ppn=8">>$filename
		echo "#PBS -l nodes=n03:ppn=8">>$filename

		echo "#PBS -e ${filename}_\$PBS_JOBID.err">>$filename
		echo "#PBS -o ${filename}_\$PBS_JOBID.out">>$filename
		echo "#PBS -l walltime=$4">>$filename
#		echo "#PBS -j oe">>$filename
		echo "#PBS -V">>$filename
#
		echo "cd /home/zhihui/SPEC-CPU/spec2k6-v1.1">>$filename
		echo ". ./shrc">>$filename
		echo "cd \$PBS_O_WORKDIR ">>$filename
	
		echo "echo ----------------------------------------">>$filename	
		echo "echo Start of the Testing">>$filename	
		echo "date">>$filename	
	
		cat SetUp.sh >>$filename
		echo "date">>$filename	
		echo "echo End of the Testing">>$filename	
		echo "echo ----------------------------------------">>$filename	
		cd ..

		echo "cd $dir/$j">>../$1.sh
	        echo  "qsub $filename" >>../$1.sh

#		hour=$(echo $3|sed 's/:/ /g'|awk '{print $1 }')
#		minute=$(echo $3|sed 's/:/ /g'|awk '{print $2}')
#		second=$(echo $3|sed 's/:/ /g'|awk '{print $3}')
#		let sleeptime=$hour*3600+$minute*60+$second
#		echo "sleep $sleeptime ">>../$1.sh
		echo "cd ../.." >>../$1.sh
		echo "" >>../$1.sh
	done
	cd ..
chmod 777 $1.sh



