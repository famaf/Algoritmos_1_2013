#include <stdio.h>
#define N 5

int main() {
    int a[N] = {2, 2, 2, 2, 2};
    int i = 0, s = 0;

    while (i != N) {
        i = i + 1;
        s = s + a[i];
    }
    printf("%d\n", s);

    return 0;
}
