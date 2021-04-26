#! /bin/bash


hypervisor=$1
host=$2
guest=$3
ram=$4


echo "Starting new FIO File Tests"
echo "Starting new FIO File Tests" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting random read test"
echo "Starting random read test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio FIOJobFiles/randomReadJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
rm randread*
echo "Starting random write test" 
echo "Starting random write test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt 
fio FIOJobFiles/randomWriteJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
rm randwrite*
echo "Starting sequential read test" 
echo "Starting sequential read test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio FIOJobFiles/sequentialReadJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
rm sequential_read*
echo "Starting sequential write test"
echo "Starting sequential write test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio FIOJobFiles/sequentialWriteJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
rm sequential_write*
echo "Finished running FIO Tests" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Finished running FIO Tests"

