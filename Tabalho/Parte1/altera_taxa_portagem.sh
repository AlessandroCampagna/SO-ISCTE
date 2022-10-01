#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos 2021/2022
##
## Aluno: Nº: 105088      Nome: Alessandro Costa Campagna
## Nome do Módulo: altera_taxa_portagem.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

echo

if [ $# -lt 3 ]; then
    ./error 2 && exit
elif [[ ! $1 =~ ^.*-.*$ ]]; then
    ./error 3 "$1" && exit
elif [[ ! $2 =~ ^[A-Z][0-9]+$ ]]; then
    ./error 3 "$2" && exit
elif [[ ! $3 =~ ^[0-9][0-9]*$ ]] || [ $3 -le "0" ]; then
    ./error 3 "$3" && exit
else 
    if [ ! -f portagens.txt ]; then 
        touch portagens.txt
    fi

    if ! grep -q $1 portagens.txt; then
        idp=` cat portagens.txt | cut -d ':' -f1 | sort -n | tail -1 `
        idp=$(($idp+"1"))
        echo -e "$idp:$1:$2:$3" >> portagens.txt
    else
        line=`grep -n ":$1:" portagens.txt | cut -d ':' -f1`
        sed -i "${line}s/:[0-9][0-9]*/:$3/" portagens.txt
    fi 
    ./success 3 $1
fi
./success 4 portagens.txt | sort -t : -k 3,3 -k 2,2
