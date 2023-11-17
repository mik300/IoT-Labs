#TBEidle = 0.732

#TBEsleep = 73.41

cd dpm-simulator/
make clean
make
cd ..

read -p "Select the workload to analyze: " file
echo "$file.txt will be used for simulation"
read -p "Select the file that describes the PSM of the resource: " psm
echo "$psm.txt will be used for simulation"

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