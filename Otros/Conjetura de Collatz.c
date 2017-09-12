#include <stdio.h>
#include <assert.h>

/* cf http://en.wikipedia.org/wiki/Collatz_conjecture */

int main(void) {
    int a, aInicial;
    int counter = 0;

    printf("Entrar un numero\n");
    scanf("%d", &aInicial);

    assert ( aInicial > 0 );
    a = aInicial;

    while (a != 1) {
        /* Chequea si a es par */
        if (a%2 == 0) {
            a = a/2;
        }
        else {
            a = (3*a) + 1;
        }
        
        counter = counter + 1;
    }

    printf("%d necesita %d pasos en la secuencia de Collatz\n", aInicial,  counter);

    return 0;
}
