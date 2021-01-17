
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


#$[[ $# -lt 3 ]] && usage

exists_pattern_files(){  
    [ -e "$1" ]   
}  



for i in `ls `
do

	if [ "$i" == "RegressionMethod.txt" ]
	then
		echo "Find RegressionMethod.txt in current directory"

		cat RegressionMethod.txt |sort -n -k 2r -k 4  >SortedRegressionP5Max.txt
		cat RegressionMethod.txt |sort -n -k 4 -k 2r  >SortedRegressionMaxP5.txt

	fi
	if [ -f $i/RegressionMethod.txt ]
	then 
		echo "Find RegressionMethod.txt in directory $i"
		cd $i
			cat RegressionMethod.txt |sort -n -k 2r -k 4 >SortedRegressionP5Max.txt
			cat RegressionMethod.txt |sort -n -k 4 -k 2r  >SortedRegressionMaxP5.txt

			for j in `ls Residual_*.txt`
			do
				cat $j | sort -n -k 1r -k 2r >SortedAbsRel$j
				cat $j | sort -n -k 2r -k 1r >SortedRelAbs$j
			done
			for j in `ls Range_*Power_*.txt`
			do
				echo "sort $j"
				cat $j | sort -n -k 9r -k7r >Sorted$j
			done
			for j in `ls Range_*AvgFre_*.txt`
			do
				echo "sort $j"
				cat $j | sort -n -k 5r  -k4r>Sorted$j
			done

		cd ..
	fi
done
echo "Find files in current directory"
for j in `ls Residual_*.txt`
do
		echo "sort $j"
		cat $j | sort -n -k 1r -k 2r >SortedAbsRel$j
		cat $j | sort -n -k 2r -k 1r >SortedRelAbs$j
done
for j in `ls Range_*Power_*.txt`
do
		echo "sort $j"
		cat $j | sort -n -k 9r -k 7r >Sorted$j
done
for j in `ls Range_*AvgFre_*.txt`
do
		echo "sort $j"
		cat $j | sort -n -k 5r  -k4r>Sorted$j
done
