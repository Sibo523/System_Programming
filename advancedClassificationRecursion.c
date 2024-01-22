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
    }
    else {
        return x * my_pow(x, y - 1);
    }
}
int Arm(int x, int length){
    if (x == 0){
        return 0;
    }
    return my_pow(x%10,length) + Arm(x/10,length);
}
int isArmstrong(int x){
    int length = my_log10(x);
    return x == Arm(x,length);
}
int reverse(int num) {
    static int rev = 0;
    if (num == 0) {
        return rev;
    } else {
        rev = rev * 10 + num % 10;
        return reverse(num / 10);
    }
}

int isPalindrome(int num) {
    return num == reverse(num);
}
