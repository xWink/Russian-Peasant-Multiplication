/**
 * Name: Shawn Kaplan
 * ID: 0966499
 * Email: skaplan@uoguelph.ca
 * 
 * This program prompts the user for 2 integers and multiplies
 * them using both interative and recursive functions following
 * the Russian Peasant Multiplication algorithm. The runtime
 * of each function is measured and printed with the results.
 */

#include <stdio.h>
#include <time.h>

long int recur(long int a, long int b);
long int nonrecur(long int a, long int b);

int main() {
    long int a = 0, b = 0;
    long int recurAns, iterAns;
    long int recurStartTime, recurEndTime, iterStartTime, iterEndTime;
    
    // Get multiplier and multiplicand
    printf("Enter multiplier: ");
    scanf("%ld", &a);
    printf("Enter multiplicand: ");
    scanf("%ld", &b);
    printf("\n");
    
    // Time recursive multiplication
    recurStartTime = clock();
    recurAns = recur(a, b);
    recurEndTime = clock();
    
    // Time iterative multiplication
    iterStartTime = clock();
    iterAns = nonrecur(a, b);
    iterEndTime = clock();
    
    // Print answers and runtimes
    printf("Recursive product: %ld\n", recurAns);
    printf("Nonrecursive product: %ld\n\n", iterAns);
    printf("Recursive runtime: %f ms\n", ((double)(recurEndTime - recurStartTime) / CLOCKS_PER_SEC) * 1000.0);
    printf("Nonrecursive runtime: %f ms\n", ((double)(iterEndTime - iterStartTime) / CLOCKS_PER_SEC) * 1000.0);
    
    return 0;
}

long int recur(long int a, long int b) {
    if (a == 0) {
        return 0;
    }
    if (a == 1) {
        return b;
    }
    if (a > 1 && (a % 2 == 0)) {
        return recur(a / 2, b + b);
    }
    if (a > 1 && (a % 2 == 1)) {
        return b + recur(a / 2, b + b);
    } else {
        return 0;
    }
}

long int nonrecur(long int a, long int b) {
    long int result = 0;

    if (a == 0) {
        return 0;
    }
    if (a == 1) {
        return b;
    }
    
    while (b > 0) {
        if (b % 2 != 0) {
            result += a;
        }
        a *= 2;
        b /= 2;
    }

    return result;
}
