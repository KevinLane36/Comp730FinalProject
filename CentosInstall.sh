#! /bin/bash

echo "Installing PSQL and PGBench"
sudo yum install postgresql-server postgresql-contrib -y
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql


echo "Installing sysbench"
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash
sudo yum -y install sysbench

echo "Installing fio"
sudo yum -y install fio

echo "Installing iperf3"
sudo yum -y install iperf3
