mkdir -p tmp
for i in `ls *.power`
do
	cat $i|sed 1d|awk '{print FNR " " $3 " " $4" " $5 " " $7 " " $8 " " $9} '| awk 'BEGIN {Pre2=0;Pre3=0;Pre4=0;Pre5=0;Pre6=0;Out7=0}
{ 
if (($2>0) && ($2<200))  {Out2=$2;Pre2=$2 } else {Out2=Pre2};
if (($3>0) && ($3<200)) {Out3=$3;Pre3=$3 } else {Out3=Pre3};
if (($4>0) && ($4<200)) {Out4=$4;Pre4=$4 } else {Out4=Pre4};
if (($5>0) && ($5<200)) {Out5=$5;Pre5=$5 } else {Out5=Pre5};
if (($6>0) && ($6<200)) {Out6=$6;Pre6=$6 } else {Out6=Pre6};
if (($7>0) && ($7<200)) {Out7=$7;Pre7=$7 } else {Out7=Pre7};
print $1 " " Out2 " " Out3 " " Out4 " " Out5 " " Out6 " " Out7
}' >tmp/$i
done


for i in `ls *.power.machine`
do
	cat $i|awk '{ if ($1=="n01") { if ( NR %2 ==0 ) {   print NR/2 " "  $3; } else { print (NR-1)/2+1 " "  $3;}} }'|awk 'BEGIN {Pre2=0}
{ 

if (($2>0) && ($2<200))  {Out2=$2;Pre2=$2 } else {Out2=Pre2};
print $1 " " Out2
}' >tmp/$i.n01
	cat $i|awk '{ if ($1=="n02") { if ( NR %2 ==0 ) {   print NR/2 " "  $3; } else { print (NR-1)/2+1 " "  $3;}} }'|awk 'begin {Pre2=0}
{ 
if (($2>0) && ($2<200))  {Out2=$2;Pre2=$2 } else {Out2=Pre2};
print $1 " " Out2
}' >tmp/$i.n02

done




