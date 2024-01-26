#include <stdio.h>
#include "NumClass.h"
int my_log10(int x){
    int counter = 0;
    while (x > 0){
        x /= 10;
        counter++;
    }
    return counter;
}
int my_pow(int x, int y){
    if (y == 0){
        return 1;
    }
    else if (y % 2 == 0){
        int half_y = y / 2;
        int half_pow = my_pow(x, half_y);
        return half_pow * half_pow;
    }//
    else {
        return x * my_pow(x, y - 1);
    }
}
int Arm(int x, int length){ // this is the recursive funtion
    if (x == 0){
        return 0;
    }
    return my_pow(x%10,length) + Arm(x/10,length);
}
int isArmstrong(int x){
    int length = my_log10(x); // just to get the length fo the number
    return x == Arm(x,length);
}
int rev(int n, int temp) // if a number is palindrome then the reversed number is equal to the og
{
    // base case
    if (n == 0)
        return temp;
 
    // stores the reverse of a number
    temp = (temp * 10) + (n % 10); 
    // shifts everyone left and adds the last number^_^
    return rev(n / 10, temp);
}

int isPalindrome(int num) {
    return num == rev(num,0);
}
