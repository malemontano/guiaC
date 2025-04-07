#include <stdio.h>
#include <stdint.h>

int main(){
    char c = 100;
    short s = 1234;
    int i = -1234;
    long l = 123456789;

    int8_t i8 = 100;
    int16_t i16 = 100;
    int32_t i32 = 100;
    int64_t i64 = 100;
    uint8_t ui8 = 100;
    uint16_t ui16 = 100;
    uint32_t ui32 = 100;
    uint64_t ui64 = 100;

//ej3
    printf("char(%lu): %d \n", sizeof(c),c);
    printf("short(%lu): %d \n", sizeof(s),s);
    printf("int(%lu): %d \n", sizeof(i),i);
    printf("long(%lu): %ld \n", sizeof(l),l);
//ej4
    printf("int8_t(%lu): %d \n", sizeof(i8),i8);
    printf("int16_t(%lu): %d \n", sizeof(i16),i16);
    printf("int32_t(%lu): %d \n", sizeof(i32),i32);
    printf("int64_t(%lu): %ld \n", sizeof(i64),i64);
    printf("uint8_t(%lu): %d \n", sizeof(i8),ui8);
    printf("uint16_t(%lu): %d \n", sizeof(i16),ui16);
    printf("uint32_t(%lu): %d \n", sizeof(i32),ui32);
    printf("uint64_t(%lu): %ld \n", sizeof(i64),ui64);
    
    return 0;
}
