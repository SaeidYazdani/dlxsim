#ifndef BRANCH_H
#define BRANCH_H

#define BITS_IN_BTB_INDEX 8

#define BRANCH_DELAY 0
#define BRANCH_FLUSH 1
#define BRANCH_NOTTAKEN 2
#define BRANCH_BTB 3
#define BRANCH_IDEAL 4

#define SURE_BRANCH_TAKEN 0
#define UNSURE_BRANCH_TAKEN 1
#define UNSURE_BRANCH_NOT_TAKEN 2
#define SURE_BRANCH_NOT_TAKEN 3

typedef struct {
	int tag;
	int target;
	int status;
} BTBEntry;

static BTBEntry bt_table[(1 << BITS_IN_BTB_INDEX)];

void initBTBTable();
int calculateBranchStall(int branchTaken, unsigned int addr, unsigned int target);

#endif
