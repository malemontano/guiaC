#include <stdint.h>
#include <stdio.h>

int main(){
    int array[] = {1,2,3,4,5,6};
    int length = sizeof(array)/sizeof(1);
    int rotado = array[0];
    for(int i=0; i<=length-2;i++){
        array[i]=array[i+1];
    }
    array[length-1]=rotado;
    printf("miArrayRotado:\n");
    for (int i = 0; i < length; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

}