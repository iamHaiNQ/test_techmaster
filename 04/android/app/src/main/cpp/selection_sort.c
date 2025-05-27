// selection_sort.c
#include <stdint.h>
#include <stdlib.h>

typedef enum {
    COMPARE,
    ACCESS,
    SWAP
} StepType;

typedef struct {
    StepType type;
    int index1;
    int index2;
} SortStep;

static SortStep steps[10000];
static int step_count = 0;

void log_step(StepType type, int i, int j) {
    steps[step_count++] = (SortStep){ type, i, j };
}

int* get_steps(int* out_length) {
    *out_length = step_count;
    return (int*)steps;
}

void selection_sort(int* array, int length) {
    step_count = 0;
    for (int i = 0; i < length - 1; i++) {
        int min_index = i;
        for (int j = i + 1; j < length; j++) {
            log_step(COMPARE, j, min_index);
            if (array[j] < array[min_index]) {
                min_index = j;
            }
        }
        if (i != min_index) {
            log_step(SWAP, i, min_index);
            int temp = array[i];
            array[i] = array[min_index];
            array[min_index] = temp;
        }
    }
}
