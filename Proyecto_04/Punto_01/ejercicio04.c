#include <stdio.h>

void compara(int x, int y) {
    if (x == y) {
        printf("Resultado: %d es igual a %d\n", x, y);
    }
    else if (x > y) {
        printf("Resultado: %d es mayor a %d\n", x, y);
    }
    else {
        printf("Resultado: %d es menor a %d\n", x, y);
    }
}


int main(void) {
    int x, y;

    printf("\nIngrese las variables que desea comparar: ");
    scanf("%d %d", &x, &y);

    compara(x, y);
    printf("\n");

    return 0;
}
