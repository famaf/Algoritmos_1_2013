#include <stdio.h>

int exponencial(int x, int y) {
    int r = 1;

    while (y != 0) {
        if (y % 2 == 0) {
            x = x * x;
            y = y / 2;
        }
        else {
            y = y - 1;
            r = r * x;
        }
    }

    return r;
}

int main() {
    int N;
    int x = 0;

    printf("\nIngrese un entero positvo: ");
    scanf("%d", &N);

    while((exponencial(x, 3) + x) < N) {
        x = x + 1;
    }

    printf("\nEl menor entero que cumple que x^3 + x >= %d es: %d\n\n", N, x);

    return 0;
}
