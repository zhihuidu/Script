usage()
{
echo $1 $2 $3 $4 $5 $6 $7 $8 
echo "# \$1 shell script name  xxx.sh"
echo "# \$2 test1 test 2 ..."
echo "# \$3 sleep time "
echo "# \$4 iteration number"
#echo "# \$8 Directory of input file"
exit 1
}


[[ $# -lt 4 ]] && usage

rm -f $1

CreateTime=`date '+%F'`


	echo "Generate Configure"

	filename="$CreateTime-$2.sh"
	dir="$CreateTime-$2"
	echo $filename
	mkdir -p $dir
	cd $dir
	~/bin/Intel/ivbGenStair.sh  $2 $4 $5 SetUp.sh 
	echo "#!/bin/bash">$filename
	echo "echo ----------------------------------------">>$filename	
	echo "echo Start of the Testing">>$filename	
	echo "date">>$filename	
	echo "source SetUp.sh ">>$filename	
	echo "date">>$filename	
	echo "echo End of the Testing">>$filename	
	echo "echo ----------------------------------------">>$filename	
	cd ..

	echo "cd $dir">>$1
        echo  "./$filename" >>$1
	echo "cd .." >>$1
chmod 777 $1



