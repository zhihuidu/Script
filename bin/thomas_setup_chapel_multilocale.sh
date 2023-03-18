#!/bin/bash

export CHPL_HOME=/rhome/zhihui/chapel
#export CHPL_HOME=/rhome/zhihui/chapel-1.25.1
#export CHPL_HOME=/rhome/oaa9/chapel-1.25.0
export CHPL_HOME=/rhome/zhihui/chapel-1.28.0
#export CHPL_HOME=/rhome/zhihui/chapel-a
#export CHPL_HOME=/mnt/data/sw/chapel-1.23.0
source $CHPL_HOME/util/setchplenv.bash

export CHPL_COMM=gasnet
export CHPL_TARGET_CPU=native
export CHPL_COMM_SUBSTRATE=ibv
#export CHPL_LAUNCHER=slurm-gasnetrun_ibv

# Specify a 2-hour maximum run time
export CHPL_LAUNCHER_WALLTIME=92:00:00
# Specify the Slurm partition to use
export SALLOC_PARTITION=defq
export SLURM_PARTITION=$SALLOC_PARTITION


export CHPL_LLVM=bundled

#####
export CHPL_MEM=jemalloc
export CHPL_TASKS=qthreads
export CHPL_HWLOC=bundled
export CHPL_GMP=bundled
export CHPL_LAUNCHER=gasnetrun_ibv


export GASNET_ODP_VERBOSE=0
export GASNET_PHYSMEM_NOPROBE=1
export GASNET_IBV_SPAWNER=ssh

#export GASNET_PHYSMEM_MAX=1G
#export GASNET_VERBOSEENV=1
export GASNET_ROUTE_OUTPUT=0
#export CHPL_LLVM=llvm
#suggested by Thomas
export GASNET_PHYSMEM_MAX='60 GB'
export GASNET_PINNED_REGIONS_MAX=497830
export GASNET_PHYSMEM_NOPROBE=1
