#include <stdio.h>
#include <assert.h>

int calculabs(int x, int xAux) {
    int r;

    if (x >= 0) {
        assert(x == xAux && x >= 0);
        r = x;
        assert((x >= 0 && r == x) || (x < 0 && r == -x));
    }
    else {
        assert(x == xAux && x < 0);
        r = -x;
        assert((x >= 0 && r == x) || (x < 0 && r == -x));
    }

    return r;
}

int main(void) {
    int x, r;
    int xAux;

    printf("\nIngrese el numero al cual le desea calcular el valor absoluto: ");
    scanf("%d", &x);

    xAux = x;
    assert(x == xAux);

    r = calculabs(x, xAux);
    assert((x >= 0 && r == x) || (x < 0 && r == -x));
    printf("Resultado: %d\n\n",r);

    return 0;
}
