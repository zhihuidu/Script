for i in $1 $2 $3
do
	echo "Name">bench-n
	cat $i|awk '{print $1}'|sed 's/,//'>>bench-n
	echo "$i-a">$i-a
	cat $i|awk '{print $3}'>>$i-a
	echo "$i-b">$i-b
	cat $i|awk '{print $6}'>>$i-b
	echo "$i-c">$i-c
	cat $i|awk '{print $9}'>>$i-c
done
echo "" >ModelParameter.txt
for j in 1 2 3
do
	for i in $1 $2 $3
	do
		if [[ $j -eq 1 ]]
		then
			paste ModelParameter.txt $i-a >tmpModelParameter.txt
			cp tmpModelParameter.txt ModelParameter.txt
		fi

		if [[ $j -eq 2 ]]
		then
			paste ModelParameter.txt $i-b >tmpModelParameter.txt
			cp tmpModelParameter.txt ModelParameter.txt
		fi
		if [[ $j -eq 3 ]]
		then
			paste ModelParameter.txt $i-c >tmpModelParameter.txt
			cp tmpModelParameter.txt ModelParameter.txt
		fi
	done
done
paste tmpModelParameter.txt bench-n>ModelParameter.txt
