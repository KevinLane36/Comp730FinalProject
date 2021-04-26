#! /bin/bash

echo "Installing PSQL and PGBench
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo "Installing sysbench"
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
sudo apt -y install sysbench

echo "Installing fio"
sudo apt -y install fio

echo "Installing iperf3"
sudo apt-get install iperf3
