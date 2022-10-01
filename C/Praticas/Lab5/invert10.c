#include <stdio.h>
int main(){
    int v[10];
    int i, max;
    for (i=0;i<=9;i++){
        scanf("%d\n",&v[i]);
    }
    printf("\n");
    for (i=9;i>=0;i--){
        printf("%d\n",v[i]);
    }
    for (i=0,max=v[0];i<10;i++){
        if (max<v[i])
        max=v[i];
    }
    printf("\nmax= %d",max);
}