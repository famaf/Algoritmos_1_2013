#include <stdio.h>

int main() {
    int N;
    int h;
    int r = 0, s = 1 , n = 0;

    printf("\nIngrese la posición de la suceción de Fibonacci: ");
    scanf("%d", &N);

    while (n != N) {
        h = r;
        r = s;
        s = s + h;
        n = n + 1;
    }

    printf("\nEl %dº numero de la sucesión de Fibonacci es: %d.\n\n", N, r);

    return 0;
}
