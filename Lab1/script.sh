#!bin/bash

#TBEidle = 0.732

#TBEsleep = 73.41

cd dpm-simulator/
make clean
make
cd ..

while true
do
    read -p "Choose policy to be used [t/h], t for timeout and h for history: " choice
        if [ "$choice" == "t" ] || [ "$choice" == "h" ]; then
            break
        fi
done

read -p "Select the workload to analyze: " file
echo "$file.txt will be used for simulation"
read -p "Select the file that describes the PSM of the resource: " psm
echo $psm

if [ "$choice" == "t" ]; then

    read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
    echo $TOin
    read -p "Enter the final TO for the simulation(unit is in ms): " TOend
    echo $TOend

    read -p "Select the kind of transition: 0(Run -> IDLE), 1(Run -> Sleep): " transition
    echo $transition

    if [ "$transition" == "0" ]; then
        out=IDLE
    else
        out=SLEEP
    fi

    rm results/using_TO/TO.txt
    rm results/using_TO/${file}_energy_w_DPM${out}.txt
echo "$psm.txt will be used for simulation"

if [ "$choice" == "t" ]; then
    read -p "Enter the initial TO for the simulation(unit is in ms): " TOin
    read -p "Enter the final TO for the simulation(unit is in ms): " TOend
    echo "TO starts at $TOin and ends at $TOend"


    rm results/using_TO/TO.txt
    rm results/using_TO/${file}_energy_w_DPM${out}.txt

    for (( c=$TOin; c<=$TOend; c=c+1 )) do 
        echo "Simulation when TO is $c"
        echo "$c" >> results/using_TO/TO.txt
    ./dpm-simulator/dpm_simulator -t $c -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" | sed 's/.$//' >> results/using_TO/${file}_energy_w_DPM${out}.txt
    echo "-------------------------------------------------------------------------------------"
    done
fi


if [ "$choice" == "h" ]; then

    read -p "Enter the initial and final value for the first threshold (unit is in ms): " Thresh1_initial Thresh1_final
    echo "Threshold 1 starts at $Thresh1_initial and ends at $Thresh1_final, with an increment of 10"
    read -p "Enter the initial and final value for the second threshold (unit is in ms): " Thresh2_initial Thresh2_final
    echo "Threshold 2 starts at $Thresh2_initial and ends at $Thresh2_final, with an increment of 10"

    rm results/using_history/Thresholds.txt
    rm results/using_history/Threshold1.txt
    rm results/using_history/Threshold2.txt
    rm results/using_history/${file}_energy_w_DPM.txt
    rm results/using_history/${file}_fixed_Th2_energy_w_DPM.txt
    rm results/using_history/${file}_fixed_Th1_energy_w_DPM.txt

    fixed_Thresh2=70
    fixed_Thresh1=0
    for (( Thresh1=$Thresh1_initial; Thresh1<=$Thresh1_final; Thresh1=Thresh1+10 )) do
        for (( Thresh2=$Thresh2_initial; Thresh2<=$Thresh2_final; Thresh2=Thresh2+10 )) do

            #Threshhold 1 and 2 are varying
            echo "Simulation when Threshold1 is $Thresh1 and Threshold2 is $Thresh2"
            echo "$Thresh1 $Thresh2" >> results/using_history/Thresholds.txt
            echo "$Thresh1" >> results/using_history/Threshold1.txt
            echo "$Thresh2" >> results/using_history/Threshold2.txt
            ./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt -h 1 $Thresh1 $Thresh2 | tail -1 | grep -oP '=[^=]+' | tail -1 | tr -d ' ' | sed 's/.$//; s/=//' >> results/using_history/${file}_energy_w_DPM.txt

            #Case Threshold 2 is fixed
            echo "Simulation when Threshold1 is $Thresh1 and Threshold2 is $fixed_Thresh2 (fixed)"
            ./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt -h 1 $Thresh1 $fixed_Thresh2 | tail -1 | grep -oP '=[^=]+' | tail -1 | tr -d ' ' | sed 's/.$//; s/=//' >> results/using_history/${file}_fixed_Th2_energy_w_DPM.txt


            #Case Threshold 1 is fixed
            echo "Simulation when Threshold1 is $fixed_Thresh1 (fixed) and Threshold2 is $Thresh2"
            ./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt -h 1 $fixed_Thresh1 $Thresh2 | tail -1 | grep -oP '=[^=]+' | tail -1 | tr -d ' ' | sed 's/.$//; s/=//' >> results/using_history/${file}_fixed_Th1_energy_w_DPM.txt
        done
    done
fi

fi 

if [ "$choice" == "h" ]; then

    read -p "Enter the initial and final value for the first threshold (unit is in ms): " Thresh1_initial Thresh1_final
    echo $Thresh1_initial
    echo $Thresh1_final
    read -p "Enter the initial and final value for the second threshold (unit is in ms): " Thresh2_initial Thresh2_final
    echo $Thresh2_initial
    echo $Thresh2_final

    rm results/using_history/Thresholds.txt
    rm results/using_history/${file}_energy_w_DPM.txt
    coeff_initial=-1
    coeff_final=1
    for (( Thresh1=$Thresh1_initial; Thresh1<=$Thresh1_final; Thresh1=Thresh1+1 )) do
        for (( Thresh2=$Thresh2_initial; Thresh2<=$Thresh2_final; Thresh2=Thresh2+1 )) do
            echo "Simulation when Threshold1 is $Thresh1 and Threshold2 is $Thresh2"
            echo "$Thresh1 $Thresh2" >> results/using_history/Thresholds.txt
            coeff=$coeff_initial
            coeff1=0.5
            ./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/psm.txt -wl ./workloads/workload_1.txt -h $coeff1 $coeff1 $coeff1 $coeff1 $coeff1 $Thresh1 $Thresh2 | tail -1 | grep -oP '=[^=]+' | tail -1 | tr -d ' ' | sed 's/.$//; s/=//' >> results/using_history/${file}_energy_w_DPM.txt
            # while (( $(awk -v coeff="$coeff" -v final="$coeff_final" 'BEGIN {print (coeff <= final)}') )); do 
            #    echo "coeff = $coeff"
             #   ./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/psm.txt -wl ./workloads/workload_1.txt -h $coeff $coeff $coeff $coeff $coeff $Thresh1 $Thresh2 | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" | sed 's/.$//' >> results/using_history/${file}_energy_w_DPM_h.txt
              #  coeff=$(awk -v coeff="$coeff" 'BEGIN {printf "%.2f", coeff + 0.2}')
            #done
        done
    done
fi
#./dpm-simulator/dpm_simulator -psm ./dpm-simulator/example/psm.txt -wl ./workloads/workload_1.txt -h 0.5 0.5 0.5 0.5 0.5 0 65