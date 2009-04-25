#ifndef BRANCH_H
#define BRANCH_H

#define BITS_IN_BTB_INDEX 8

#define SURE_BRANCH_TAKEN 0
#define UNSURE_BRANCH_TAKEN 1
#define UNSURE_BRANCH_NOT_TAKEN 2
#define SURE_BRANCH_NOT_TAKEN 3

typedef struct {
	int tag;
	int target;
	int status;
} BTBEntry;

int calculateBranchStall(int branchTaken, unsigned int addr, unsigned int target);

#endif
