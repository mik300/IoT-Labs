/**
 * @brief The main DPM simulator program
 */

#include "inc/psm.h"
#include "inc/dpm_policies.h"
#include "inc/utilities.h"

#define MAX_FILENAME 256

int main(int argc, char *argv[]) {

    char fwl[MAX_FILENAME];
    //These structures are described in "dpm_policies.h"
    psm_t psm;
    dpm_timeout_params tparams; //This structure contains two parameters: 1) timeout of type "psm_time_t" and
    // 2) transition of type "int". Moreover, when transition = 0 -> IDLE,  transition = 1 -> SLEEP
    dpm_history_params hparams;
    dpm_policy_t sel_policy;

    if(!parse_args(argc, argv, fwl, &psm, &sel_policy, &tparams, &hparams)) {
        printf("[error] reading command line arguments\n");
        return -1;
    }
    psm_print(psm);
	dpm_simulate(psm, sel_policy, tparams, hparams, fwl);

}
