# include <stdio.h>
# define FELIZ 0
# define TRISTE 1

void ser_feliz(int estado); //declara funcion
void print_estado(int estado);

int main(){
    int estado = TRISTE; // automatic duration. Block scope
    ser_feliz(estado);
    print_estado(estado); // qu´e imprime? como los parametros de la funcion son pasados por valor, se crea una copia
                        //de la variable q se pasa por argumento, por ende no se modifica la variable estado original
}

void ser_feliz(int estado){
    estado = FELIZ;
}
void print_estado(int estado){
    printf("Estoy %s\n", estado == FELIZ ? "feliz" : "triste"); //el estado no es feliz pq no se modifico en ningun momento, imprime triste
}