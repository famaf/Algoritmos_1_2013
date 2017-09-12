#include <stdio.h>
#include <assert.h>

/*
Definicion de un tipo estructurado nuevo.

La sintaxis es:
    struct NOMBRE_TIPO {
        TYPO1 NOMBRE_CAMPO1;
        TYPO2 NOMBRE_CAMPO2;
        ...
    };
*/

struct par {
    int fst;
    int snd;
};

/*
Declarar una variable con tipo estructurado.

Se hace asi:
    struct NOMBRE_TIPO NOMBRE_VARIABLE;
*/

struct par f(void) {
    struct par result;

    result.fst = 10;
    result.snd = 20;

    return result;
}

/* Ejemplo de inicializacion de struct durante la declaracion */

struct par g(void) {
    struct par result = {100, 200};

    return result;
}


int main (void) {
    struct par a, b;

    a = f();
    printf("%d %d\n", a.fst, a.snd);

    b = g();
    printf("%d %d\n", b.fst, b.snd);

    return 0;
}
