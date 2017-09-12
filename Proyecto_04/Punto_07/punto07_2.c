#include <stdio.h>

int exponencial(int x, int y) {
    int r = 1;

    while (y != 0) {
        y = y - 1;
        r = r * x;
    }

    return r;
}


int main(void) {
    int x, y, r;

    printf("\nIngrese la base: ");
    scanf("%d", &x);

    printf("Ingrese el exponente: ");
    scanf("%d", &y);
    printf("\n");

    r = exponencial(x, y);
    printf("Resultado: %d^%d = %d\n\n",x,y,r);

    return 0;
}
