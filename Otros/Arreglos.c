#include <stdio.h>
#include <assert.h>

#define N 4

int main(void) {
    int arr[N];
    int i = 0;

    arr[0] = 1;
    arr[1] = 7;
    arr[2] = 9;
    arr[3] = 10;

/*
Tambien se puede directamente cargar todos los valores cuando declaramos el
arreglo:
    int arr[N] = {1, 7, 9, 10}; 
*/

    while (i < N) {
        printf("Elemento numero %d del arreglo: %d\n", i, arr[i]);
        i = i + 1;
    } 

    return 0;
}
