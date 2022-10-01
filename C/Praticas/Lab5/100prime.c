#include <stdio.h>

int prime(int n);

int main(){
    int i;
    for(i=2;i<=100;i++)
        if (prime(i)==1)
            printf("%d ",i);
}

int prime(int n){
    int it;
    for(it=2;it<n;it++){
        if (n%it == 0)
            return 0;
    }
    return 1;
}