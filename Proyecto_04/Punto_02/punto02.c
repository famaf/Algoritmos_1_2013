#include <stdio.h>
#include <assert.h>

int main(void) {
    int x, y, r;

    printf("\nIngrese el primer valor: ");
    scanf("%d", &x);

    printf("Ingrese el segundo valor: ");
    scanf("%d", &y);
    printf("\n");

    r = x;
    x = y;
    y = r;

    printf("Resultado: \n\n");
    printf("Primer valor intercambiado: %d\n", x);
    printf("Segundo valor intercambiado:%d\n\n", y);

    return 0;
}
