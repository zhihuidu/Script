#!/bin/bash

##########################
# Software Check
##########################

# Make sure cpuid is installed
if [ ! -f /usr/bin/cpuid ];
then
	echo "Need to install cpuid"
	sudo apt-get install cpuid
fi

if [ ! -f /usr/bin/php ];
then
	echo "Need to install php"
	sudo apt-get install php5-cli
fi

if [ ! -f /usr/bin/yasm ];
then
	echo "Need to install yasm"
	sudo apt-get install yasm
fi

if [ ! -f /usr/bin/unzip ];
then
	echo "Need to install unzip"
	sudo apt-get install unzip
fi

if [ ! -f /usr/bin/gfortran ];
then
	echo "Need to install gfortran"
	sudo apt-get install gfortran
fi

if [ ! -f /sbin/setcap ];
then
	echo "Need to install setcap"
	sudo apt-get install libcap2-bin
	#sudo setcap cap_sys_rawio+ep ./Utils/PPXRapl/ppx_rapl
fi

if [ ! -f /usr/bin/numactl ];
then
	echo "Need to install numactl"
	sudo apt-get install numactl
fi

if [ ! -f /usr/bin/curl ];
then
	echo "Need to install curl"
	sudo apt-get install curl
fi

if [ ! -f /usr/bin/python ];
then
	echo "Need to install python"
	sudo apt-get install python2.7 
fi

if [ ! -f /usr/bin/pip ];
then
	echo "Need to install pip"
	sudo apt-get install python-pip
	sudo pip install sh
fi

##########################
# Set Paths
##########################
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$PWD/Benchmarks/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$PWD/Benchmarks/include
export PYTHONPATH=$PYTHONPATH:$PWD/Utils/

##########################
#  Fix MSR issues in Ubuntu 13.04 
##########################
if [ `lsb_release -r | grep 13.04 | wc -l`  -gt "0" ]; then
	echo "Ubuntu 13.04 Hack"
	if [ ! -f /sbin/setcap ];
	then
		echo "Need to install setcap"
		sudo apt-get install libcap2-bin
	fi
	echo "Setting permissions"
	sudo setcap cap_sys_rawio+ep ./Utils/PPXRapl/ppx_rapl
fi



##########################
# Filesysem Check
##########################

if [ ! -d ./Benchmarks/results/ ]; then
	mkdir ./Benchmarks/results/
fi

if [ ! -d ./Benchmarks/AVX/kernels ]; then
	mkdir ./Benchmarks/AVX/kernels/
fi

if [ ! -d ./Benchmarks/AVX/experiments ]; then
	mkdir ./Benchmarks/AVX/experiments/
fi





##########################
# Environment Variables
##########################

export PPX_CORES=`grep -c ^processor /proc/cpuinfo`
export PPX_ARCH=unknown
export PPX_GENERATION=0
export PPX_VERSION=`cpuid | grep Version | cut -b 12-15`
export PPX_CLOCKFREQ=`cat /proc/cpuinfo | grep "cpu MHz" | head -n 1 | cut -b 12-30`

export PPX_AVX=0
if [ `grep -c avx /proc/cpuinfo` -gt "0" ]; then
	export PPX_AVX=1
fi

export PPX_AVX2=0
if [ `grep -c avx2 /proc/cpuinfo` -gt "0" ]; then
	export PPX_AVX2=1
fi

export PPX_PENRYN=0
if [ $PPX_VERSION == "1067" ] || [ $PPX_VERSION == "106d" ]; then
	export PPX_ARCH=PENRYN
	export PPX_PENRYN=1
	export PPX_GENERATION=1
fi

export PPX_NEHALEM=0
if [ $PPX_VERSION == "206e" ] || [ $PPX_VERSION == "106a" ] || [ $PPX_VERSION == "106e" ]; then
	export PPX_ARCH=NEHALEM
	export PPX_NEHALEM=1
	export PPX_GENERATION=2
fi

export PPX_WESTMERE=0
if [ $PPX_VERSION == "2065" ] || [ $PPX_VERSION == "206c" ] || [ $PPX_VERSION == "206f" ]; then
	export PPX_ARCH=WESTMERE
	export PPX_WESTMERE=1
	export PPX_GENERATION=3
fi

export PPX_SANDYBRIDGE=0
if [ $PPX_VERSION == "206a" ] || [ $PPX_VERSION == "206d" ]; then
	export PPX_ARCH=SANDYBRIDGE
	export PPX_SANDYBRIDGE=1
	export PPX_GENERATION=4
fi

export PPX_IVYBRIDGE=0
if [ $PPX_VERSION == "306a" ]; then
	export PPX_ARCH=IVYBRIDGE
	export PPX_IVYBRIDGE=1
	export PPX_GENERATION=5
fi

export PPX_HASWELL=0
if [ `grep -c avx2 /proc/cpuinfo` -gt "0"  ]; then
	export PPX_ARCH=HASWELL
	export PPX_HASWELL=1
	export PPX_GENERATION=6
fi

##########################
# Set SPEC Path 
#########################
if [ -f Benchmarks/spec2k6-v1.1/shrc ];
then
	echo "Loading SPEC paths"
	pushd .
	cd Benchmarks/spec2k6-v1.1/
	. ./shrc
	popd
fi


#load MSR module for rapl
#sudo modprove msr
#sudo chmod o+rw /dev/cpu/0/msr

##########################
# Build Packages
##########################
#make -C Libs/OpenBLAS/
#make -C Utils/PPXPulse/
make all
