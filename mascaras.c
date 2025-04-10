#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

int main(){
    uint32_t mask1 = 0x00000007;
    uint32_t mask2 = 0xE0000000;
    uint32_t b = 0xE1234567;
    uint32_t a = 0xABCD1237;
    uint32_t bitsBajos = a&mask1;
    uint32_t bitsAltos = b&mask2;
    bitsAltos = bitsAltos >> 29;
    bool comp = bitsAltos == bitsBajos;
    if (comp==1)
    {
        printf("son iguales\n");
    }
    
    
    


}