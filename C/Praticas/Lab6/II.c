#include "pauta.h"

#define MAXALUNOS 10
Aluno pauta[MAXALUNOS];

void iniciar_memoria() {
    int i;
    for(i=0;i<MAXALUNOS;i++) {
        pauta[i].num = -1;
        strcpy(pauta[i].nome, "(sem nada)");
        pauta[i].nota = -1;
    }
}

Aluno obter_dados_aluno() {
    Aluno a;
    char tmp[100];

    printf("Num: ");
    fgets(tmp, 100, stdin); a.num = atoi(tmp);

    printf("Nome: ");
    fgets(a.nome, 100, stdin); a.nome[ strlen(a.nome) - 1] = "\0";

    printf("Nota: ");
    fgets(tmp, 100, stdin); a.nota = atof(tmp);

    return a;
}

void mostrar_pauta() {
    int i;
    for (i=0;i < MAXALUNOS; i++ )
        printf ("Aluno %2d: %d %s %f\n", i, pauta[i].num, pauta[i].nome, pauta[i].nota );
}

int main() {
    iniciar_memoria();
    char tmp[5];
    int opcao = -1;
    while ( opcao != 0 ) {
        printf("1 - introduzir aluno\n");
        printf("2 - mostrar pauta\n");
        printf("3 - gravar em ficheiro\n");
        printf("4 - ler de ficheiro de texto\n");
        printf("5 - ler de ficheiro binário\n");

        fgets(tmp, 100, stdin); opcao = atoi(tmp);
        if (opcao == 1) {
            Aluno a = obter_dados_aluno();
            int pos = 0;
            while ( (pos < MAXALUNOS) && ( pauta[pos].num != -1 ) ) pos++; // procura posicao vazia
            if ( pos < MAXALUNOS )
            pauta[pos] = a;
        } else if (opcao == 2) {
            mostrar_pauta();
        } else if (opcao == 3) {
            guardar_ficheiro_texto("pauta.txt");
            guardar_ficheiro("pauta.dat");
        } else if (opcao == 4) {
            ler_ficheiro_texto("pauta.txt");
        } else if (opcao == 5) {
            ler_ficheiro("pauta.dat");
        }
    }
}