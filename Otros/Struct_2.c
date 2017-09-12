#include <stdio.h>

#define N 30

struct alumno {
    int legajo;
    char nombre[N];
    char apellido[N];
};

int main(void) {
    struct alumno x;

    printf("Ingrese los datos del alumno x.\n");
    printf("Legajo:\n");
    scanf("%d", &x.legajo);
    printf("Nombre:\n");
    scanf("%s", x.nombre);
    printf("Apellido:\n");
    scanf("%s", x.apellido);

    printf("Datos del alumno:\nLegajo: %d\nNombre: %s\nApellido: %s\n", x.legajo, x.nombre, x.apellido);

    return 0;
}
