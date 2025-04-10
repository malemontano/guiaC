#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
    int n=3;
    int res = factorial(n);
    printf("%d! = %d \n", n, res);
}

int factorial(int n){
    if(n==0){
        return 1;
    }
    int fact = n*factorial(n-1);
    return fact;
}