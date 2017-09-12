#include <stdio.h>

int main() {
    int indice = 0, r = 0, s = 0, t = 0, a[100], largo;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf ("Ingrese la posicion %d del arreglo: ", indice);
        scanf ("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 0;
    while (indice < largo) {
        if (a[indice] > 0) {
            r = r + t;
            t = t + 1;
        }
        else if (a[indice] == 0) {
            r = r + indice;
            s = s + 1;
            t = t + 1;
        }
        else {
            r = r + s;
            s = s + 1;
        }
        indice = indice + 1;
    }

    printf("\nCantidad de productos positivos: %d \n\n", r);

    return 0;
}
