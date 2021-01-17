usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 00:25:00 estimated running time"
echo "# \$4 sleep time "
echo "# \$5 iteration number"
echo "# \$6 SetUp file"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 6 ]] && usage

rm -f $1

CreateTime=`date '+%F'`


	echo "Generate Configure"

	filename="$CreateTime-$2.pbs"
	dir="$CreateTime-$2"
	echo $filename
	mkdir -p $dir
	cd $dir
	~/bin/GenMultipleProcAffectSetUp.sh  $2 $4 $5 $6
	echo "#!/bin/bash">$filename
#	echo "#PBS -q $7 ">>$filename
#	echo "#PBS -A $8 ">>$filename
	echo "#PBS -N $2">>$filename
	##PBS -l nodes=2:ppn=8:sandy
#	echo "#PBS -l nodes=1:gpus=1">>$filename
	echo "#PBS -l nodes=1:ppn=16:sandy">>$filename

	echo "#PBS -e ${filename}_\$PBS_JOBID.err">>$filename
	echo "#PBS -o ${filename}_\$PBS_JOBID.out">>$filename
	echo "#PBS -l walltime=$3">>$filename
#		echo "#PBS -j oe">>$filename
	echo "#PBS -V">>$filename
#
#	echo "cd /home/zhihui/SPEC-CPU/spec2k6-v1.1">>$filename
#	echo ". ./shrc">>$filename
	echo "cd \$PBS_O_WORKDIR ">>$filename
	
	echo "echo ----------------------------------------">>$filename	
	echo "echo Start of the Testing">>$filename	
	echo "date">>$filename	

	cat $6 >>$filename
	echo "date">>$filename	
	echo "echo End of the Testing">>$filename	
	echo "echo ----------------------------------------">>$filename	
	cd ..

	echo "cd $dir">>$1
        echo  "qsub $filename" >>$1
	echo "cd .." >>$1
chmod 777 $1



