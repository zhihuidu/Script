#!/bin/bash

#
# Identify LabView host
#
export PPX_LVHOST=172.25.69.201
export PPX_LVHOST_PORT=4444
export PPXPATH=$PWD

#
# Set the default number of threads
#
export PPX_NTHREADS=2
if [ `hostname` = "alamere-kncc1" ]; then
	export PPX_NTHREADS=8
fi

# Set path to executables
export PATH=$PATH:$PPXPATH/Utils/PPXRapl/:$PPXPATH/Utils/PPXPulse/



#
# Load Frequency Utilities
#
source ./Utils/PPXFreq/setFreq.sh


#
# Load Pulse Utilities
#
source ./Utils/PPXPulse/ppx_pulse.sh

#
# Utility commands
export updateTime="ntpdate scsamr202.amr.corp.intel.com"

#sudo chmod o+rw /dev/cpu/*/msr
sudo chmod o+rw /sys/devices/system/cpu/*/cpufreq/scaling_setspeed
sudo chmod o+rw /sys/devices/system/cpu/*/cpufreq/scaling_governor

cd Utils/PPXPulse
make
cd ../../
