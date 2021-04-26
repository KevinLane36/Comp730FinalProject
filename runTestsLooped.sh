#! /bin/bash

if [ "$#" -ne 4 ]; then
    echo "Illegal number of parameters. Please provider [hypervisor host guest ram]"
fi

hypervisor=$1
host=$2
guest=$3
ram=$4


for i in 1 2 3 4 5
do
   bash FIOFiles/fioScript.sh hypervisor host guest ram
   bash pgbench-sysbenchScript.sh hypervisor host guest ram
done
