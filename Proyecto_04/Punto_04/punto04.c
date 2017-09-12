#include <stdio.h>

int calculabs(int x) {
    int r;

    if (x >= 0) {
        r = x;
    }
    else {
        r = -x;
    }

    return r;
}

int main(void) {
    int x, r;

    printf("\nIngrese el numero al cual le desea calcular el valor absoluto: ");
    scanf("%d", &x);

    r = calculabs(x);
    printf("Resultado: %d\n\n",r);

    return 0;
}
