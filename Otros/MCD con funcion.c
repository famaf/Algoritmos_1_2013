#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int mcd(int a, int b) {
    while (a > b || b > a) {
        if (a > b) {
            a = a - b;
        }
        else if (b > a) {
            b = b - a;
        }
    }

    return a;
}


int main(void) {
    int x, y;
    int xInput, yInput;

    printf("Ingrese x\n");
    scanf("%d", &xInput);
    x = xInput;

    printf("Ingrese y\n");
    scanf("%d", &yInput);
    y = yInput;

    assert(xInput > 0 && x == xInput && yInput > 0 && y == yInput);

    x = mcd(x,y);

    printf("El maximo comun divisor es %d\n",x);

    return 0;
}
