qstat -u zhihui|sed 1,5d|awk '{print "qdel " $1}' >tmp.sh
chmod 777 tmp.sh
./tmp.sh
