# include <stdio.h>

int main(){
    //ej5
    printf("float(%lu): %.20f \n", sizeof(0.1F), 0.1F);
    printf("double(%lu): %.20lf \n", sizeof(0.1), 0.1);
    //ej6
    float f = 1.23F;
    double d = 3.996;
    int fi = (int) f;
    int di = (int) d;
    printf("float original: %.20f \n", f);
    printf("float casteado a int: %d \n", fi);
    printf("double original: % .20lf \n", d);
    printf("double casteado a int: %d \n", di);

    return 0;
}