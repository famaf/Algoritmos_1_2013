#include <stdio.h>

int main() {
    int indice = 0, r = 0, a[100], largo;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 0;
    while (indice < largo) {
        if (a[indice] % 2 == 0) {
            r = r + 1;
            indice = indice + 1;
        }
        else {
            indice = indice + 1;
        }
    }
    printf("\nLa cantidad de elementos pares: %d\n\n", r);

    return 0;
}
