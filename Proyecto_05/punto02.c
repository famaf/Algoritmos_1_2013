#include <stdio.h>

int main() {
    int indice = 0, s = 0, a[100], largo;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 0;
    while (indice != largo) {
        s = s + a[indice];
        indice = indice + 1;
    }
    printf("\nLa suma de los elementos del arreglo es %d\n\n", s);

    return 0;
}
