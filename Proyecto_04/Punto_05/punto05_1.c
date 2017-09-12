#include <stdio.h>
#include <assert.h>

int calculaminimo(int x, int y, int xAux, int yAux) {
    int r;

    if (x <= y) {
        assert(x <= y && x == xAux && y == yAux);
        r = x;
        assert((x <= y && r == x) || (x > y && r == y));
    }
    else {
        assert(x >= y && x == xAux && y == yAux);
        r = y;
        assert((x <= y && r == x) || (x > y && r == y));
    }

    return r;
}

int main(void) {
    int x, y, r;
    int xAux, yAux;

    printf("\nIngrese el primer numero: ");
    scanf("%d", &x);

    printf("Ingrese el segundo numero: ");
    scanf("%d", &y);

    xAux = x;
    yAux = y;
    assert(x == xAux && y == yAux);

    r = calculaminimo(x, y, xAux, yAux);
    assert((x <= y && r == x) || (x > y && r == y));
    printf("\nResultado: %d\n\n", r);

    return 0;
}
