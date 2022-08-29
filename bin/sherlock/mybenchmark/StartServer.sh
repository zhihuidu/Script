d=`date +%F-%H-%M-%S`
output="Server-$1-Locales-$2-$d"
echo "./arkouda_server -nl $1 2>&1 |tee -a $output"
echo "Continue?"
read x
./arkouda_server -nl $1 2>&1 |tee -a $output
