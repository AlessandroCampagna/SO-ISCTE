#include <stdio.h>

float media(int v[]);

void maior(int v[],float m);

int main(){
    int v[10],i;
    for(i=0;i<10;i++)
        scanf("%d",&v[i]);
    float m = media(v);
    printf("Media: %.1f\n",m);
    maior(v,m);
}

float media(int v[]) {
    int  i,sum=0;
    for (i=0;i<10;i++)
        sum+=v[i];
    return sum/10.0;
}

void maior(int v[],float m){
    int  i;
    for(i=0;i<10;i++){
        if (v[i]>m)
        printf("%d ",v[i]);
    }
}