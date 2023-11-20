cd dpm-simulator/
make clean
make
cd ..

read -p "Select the workload to analyze: " file
echo "$file.txt will be used for simulation"
read -p "Select the file that describes the PSM of the resource: " psm
echo "$psm.txt will be used for simulation"

read -p "Select the kind of transition: 0(Run -> IDLE), 1(Run -> Sleep): " transition
echo $transition

read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
echo $TOin
read -p "Enter the final TO for the simulation(unit is in ms): " TOend
echo $TOend

read -p "Where do you want to read the results?: 0(Terminal), 1(Files): " show
echo $show

if [ "$transition" == "0" ]; then
    out=IDLE
else
    out=SLEEP
fi

rm results/using_TO/TO.txt
rm results/using_TO/${file}_energy_w_DPM${out}.txt

for (( c=$TOin; c<=$TOend; c=c+1 )) do 
    echo "Simulation when TO is $c"
    echo "$c" >> results/using_TO/TO.txt
    if [ "$show" == "0" ]; then
        #For reading the results in the terminal
        ./dpm-simulator/dpm_simulator -t $c $transition -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt #| tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" | sed 's/.$//' >> results/using_TO/${file}_energy_w_DPM${out}.txt

    else
        #For writing the results in the
        ./dpm-simulator/dpm_simulator -t $c $transition -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" | sed 's/.$//' >> results/using_TO/${file}_energy_w_DPM${out}.txt
    fi
    echo "-------------------------------------------------------------------------------------"  


done