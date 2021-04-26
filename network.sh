#! /bin/bash

hypervisor = $1
host = $2
guest = $3
ram = $4
ipaddr = $5

tcp_time="tcp_time_${hypervisor}_${host}_${guest}_${ram}.json"
udp_time="udp_time_${hypervisor}_${host}_${guest}_${ram}.json"
tcp_space="tcp_space_${hypervisor}_${host}_${guest}_${ram}.json"
udp_space="udp_space_${hypervisor}_${host}_${guest}_${ram}.json"

iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J --logfile $tcp_time
iperf3 -c $ipaddr -p5201 -t10 b-1000000000 -J -u --logfile $udp_time
iperf3 -c $ipaddr -p5201 -k1000 -J --logfile $tcp_space
iperf3 -c $ipaddr -p5201 -k1000 -J -u --logfile $udp_space


echo "Running $guest on $host using $hypervisor with $ram GB of RAM."
