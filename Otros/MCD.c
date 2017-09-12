#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

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

    while (x > y || y > x) {
        if (x > y) {
            x = x - y;
        } 
        else if (y > x) {
            y = y - x;
        }
    }

    printf ("El maximo comun divisor es %d\n", x);

    return 0;
}
