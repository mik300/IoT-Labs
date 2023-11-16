#include "inc/utilities.h"

int parse_args(int argc, char *argv[], char *fwl, psm_t *psm, dpm_policy_t
        *selected_policy, dpm_timeout_params *tparams, dpm_history_params
        *hparams)
{
    int cur = 1;
    while(cur < argc) {

        if(strcmp(argv[cur], "-help") == 0) {
            print_command_line();
            return 0;
        }

        // set policy to timeout and get timeout value
        //Time-based policy
        if(strcmp(argv[cur], "-t") == 0) {
            *selected_policy = DPM_TIMEOUT;
            if(argc > cur + 1) {
                tparams->timeout = atof(argv[++cur]);
                // ./dpm-simulator/dpm_simulator -t $c -psm ./dpm-simulator/example/${psm}.txt -wl ./workloads/${file}.txt | tail -1 | grep -Eo "[0-9]+\.[0-9]+J$" >> results/${file}_result.txt

                tparams->transition = atof(argv[++cur]);; //This has to be modified to consider the second parameter of the structure
                //WE HAVE TO CHANGE THIS
            }
            else return	0;
        }

        // set policy to history based and get parameters and thresholds
        //Predictive policy
        // there should be 7 arguments for -h, first 5 are the alpha coefficients, the last 2 are the thresholds
        if(strcmp(argv[cur], "-h") == 0) {
            *selected_policy = DPM_HISTORY;
            if(argc > cur + DPM_HIST_WIND_SIZE + 2){
                
                hparams->alpha = atof(argv[++cur]);
                hparams->threshold[0] = atof(argv[++cur]);
                hparams->threshold[1] = atof(argv[++cur]);

            } else return 0;
        }

        // set name of file for the power state machine
        if(strcmp(argv[cur], "-psm") == 0) {
            if(argc <= cur + 1 || !psm_read(psm, argv[++cur]))
                return 0;
        }

        // set name of file for the workload
        if(strcmp(argv[cur], "-wl") == 0)
        {
            if(argc > cur + 1)
            {
                strcpy(fwl, argv[++cur]);
            }
            else return	0;
        }
        cur ++;
    }
    return 1;
}

void print_command_line(){
	printf("\n******************************************************************************\n");
	printf(" DPM simulator: \n");
	printf("\t-t <timeout>: timeout of the timeout policy\n");
	printf("\t-h <Value1> …<Value5> <Threshold1> <Threshold2>: history-based policy \n");
	printf("\t   <Value1-5> value of coefficients\n");
	printf("\t   <Threshold1-2> predicted time thresholds\n");
	printf("\t-psm <psm filename>: the power state machine file\n");
	printf("\t-wl <wl filename>: the workload file\n");
	printf("******************************************************************************\n\n");
}
