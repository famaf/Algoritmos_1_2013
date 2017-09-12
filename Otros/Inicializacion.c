/*
TODO
    1) funciones con arreglos
    2) inicializacion de arreglo con while/scanf
*/
#include <stdio.h>

#define N 5

void imprimirArreglo(int arreglo[N]) {
    int i = 0;
    while (i < N) {
        printf("%d\n",arreglo[i]);
        i = i + 1;
    }
}

void ingresarArreglo (int arreglo[N]) {
    int i = 0;
    while (i < N) {
        printf("Ingresar el elemento de indice %d:\n",i);
        scanf("%d",&arreglo[i]);
        i = i + 1;
    }
}

int main(void) {
    int arr[N];

    ingresarArreglo(arr); 
    printf("Ahora imprimimos el arreglo:\n");
    imprimirArreglo(arr);

    return 0;
}
