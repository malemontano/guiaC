#include <stdio.h>
#include <stdbool.h>

int main(){
    int a = 5;
    int b = 3;
    int c = 2;
    int d = 1;
    int r1 = a+b*c/d;
    int r2 = a%b;
    bool r3 = a==b;
    bool r4 = a!=b;
    int s = a >> 1;
    printf("suma y multiplicacion: %d \n", r1);
    printf("resto: %d \n", r2);
    printf("igualdad: %d \n", r3);
    printf("desigualdad: %d \n", r4);
    printf("shifteo: %d \n", s);
}