#include "branch.h"

int calculateBranchStall(int taken)
{
	int stall = 0;
	
	if(g_handleBranch == BRANCH_FLUSH)
	{
		stall = 1;
	}
	//Predicting not taken adds 1 stall cycles if taken, and 0 if not taken
	else if(g_handleBranch == BRANCH_NOTTAKEN)
	{
		if(branchTaken == 1)
		{
			stall = 1;
		}
	}
	//Ideal branch handling adds 0 stall cycles
	else if(g_handleBranch == BRANCH_IDEAL)
	{
		//do nothing
	}
	//BTB dynamic prediction
	else
	{
        static BTBEntry bt_table[(1 << BITS_IN_BTB_INDEX)] = {{-1}, {0}, {0}}; 
		
        int index = (machPtr->regs[PC_REG] >> 2) & ((1 << BITS_IN_BTB_INDEX) - 1);
        
		//Not in the BTB (Or different tag for given index), so insert new entry
		if(bt_table[index].tag == -1 || bt_table[index].tag != (machPtr->regs[PC_REG] >> (BITS_IN_BTB_INDEX + 2)))
		{
			bt_table[index].tag = (machPtr->regs[PC_REG] >> (BITS_IN_BTB_INDEX + 2));
			bt_table[index].target = pc;
			
			//Was taken, so need to stall 1 cycle and set prediction to unsure taken
			if(branchTaken == 1)
			{
				stall = 1;
				bt_table[index].status = UNSURE_BRANCH_TAKEN;
			}
			//Was not taken, so need to set prediction to unsure not taken
			else
			{
				bt_table[index].status = UNSURE_BRANCH_NOT_TAKEN;
			}
		}
		else
		{
			//The predicted and resolved targets are not the same, needs stall and predicted target update
			if(bt_table[index].target != pc)
			{
				stall = 1;
				bt_table[index].target = pc;
			}
			
			//Branch was taken
			if (branchTaken == 1)
	        {
	            switch(bt_table[index].status)
	            {
	                case SURE_BRANCH_TAKEN: //Assumed
	                    break;
	                case UNSURE_BRANCH_TAKEN:
	                    bt_table[index].status = SURE_BRANCH_TAKEN; //Assured
	                    break;                        
	                case UNSURE_BRANCH_NOT_TAKEN:
	                    bt_table[index].status = SURE_BRANCH_TAKEN;  //2 in a row -> switch
	                    break;                        
	                case SURE_BRANCH_NOT_TAKEN:
	                    bt_table[index].status = UNSURE_BRANCH_TAKEN; //Anomaly
	                    break;
	            }
	        }
			//Branch was not taken
	        else
	        {
	            switch(bt_table[index].status)
	            {
	                case SURE_BRANCH_TAKEN:
	                    bt_table[index].status = UNSURE_BRANCH_TAKEN; //Anomaly
	                    break;
	                case UNSURE_BRANCH_TAKEN:
	                    bt_table[index].status = SURE_BRANCH_NOT_TAKEN; //2 in a row -> switch
	                    break;                        
	                case UNSURE_BRANCH_NOT_TAKEN:
	                    bt_table[index].status = SURE_BRANCH_NOT_TAKEN; //Assured
	                    break;                        
	                case SURE_BRANCH_NOT_TAKEN: //Assumed
	                    break;
	            }
	        }  
		}
	}
	
	return stall;
}