#include <stdio.h>
#include "NumClass.h"
int my_pow(int x, int y){ //pow function x ^ y 
    if (y == 0){
        return 1;
    }
    else if (y % 2 == 0){
        int half_y = y / 2;
        int half_pow = my_pow(x, half_y);
        return half_pow * half_pow;
    }
    else {
        return x * my_pow(x, y - 1);
    }
}

int my_log10(int x){// finds the length of a number
    int counter = 0;
    while (x >= 10){
        x /= 10;
        counter++;
        //
    }
    return counter;
}

int isPalindrome(int n) { 
    int from_the_back = 0; 
    int temp = n; 
    while (temp != 0) { 
        from_the_back = (from_the_back * 10) + (temp % 10); 
        temp = temp / 10; 
    } 
    return from_the_back == n;
} 

int isArmstrong(int x){
    int temp = x;
    int cap = (int)my_log10(x)+1;
    int sum = 0;

    while(temp){ // uterate through the sivitiot of the number
        sum += my_pow(temp%10,cap);
        temp /= 10;
    }
    return sum == x;
}