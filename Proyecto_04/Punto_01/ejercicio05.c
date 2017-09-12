#include <stdio.h>

void holaHasta(int x) {
    if (x <= 0) {
        printf("Error");
    }
    else {
        while (x > 0) {
            printf("Hola! ");
            x = x - 1;
        }
    }
}

int main(void) {
    int x;

    printf("\nIngrese cuantas veces quiere ver la palabra Hola!: ");
    scanf("%d", &x);
    printf("\n");

    holaHasta(x);
    printf("\n\n");

    return 0;
}
