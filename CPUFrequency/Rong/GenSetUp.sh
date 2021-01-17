usage()
{
echo "# \$1 name for this test. such as Test01, Test02 "
echo "# \$2 sleep time, how many seconds to sleep between two test. such as 0, 1 or even more"
echo "# \$3 iteration number for one SPEC run"
echo "# \$4 name of the platform, such as ivyRong snbRong amdRong ivbIntel,nhmIntel,wsmIntel,snbIntel,hswIntel"
echo "# \$5 the name to test different workload and hardware setup scenarios, such as SameWorkloadMixedFre, SameWorkloadSameFre, StairCurve, 2MixedWorkloadsMixedFre,4MixedWorkloadsMixedFre"
echo "# \$6 estimated running time, such as 99:00:00"
echo "# \$7 benchmark name list if MixedWorkloads"
#echo "# \$8 Directory of executable"
#echo "# \$9 Directory of input file"
exit 1
}


[[ $# -lt 6 ]] && usage

CompleteRunShell=$1.sh
rm -f $CompleteRunShell

CreateTime=`date '+%F'`

echo "Generate Configure"

dir="$CreateTime-$1"
mkdir -p $dir
cd $dir

	Executable="$4$5.sh"
if [ $4 == "wsmIntel" ]
then
	Executable="nhmIntel${5}.sh"
fi

#Generate the SetUp.sh for executing the test
~/bin/$Executable   $1 $2 $3  $7 $8 $9 ${10}

#if [[ $5 == *SameFre || $5 == *StairCurve ]]
	
if [[ -f SetUp.sh ]]
then
		filename="$CreateTime-$4$5.sh"
		rm -f $filename
		echo "echo ----------------------------------------">>$filename	
		echo "echo Start of the Testing">>$filename	
		echo "date">>$filename	
		echo "rm -f *.power ">>$filename	
		echo "source SetUp.sh ">>$filename	
		echo "date">>$filename	
		echo "echo End of the Testing">>$filename	
		echo "echo ----------------------------------------">>$filename	
		chmod a+x *.sh
		echo "cd $dir">>../$CompleteRunShell
		echo  "./$filename 2>&1 |tee $filename.out" >>../$CompleteRunShell
		echo "cd .." >>../$CompleteRunShell
		echo "" >>../$CompleteRunShell

else

#for j in 400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand 999.specrand

#Generate the shell script to run all the SetUp.sh step by step
#for j in 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
for j in `ls `
do
	if [ -d $j ]
	then


		echo "Genete Testing for $j"
		cd $j
		filename="$CreateTime-$j.pbs"

		echo "#!/bin/bash">$filename
		echo "#PBS -q ivy_q ">>$filename
		echo "#PBS -N $j">>$filename
		echo "#PBS -l nodes=ivy:ppn=20 ">>$filename
		echo "#PBS -e ${filename}_\$PBS_JOBID.err">>$filename
		echo "#PBS -o ${filename}_\$PBS_JOBID.out">>$filename
		echo "#PBS -l walltime=$6">>$filename
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

		echo "cd $dir/$j">>../$CompleteRunShell
		echo  "qsub ./$filename 2>&1 |tee $filename.out" >>../$CompleteRunShell
		echo "cd ../.." >>../$CompleteRunShell
		echo "" >>../$CompleteRunShell
	fi
done
fi

cd ..
if [ -f $CompleteRunShell ]
then
	chmod 777 $CompleteRunShell
fi




