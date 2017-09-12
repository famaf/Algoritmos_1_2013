#include <stdio.h>

int main() {
    int indice = 0, a[100], b[100], c[100], largo;

    printf("\nIngrese el largo de los arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del 1º arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    printf("\n");

    indice = 0;
    while (indice != largo) {
        printf("Ingrese la posicion %d del 2º arreglo: ", indice);
        scanf("%d", &b[indice]);
        indice = indice + 1;
    }

    printf("\n");
    printf("El producto punto entre los arreglos 1º y 2º es:\n\n");
    indice = 0;

    while (indice < largo) {
        c[indice] = a[indice] * b[indice];
        printf("Posicion %d: %d\n", indice, c[indice]);
        indice = indice + 1;
    }

    printf("\n\n");
    return 0;
}
