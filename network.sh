#! /bin/bash

echo "What hypervisor are you using?"
read hypervisor

echo "What host OS are you running on?"
read host

echo "What guest OS are you running?"
read guest

echo "How many GB of RAM?"
read ram

echo "What is the IP address for iperf3 server?"
read ipaddr

tcp_time="tcp_time_${hypervisor}_${host}_${guest}_${ram}.json"
udp_time="udp_time_${hypervisor}_${host}_${guest}_${ram}.json"
tcp_space="tcp_space_${hypervisor}_${host}_${guest}_${ram}.json"
udp_space="udp_space_${hypervisor}_${host}_${guest}_${ram}.json"

iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J --logfile $tcp_time
iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J -u --logfile $udp_time
iperf3 -c $ipaddr -p5201 -k1000 -J --logfile $tcp_space
iperf3 -c $ipaddr -p5201 -k1000 -J -u --logfile $udp_space


echo "Running $guest on $host using $hypervisor with $ram GB of RAM."