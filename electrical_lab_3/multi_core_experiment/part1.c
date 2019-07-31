#include "/cygdrive/c/cygwin/home/plurality/include/hal.h"
#include "top_enums.h"

#define N 16

int ExampleArray1[N] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
int ExampleArray2[N] = {10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160};

int flag, size;

void init (void) HAL_DEC_TASK;
void evaluate (void) HAL_DEC_TASK;
void finish (void) HAL_DEC_TASK;

/* The init task initialize the quota of task evaluate */
void init (void) {
		/* set r5 to be the number of Active cores  */
		/* in this code r5=1 there for single active core */
		asm volatile (".long 0x81B000A0;"\
			"set 256,%r6;"\
			"set 32,%r5;"\ /* set the number of cores */
			"start_loop:;"\
			"cmp %r5,%r6;"\
			"be end_loop;"\
			"nop;"\
			"sta %r0,[%r5]222;"\
			"ba start_loop;"\
			"add %r5,1,%r5;"\
			"end_loop:"\
			".long 0x81B000E0;");

		flag = 0;

		/* size update is done before the loop body so we start from 2N */
		size = 2 * N;

		HAL_SET_QUOTA(evaluate, N);
}

/* The evaluate task evaluates the add of ExampleArray1[i] and ExampleArray2[i] */
void evaluate (void) {

	int id = HAL_TASK_INST;

	ExampleArray1[id] += ExampleArray2[id];
}

void cond(void) {

	if(size == 1) {
		HAL_TASK_RET_FALSE;
	} else {
		size /= 2;
		HAL_SET_QUOTA(body,size / 2);
		HAL_TASK_RET_TRUE;
	}
}

void body(void) {

	int id = HAL_TASK_INST;
	int stride = size / 2;

	ExampleArray1[id] += ExampleArray1[id + stride];
}

void finish (void) {
	flag = 1;
}


