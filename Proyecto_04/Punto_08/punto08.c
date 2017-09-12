#include <stdio.h>

int mcd(int x, int y) {
    while (x != y) {
        if (x > y) {
            x = x - y;
        }
        else {
            y = y - x;
        }
    }

    return x;
}

int main(void) {
    int x, y, r;

    printf("\nIngrese el primer numero: ");
    scanf("%d", &x);

    printf("Ingrese el segundo numero: ");
    scanf("%d", &y);

    r = ((x * y) / mcd (x, y));
    printf("\nEl MCM es: %d\n\n", r);

    return 0;
}
