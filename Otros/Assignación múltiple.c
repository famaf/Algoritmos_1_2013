#include <stdio.h>
#include <assert.h>

int main(void) {
    int a = 4;
    int b = 2;

    int aAux = a;
    int bAux = b;

    a = bAux + 1;
    b = aAux + 1;

    printf("a = %d,  b = %d\n", a, b);
    assert(a == 3 && b == 5);

    return 0;
}
