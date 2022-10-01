#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos 2021/2022
##
## Aluno: Nº:105088      Nome:Alessandro Costa Campagna 
## Nome do Módulo: faturacao.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

echo

if [ ! -f relatorio_utilizacao.txt ]; then
    ./error 1 relatorio_utilizacao.txt && exit
fi

if [ -f faturas.txt ]; then
    rm faturas.txt
fi

if [ -s relatorio_utilizacao.txt ];then

    touch faturas.txt
    n=`cat pessoas.txt | wc -l`
    x=1

    while [ $x -le $n ]; do
        nome=`cat pessoas.txt | cut -d ':' -f2 | tail -n +${x} | head -1 `
        echo "Cliente: $nome" >> faturas.txt
        id=`cat pessoas.txt | cut -d ':' -f3 | tail -n +${x} | head -1 `
        cat relatorio_utilizacao.txt | grep "ID$id" >> faturas.txt
        
        m=`cat relatorio_utilizacao.txt | grep "ID$id" | wc -l `
        y=1
        t=0
        while [ $y -le $m ]; do
            L=`cat relatorio_utilizacao.txt | grep "ID$id" | tail -n +$y | head -1 | cut -d ':' -f2 `
            c=`cat portagens.txt | grep $L | cut -d ':' -f4`
            t=$(($t+$c))
            y=$(($y+1))
        done

        echo "Total: $t créditos" >> faturas.txt
        x=$(($x+1))
    done
fi
./success 5 "faturas.txt"