usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 00:25:00 estimated running time"
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
	~/bin/Intel/IntelGenSingleAppSingleProcMixedFreSetUp.sh  $2 $4 $5
 	for j in `ls ~/ppx_tm/Benchmarks/spec2k6-v1.1/benchspec/CPU2006 |sed 1d|sed '29,$ d'`
	do

		echo "Genete Testing for $j"
		cd $j
		rm -f $filename
		filename="$CreateTime-$j.sh"

		echo "echo ----------------------------------------">>$filename	
		echo "echo Start of the Testing">>$filename	
		echo "date">>$filename	
		echo "source SetUp.sh ">>$filename	
		echo "date">>$filename	
		echo "echo End of the Testing">>$filename	
		echo "echo ----------------------------------------">>$filename	
		chmod a+x *.sh
		cd ..

		echo "cd $dir/$j">>../$1
	        echo  "./$filename" >>../$1

		echo "cd ../.." >>../$1
		echo "" >>../$1
	done
	cd ..
chmod 777 $1
