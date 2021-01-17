usage()
{
echo "# \$1 the input file which include all the directories to be processed"
#echo "# \$2 sleep time "
#echo "# \$3 iteration number"
#echo "# \$7 Directory of executable"
#echo "# \$8 Directory of input file"
exit 1
}
exists_pattern_files(){  
    [ -e "$1" ]  
}  


#[[ $# -lt 1 ]] && usage

for i in `ls  `
do
	if  exists_pattern_files $i/*$i*.power ; then 
		mkdir -p  $i/tmp
		cd $i
		echo "Checking $i"
		~/bin/PreProcessing.sh
		cd ..
	fi
done


	if  exists_pattern_files *$i*.power ; then 
		mkdir -p  tmp
		
		echo "Checking current directory"
		~/bin/PreProcessing.sh
		cd ..
	fi
