	Executable="$4$5SetUp.sh"
if [ $4 == "wsmIntel" ]
then
	Executable="nhmIntel${5}SetUp.sh"
fi
echo $Executable
