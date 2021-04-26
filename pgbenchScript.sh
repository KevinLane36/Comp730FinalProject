echo "Starting PGBench Test"
echo "Starting new PGBench Test" >> pgbenchResults.txt
sudo su postgres
psql -c "CREATE DATABASE testdb;"
pgbench -i testdb -s 334
pgbench -c 10 -j 1 -t 100 testdb >> pgbenchResults.txt


echo "Starting sysbench Test"
echo "Starting new sysbench Test" >> sysbenchResults.txt
echo "Starting CPU test" >> sysbenchResults.txt
sysbench --test=cpu --cpu-max-prime=20000 run >> sysbenchResults.txt
echo "Starting Mem test" >> sysbenchResults.txt
sysbench --test=memory --memory-block-size=1M --memory-total-size=4G --num-threads=1 run >> sysbenchResults.txt
