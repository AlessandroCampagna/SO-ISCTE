#include <stdio.h>
int main () {
int a =10, b=3;
float r;
int v[4] = {2, 6, -9, 78};
r = (float)a / b;
printf("A divisão de %5d por %05d é %4.2f\n", a, b, r );
int x = (b > 2);
printf("valor de x : %d\n", x);
printf("O valor da 3º Posição do vetor ,v[2], : %d\n", v[2] );
}