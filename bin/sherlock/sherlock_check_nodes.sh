#!/bin/bash
USER_NAME=$1

NODES=("node01" "node02" "node03" "node04" "node05" "node06" "node07" "node08" "node09" "node10" "node11" "node12" "node13" "node14" "node15" "node16" "node17" "node18" "node19" "node20" "node21" "node22" "node23" "node24" "node25" "node26" "node27" "node28" "node29" "node30" "node31" "node32")

echo ""
echo "Checking nodes for processes running by ${USER_NAME}"
for node in "${NODES[@]}"
do
    echo "Looking at ${node}"
    ssh ${node} ps -elf | grep "${USER_NAME}"
done
