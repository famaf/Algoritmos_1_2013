#include <stdio.h>
#include <stdbool.h>

int main() {
    int indice = 0, a[100], largo;
    bool existe = false;

    printf("\nIngrese el largo del arreglo: ");
    scanf("%d", &largo);
    printf("\n");

    while (indice != largo) {
        printf("Ingrese la posicion %d del arreglo: ", indice);
        scanf("%d", &a[indice]);
        indice = indice + 1;
    }

    indice = 0;
    while (indice < largo && !existe) {
        existe = existe || (a[indice] >= 0);
        indice = indice + 1;
    }

    printf("\nExiste un elemento positivo? : %s.\n\n" , (existe)? "Si" : "No");

    return 0;
}
