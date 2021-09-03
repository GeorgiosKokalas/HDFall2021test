#include <stdio.h>

int getbit(int val, int bitno){
        return ((val >> bitno) & 1);
}


int main (){
        printf("Hello, World!\n");
        int input=0xa;
        if(input == 10){ printf("%x = %d\n", input, input);}
        for (int i=7; i>=0; i--){
                printf("%d ", getbit(input, i));
        }
        printf("\n");
        return 0;
}

