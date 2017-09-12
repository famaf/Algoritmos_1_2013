#include <stdio.h>

int meme(int x, int y) {
    int xAux = x;

    x = y * y;
    y = xAux * xAux;

    if (x >= y) {
        x = x - y;
        printf("\nResultado: x = %d, y = %d\n\n", x, y);
    }
    else {
        y = y - x;
        printf("\nResultado: x = %d, y = %d\n\n", x, y);
    }

    return 0;
}

int main(void) {
    int x, y;

    printf("\nIngrese el valor de x: ");
    scanf("%d", &x);

    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    meme(x, y);

    return 0;
}
