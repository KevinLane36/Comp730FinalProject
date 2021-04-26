#! /bin/bash

for i in 1 2 3 4 5
do
   bash FIOFiles/fioScript.sh
   bash pgbench-sysbenchScript.sh
done
