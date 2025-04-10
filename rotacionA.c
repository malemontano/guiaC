#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int* rotar(int array[], int cantRotaciones, int length){
    int* rotados = malloc(length*sizeof(int));
    if (rotados == NULL) {
        printf("Error de memoria\n");
        return NULL;
    }
    for(int i=0; i<cantRotaciones; i++){
        rotados[i]=array[i]; //me guardo los q se rotan
    }

    for(int i=0; i<length-cantRotaciones; i++){
        array[i]=array[i+cantRotaciones];
    }
    for(int i=0; i<cantRotaciones; i++){
        array[length-cantRotaciones+i]=rotados[i];
    }
    free(rotados);
    return array;
}

int main(){
    int array[] = {1,2,3,4,5,6};
    int cantRotaciones = 2;
    int length = sizeof(array)/sizeof(int);
    int* arrayRotado = rotar(array, cantRotaciones, length);
    printf("cantidad de rotaciones: %d, miArrayRotado:\n", cantRotaciones);
    for (int i = 0; i < length; i++) {
        printf("%d ", arrayRotado[i]);
    }
    printf("\n");
}