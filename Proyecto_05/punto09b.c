#include <stdio.h>

int calculamaximo(int x, int y) {
    int p;

    if (x <= y) {
        p = y;
    }
    else {
       p = x;
    }

    return p;
}


int main() {
    int indice = 0, s, sAux, r, a[100], largo;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 2;
    s = calculamaximo(a[0], a[1]);
    r = (a[0] - a[1]);

    while (indice < largo) {
        sAux = s;
        r = calculamaximo(r, (s - a[indice]));
        s = calculamaximo(sAux, a[indice]);
        indice = indice + 1;
    }

    printf("\nLa mayor diferencia entre dos de sus elementos es: %d\n\n", r);

    return 0;
}
