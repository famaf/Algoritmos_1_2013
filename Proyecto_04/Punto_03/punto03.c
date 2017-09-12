#include <stdio.h>

int calculaminimo(int x, int y) {
    int r;

    if (x <= y) {
        r = x;
    }
    else {
        r = y;
    }

    return r;
}

int main(void) {
    int x, y, r;

    printf("\nIngrese el primer numero: ");
    scanf("%d", &x);

    printf("Ingrese el segundo numero: ");
    scanf("%d", &y);

    r = calculaminimo(x, y);
    printf("\nResultado: %d\n\n", r);

    return 0;
}
