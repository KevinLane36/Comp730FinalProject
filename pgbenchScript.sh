echo "Starting PGBench Test"
sudo su postgres
psql -c "CREATE DATABASE testdb;"
pgbench -i testdb -s 334
pgbench -c 10 -j 1 -t 100 testdb >> pgbenchResults.txt
