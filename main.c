#include <stdio.h>
#include <stdlib.h>

extern void sort(int* vec, int size);

int main(){
    int size;
    int i=0;
    int* vec;
    printf("Insira o tamanho do vetor");
    scanf("%d",&size);

    i=size;

    for(i=0;i<size;i++){
        scanf("%d",&(vec[i]));
    }

    sort(vec,size);
    
    return 0;
}