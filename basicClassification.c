#include <stdio.h>
#include "NumClass.h"
int isStrong(int x){
    int arr [] = {1,2,6,24,120,720,5040,40320,362880};
    int temp = x;
    int sum = 0;
    while (temp > 0){
        sum += arr[temp%10];
        temp /= 10;
    }
    return sum == x;
}

int isPrime(int n){
      // Corner case
    if (n <= 1)
        return 0;
 
    // Check from 2 to square root of n
    for (int i = 2; i*i <= n; i++)
        if (n % i == 0)
            return 0;
 
    return 1;
}