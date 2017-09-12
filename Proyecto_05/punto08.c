#include <stdio.h>

struct qyr {int cociente; int resto;};


struct qyr dividir(int dividendo, int divisor) {
    struct qyr r;
    r.resto = dividendo;
    r.cociente = 0;

    while (r.resto >= divisor) {
        r.cociente = r.cociente + 1;
        r.resto = r.resto - divisor;
    }

    return r;
}

int main() {
    int dividendo, divisor;
    struct qyr v;

    printf("\nIngrese el dividendo: ");
    scanf("%d", &dividendo);

    printf("Ingrese el divisor: ");
    scanf("%d", &divisor);

    v = dividir(dividendo, divisor);
    printf("\nEl cociente es %d y el resto es %d.\n\n", v.cociente, v.resto);
    printf("\nAlgoritmo de división: %d = %d * %d + %d.\n\n" , dividendo, v.cociente, divisor, v.resto);

    return 0;
}
