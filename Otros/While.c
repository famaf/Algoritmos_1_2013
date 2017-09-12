#include <stdio.h>
#include <assert.h>

int main (void) {
    int x;
    int xInput;

    printf("Ingrese un entero positivo\n");
    scanf("%d", &xInput);
    x = xInput;

    assert(xInput > 0 && x == xInput);

    while (x < 10) {
        x = x + 1;
    }

    assert(x >= 10);

    printf("El valor fin al de x es %d\n",x);

    return 0;
}
