#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
    int global = 12;
    int global = defLocal();
    printf("variable global: %d \n", global);
    printf("variable local: %d \n", global);
}
int defLocal(){
    int local = 8;
    return local;
}