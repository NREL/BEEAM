#ifndef ADD2_C
#define ADD2_C

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "dataIO.h"

int writeNodeVoltage(double re, double im, const char *name){
	double data[2] = {re, im};

	// open file handle
	FILE *fHandleWrite = fopen(name, "w");
	assert(fHandleWrite);

	fclose(fHandleWrite);
	return fwrite(data, sizeof data[0], 2, fHandleWrite);;
}
#endif