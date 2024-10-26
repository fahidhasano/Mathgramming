#include <stdio.h>

void swp(int *a, int *b) {
    int x;
    x=*a;
    *a=*b;
    *b=x;
}

int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    swp(&a, &b);
    printf("%d %d\n", a, b);
    return 0;
}
