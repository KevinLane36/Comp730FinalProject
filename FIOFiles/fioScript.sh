#! /bin/bash


hypervisor = $1
host = $2
guest = $3
ram = $4


echo "Starting FIO File Tests"
echo "Starting new FIO Tests" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting random read test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio randomReadJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting random write test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt 
fio randomWriteJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting sequential read test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio sequentialReadJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Starting sequential write test" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
fio sequentialWriteJob.fio >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
rm randread*
rm randwrite*
rm sequential_read*
rm sequential_write*
echo "Finished running FIO Tests" >> fioResults_${hypervisor}_${host}_${guest}_${ram}.txt
echo "Finished running FIO File Tests"

