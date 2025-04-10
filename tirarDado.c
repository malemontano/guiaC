#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int main(){
    int cantidadPorCara[6]={0};
    for(int i=0; i<60000000; i++){
        int dado = rand() % 6 + 1;
        cantidadPorCara[dado-1]++;
    }
    for(int i=0; i<6; i++){
        printf("cantidad de veces que salio el %d : %d \n", i+1,cantidadPorCara[i]);
    }
}