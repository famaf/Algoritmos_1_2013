#include <stdio.h>

void imprimir(int a) {
    printf("Resultado: %d\n\n", a);
}


int main(void) {
    int x, y;

    printf("\nIngrese la primera variable que desea imprimir: ");
    scanf("%d", &x);
    imprimir(x);

    printf("Ingrese la segunda variable que desea imprimir: ");
    scanf("%d", &y);
    imprimir(y);

    return 0;
}
