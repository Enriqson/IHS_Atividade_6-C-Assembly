#include <stdio.h>

void print(int* vec, int size){
    int i;
    for(i=0;i<size;i++){
        printf("%d",vec[i]);
    }
    printf("\n");
}