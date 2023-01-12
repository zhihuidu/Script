#!/bin/bash
ssh $1 ps -u zhihui|sed 's/\|/ /'|awk '{print $1}'>tmpid
sed 1d tmpid>tmpid2
for i in `cat tmpid2`
do
echo "ssh $1 kill  $i"
ssh $1 kill  $i
done
rm tmpid tmpid2
