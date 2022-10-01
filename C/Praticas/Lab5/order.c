#include <stdio.h>

int main(){

    int v[10],i,j,temp;
    for(i=0;i<10;i++)
        scanf("%d",&v[i]);

    for(i=0;i<10;i++)
        for(j=i+1;j<10;j++)
            if(v[i] > v[j]){
                temp=v[i];
                v[i]=v[j];
                v[j]=temp;
            }
    printf("\n");
    for(i=0;i<10;i++)
        printf("%d\n",v[i]);
}
