#include <stdio.h>
#include <math.h>

int main() {
    int num;

    printf("Enter a number: ");
    scanf("%d", &num);

    int first_digit = (int)pow(10, floor(log10(num)));

    printf("The first digit is: %d\n", first_digit);

    return 0;
}
