#!bin/bash
cd dpm-simulator/ 
make
cd ..
read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
echo $TOin
read -p "Enter the final TO for the simulation(unit is in ms): " TOend
echo $TOend
read -p "Select the workload to analyze: " file
echo $file
read -p "Select the file that describes the PSM of the resource: " psm
echo $psm
read -p "Select the kind of transition: 0(Run -> IDLE), 1(Run -> Sleep): " transition
echo $transition

rm results/workload_1_result.txt
rm results/workload_2_result.txt



for (( c=$TOin; c<=$TOend; c=c+1 )) do 
    echo "Simulation when TO is $c"
   ./dpm-simulator/dpm_simulator -t $c $transition -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" >> results/${file}_result.txt
   echo "-------------------------------------------------------------------------------------"
done
