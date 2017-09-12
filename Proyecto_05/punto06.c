#include <stdio.h>
#include <math.h>

int main() {
    int indice = 0, e, a[100], largo;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    printf("\nIngrese el elemento que desea buscar: ");
    scanf("%d", &e);

    indice = 0;
    while (indice < largo && a[indice] != e) {
        indice = indice + 1;
    }

    if (indice >= largo) {
        indice = -1;
    }

    printf("\nPosición del elemento en el arreglo: %d\n\n", indice);

    return 0;
}
