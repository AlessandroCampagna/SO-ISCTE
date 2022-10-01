#include <stdio.h>
int main() {
int a, b;
printf("Diga dois numeros: ");
scanf("%d", &a);
scanf("%d", &b);
printf("%d + %d = %d\n", a, b, a + b );
if (a >= b){
    printf("%d\n",a);
    printf("%d\n",b);}
else{
    printf("%d\n",b);
    printf("%d\n",a);

}
}