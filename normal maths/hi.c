#include <stdio.h>

int is_prime(int n) {
    if (n < 2) {
        return 0;  // 0 indicates non-prime
    }

    for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0) {
            return 0;  // 0 indicates non-prime
        }
    }

    return 1;  // 1 indicates prime
}

int main() {
    int number = 2;
    if (is_prime(number)) {
        printf("%d is a prime number\n", number);
    } else {
        printf("%d is not a prime number\n", number);
    }
    return 0;
}
