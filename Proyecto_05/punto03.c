#include <stdio.h>

int calculamaximo(int x, int y) {
    int r;

    if (x <= y) {
        r = y;
    }
    else {
        r = x;
    }

    return r;
}

int main() {
    int indice = 0, r, a[100], largo, n;
    r = a[0];

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 1;
    printf("\nIngrese hasta que posicion desea buscar el maximo: ");
    scanf("%d", &n);

    while (indice <= n) {
        r = calculamaximo(r, a[indice]);
        indice = indice + 1;
    }

    printf("\nEl valor maximo es: %d\n\n", r);

    return 0;
}
