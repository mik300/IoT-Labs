#!bin/bash

read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
echo $TOin
read -p "Enter the final TO for the simulation(unit is in ms): " TOend
echo $TOend
read -p "Select the workload to analyze: " file
echo $file
read -p "Select the file that describes the PSM of the resource: " psm
echo $psm


for (( c=$TOin; c<=$TOend; c++ )) do 
    echo "Simulation when TO is $c"
   ./dpm-simulator/dpm_simulator -t $c -psm ./dpm-simulator/example/$psm -wl ./workloads/$file
   echo "-------------------------------------------------------------------------------------"
done
