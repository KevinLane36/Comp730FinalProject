#! /bin/bash

if [ "$#" -ne 5 ]; then
    echo "Illegal number of parameters. Please provider [hypervisor host guest ram]"
    exit
fi

hypervisor=$1
host=$2
guest=$3
ram=$4
ipaddr=$5

for i in 1 2 3 4 5
do
   bash network.sh $hypervisor $host $guest $ram $ipaddr
done
