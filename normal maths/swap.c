#include <stdio.h>

void swp(long long *a, long long *b) {
    long long x;
    x=*b;
    *b=*a;
    *a=x;
}

int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    swp((long long)&a, (long long)&b);
    printf("%d %d\n", a, b);
    return 0;
}
