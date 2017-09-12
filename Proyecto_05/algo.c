#include <stdio.h>

int main() {
    int dividendo, divisor, resto, cociente;

    printf("\nIngrese el dividendo: ");
    scanf("%d", &dividendo);

    printf("\nIngrese el divisor: ");
    scanf("%d", &divisor);

    resto = dividendo;
    cociente = 0;

    while (resto >= divisor) {
        cociente = cociente + 1;
        resto = resto - divisor;
    }

    printf("\nEl cociente es: %d", cociente);
    printf("\nEl resto es: %d\n", resto);
    printf("\nAlgoritmo de la division: %d = %d * %d + %d\n\n", dividendo, divisor, cociente, resto);

    return 0;
}
