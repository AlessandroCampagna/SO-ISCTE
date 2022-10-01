#include <stdio.h>
int main(){
    int a, l, x, y;
    scanf("%d %d",&a,&l);
    for (y=1; y <= a; y++){
        for (x=1; x <= l; x++){
            if (x == 1 || y == 1 || x == l || y == a)
            printf("x");
            else
            printf(" ");
        }
         printf("\n");
    }
}