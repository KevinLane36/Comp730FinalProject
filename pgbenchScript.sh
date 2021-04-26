#! /bin/bash


hypervisor = $1
host = $2
guest = $3
ram = $4

echo "Starting PGBench Test"
echo "Starting new PGBench Test" >> pgbenchResults_${hypervisor}_${host}_${guest}_${ram}.txt
sudo su postgres
psql -c "CREATE DATABASE testdb;"
pgbench -i testdb -s 334
pgbench -c 10 -j 1 -t 100 testdb >> pgbenchResult_${hypervisor}_${host}_${guest}_${ram}.txt


echo "Starting sysbench Test"
echo "Starting new sysbench Test" >> sysbenchResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting CPU test" >> sysbenchResults_${hypervisor}_${host}_${guest}_${ram}.txt
sysbench --test=cpu --cpu-max-prime=20000 run >> sysbenchResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting Mem test" >> sysbenchResults.txt
sysbench --test=memory --memory-block-size=1M --memory-total-size=4G --num-threads=1 run >> sysbenchResults_${hypervisor}_${host}_${guest}_${ram}.txt
