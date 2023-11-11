#!bin/bash

read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
echo $TOin
read -p "Enter the final TO for the simulation(unit is in ms): " TOend
echo $TOend
read -p "Select the workload to analyze: " file
echo $file
read -p "Select the file that describes the PSM of the resource: " psm
echo $psm

rm results/TO.txt
rm results/${file}_results.txt

for (( c=$TOin; c<=$TOend; c=c+1 )) do 
    echo "Simulation when TO is $c"
    echo "$c" >> results/TO.txt
   ./dpm-simulator/dpm_simulator -t $c -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" | sed 's/.$//' >> results/${file}_results.txt
   echo "-------------------------------------------------------------------------------------"
done
