#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos 2021/2022
##
## Aluno: Nº:105088       Nome:Alessandro Costa Campagna
## Nome do Módulo: stats.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

echo

if [ $# -lt "1" ]; then

    ./error 2 && exit

elif [[ $1 =~ ^"listar"$ ]]; then
    if [ $# -ge "1" ]; then
        cat portagens.txt | cut -d ':' -f3 | sort | uniq | ./success 6
    else 
        ./error 2 && exit
    fi


elif [[ $1 =~ ^"registos"$ ]]; then
    if [ $# -ge "2" ]; then
        if [[ $2 =~ ^[0-9][0-9]*$ ]] && [ $2 -gt "0" ]; then
            r=`cat portagens.txt | wc -l`
            x=1
            while  [ $x -le $r ]; do
                registo=`cat portagens.txt | tail -n +$x | head -1 | cut -d ':' -f2 `
                n=`cat relatorio_utilizacao.txt | grep "$registo" | wc -l`
                if [ $n -ge $2 ]; then
                    s=`cat portagens.txt | grep "$registo" | cut -d ':' -f2`
                    if [ $x -gt "1" ]; then
                        stats="${stats}\|$s"
                    else
                        stats="$s"
                    fi
                fi
                x=$(($x+1))
            done
            cat portagens.txt | cut -d ':' -f2 | grep "$stats" | ./success 6
        else
            ./error 3 $2 && exit
        fi
    else
        ./error 2 && exit
    fi


elif [[ $1 =~ ^"condutores"$ ]]; then
    p=`cat pessoas.txt | wc -l`
    x=1
    while [ $x -le $p ]; do
        id=`cat pessoas.txt | cut -d ':' -f3 | tail -n +$x | head -1`
        if grep -q "ID$id" relatorio_utilizacao.txt; then
            if [ $x -gt "1" ]; then
                condutores="${condutores}\|$id"
            else
                condutores="$id"
            fi
        fi
        x=$(($x+1))
    done
    cat pessoas.txt | grep "$condutores" | cut -d ':' -f2 | ./success 6

else

    ./error 3 $1

fi

