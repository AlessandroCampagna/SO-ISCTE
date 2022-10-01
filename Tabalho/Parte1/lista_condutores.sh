#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos 2021/2022
##
## Aluno: Nº:105088       Nome:Alessandro Costa Campagna 
## Nome do Módulo: lista_condutores.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

echo

if [ -f pessoas.txt ]; then
    cat pessoas.txt | awk -F ':' '{print "ID", $3 , $2 , $1 , $4 , $3 , "150"}' |
     sed 's/ /;/g' | sed 's/;//' | sed 's/;/-/' | sed 's/;/ /' > condutores.txt
else 
    ./error 1 "pessoas.txt" && exit
fi

./success 2 "condutores.txt"