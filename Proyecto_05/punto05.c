#include <stdio.h>
#include <math.h>

int main() {
    int indice = 0, r = 0, a[100], largo;
    double j;

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
        r = r + a[indice];
        indice = indice + 1;
    }

    r = r/largo;
    j = 0;
    indice = 0;

    while (indice < largo) {
        j = j + pow((a[indice] - r), 2);
        indice = indice + 1; 
    }

    j = sqrt(j/(largo-1));

    printf("\nLa desviación estándar es: %f\n\n", j);

    return 0;
}
