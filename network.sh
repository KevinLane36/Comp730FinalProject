#! /bin/bash

hypervisor=$1
host=$2
guest=$3
ram=$4
ipaddr=$5



echo "Starting PGBench Test"
echo "Starting new iperf Test" >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting tcp_time test"
echo "Starting tcp_time test" >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting udp_time test"
echo "Starting udp_time test" >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J -u >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting tcp_space test"
echo "Starting tcp_space test" >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
iperf3 -c $ipaddr -p5201 -k1000 -J >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting udp_space test"
echo "Starting udp_space test" >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt
iperf3 -c $ipaddr -p5201 -k1000 -J -u >> iperfResults_${hypervisor}_${host}_${guest}_${ram}.txt


echo "Running $guest on $host using $hypervisor with $ram GB of RAM."
