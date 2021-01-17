echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
echo 1600000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
echo 1600000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
echo 1600000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed


taskset -c 0   ~/bin/StableWorkLoad  &
myid0=$!
taskset -c 1   ~/bin/StableWorkLoad  &
myid1=$!
taskset -c 2   ~/bin/StableWorkLoad  &
myid2=$!
taskset -c 3   ~/bin/StableWorkLoad  &
myid3=$!

export PPX_USE_REMOTE=1
export PPX_LOGFILE=2014-08-22-Test01-StableWorkLoad-StairTest.power
echo >> $PPX_LOGFILE
date >> $PPX_LOGFILE 
BeginRecording 
export PPX_REGION_LABEL=StableWorkLoad
RegisterRegion StableWorkLoad 
StartRegion 
sleep 10
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 34000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 34000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 34000000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 34000000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5


echo 3500000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
echo 3500000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
echo 3500000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
echo 3500000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 10

sleep 5
echo 3400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 3400000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 3400000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 3400000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 3200000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2800000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2400000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 2000000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_setspeed
sleep 5
echo 1600000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_setspeed
StopRegion 
EndRecording 
kill -9 ${my_pid0} 
kill -9 ${my_pid1} 
kill -9 ${my_pid2} 
kill -9 ${my_pid3} 
sleep 1
