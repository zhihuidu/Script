usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 frequency step"
echo "# \$4 sleep time "
echo "# \$5 iteration number"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 5 ]] && usage

rm -f $1

CreateTime=`date '+%F'`


echo "Generate Configure"

dir="$CreateTime-$2"
mkdir -p $dir
cd $dir
#MyExeDir="~/bin/intel/GenSingleAppSingleProcMixedFreSetUp.sh"
~/bin/Intel/snbGenSingleAppSingleProcMixedFreSetUp.sh  $2 $4 $5 $3
#		echo "curdir=$(pwd)">>$1
#		echo "cd ~/ppx_tm">>$1
#		echo "source set.sh">>$1
#		echo "cd \$curdir">>$1

#400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand 999.specrand 
for j in 400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf 433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd 445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer 458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm 471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk
do
	echo "Genete Testing for $j"
	cd $j
	rm -f $filename
	filename="$CreateTime-$j.sh"
	echo "echo ----------------------------------------">>$filename	
	echo "echo Start of the Testing">>$filename	
	echo "date">>$filename	
	echo "rm -f *.power ">>$filename	
	echo "source SetUp.sh ">>$filename	
	echo "date">>$filename	
	echo "echo End of the Testing">>$filename	
	echo "echo ----------------------------------------">>$filename	
	chmod a+x *.sh
	cd ..
	echo "cd $dir/$j">>../$1
	echo  "./$filename 2>&1 |tee $filename.out" >>../$1
	echo "cd ../.." >>../$1
	echo "" >>../$1
done
cd ..
chmod 777 $1
