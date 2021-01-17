
# Start using remote
export PPX_USE_REMOTE=1
export PPX_LOGFILE="specint1_results.dat"

echo >> $PPX_LOGFILE
date >> $PPX_LOGFILE

#kernel_list=( perlbench bzip2 gcc mcf gobmk hmmer sjeng libquantum h264ref omnetpp astar xalancbmk)
kernel_list=(bzip2)

BeginRecording

for kernel in "${kernel_list[@]}"
do
	export PPX_REGION_LABEL="${kernel}"
	RegisterRegion ${kernel}
	StartRegion
	#runspec --config=ppx-SNB-4.cfg --size=ref --noreportable --tune=base --iterations=1 --rate 4 ${kernel}
	runspec --config=ppx-SNB-4.cfg --size=test --noreportable --tune=base --iterations=1  ${kernel}
	StopRegion
done

EndRecording


# Stop using remote
export PPX_USE_REMOTE=0
