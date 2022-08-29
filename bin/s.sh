for i in `find $1 `
do
attachmenttype=$(file --mime-type -b "$i")
if [[ "$attachmenttype" == *"text"* ]]; then
	searchresult=$(grep $2 $i)
	if [[ "$searchresult" != "" ]];
	then
	
#	echo "Search $2 in $PWD/$i"
	echo "Search $2 in $i"
	grep $2 $i
	echo "------------------- "
	fi
fi
done
