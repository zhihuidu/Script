usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 sleep time "
echo "# \$4 iteration number"
echo "# \$5 benchmark1"
echo "# \$6 Benchmark2"
exit 1
}


[[ $# -lt 5 ]] && usage

rm -f $1

CreateTime=`date '+%F'`


echo "Generate Configure"

dir="$CreateTime-$2"
mkdir -p $dir
cd $dir
#	../GenSingleProcessorSetUp.sh $2 $4 $5 $6 $7 
~/bin/Intel/nhmGen2MixedAppSingleProcSetUp.sh  $2 $3 $4 $5 $6
j="$5-$6"


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
cd ..
chmod 777 $1


