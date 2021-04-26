#! /bin/bash

echo "Installing PSQL and PGBench"
sudo yum install postgresql-server postgresql-contrib -y
sudo su postgres
psql -c "CREATE DATABASE testdb;"
pgbench -i testdb -s 334
pgbench -c 10 -j 1 -t 100 testdb

echo "Installing sysbench"
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash
sudo yum -y install sysbench

echo "Installing fio"
sudo yum -y install fio

echo "Installing iperf3"
sudo yum -y install iperf3
