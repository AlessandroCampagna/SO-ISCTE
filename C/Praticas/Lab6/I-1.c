#include <stdio.h>
#include <string.h>

#define MAX 1024

int main( int argc, char *argv[] ) {
int i;
printf("Nº de argumentos: %d\n",argc);
for ( i=1; i<argc; i++ )
printf("%d-> %s (len:%d)\n", i, argv[i], strnlen( argv[i], MAX) ); 
}