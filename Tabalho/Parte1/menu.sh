#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos 2021/2022
##
## Aluno: Nº:105088       Nome:Alessandro Costa Campagna
## Nome do Módulo: menu.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################~

while [[ $op != "0" ]]; do

    echo
    echo "1. Listar condutores"
    echo "2. Altera taxa de portagem"
    echo "3. Stats"
    echo "4. Faturação"
    echo "0. Sair"
    echo
    echo -e -n "Opção: "
    read op

    if [[ ! $op =~ ^[0-9][0-9]*$ ]] || [ $op -lt "0" ] || [ $op -gt "4" ]; then
        ./error 3 $op
    elif [ $op = "1" ]; then
        ./lista_condutores.sh
    elif [ $op = "2" ]; then
        echo
        echo "Altera taxa de portagem..."
        echo
        echo -e -n "Lanço           : "
        read l
        echo -e -n "Auto-estrada    : "
        read a
        echo -e -n "Novo valor taxa : "
        read t
        ./altera_taxa_portagem.sh $l $a $t
    elif [ $op = "3" ]; then
        echo
        echo "Stats"
        echo
        echo "1. Nome de todas as Autoestradas"
        echo "2. Registos de utilização"
        echo "3. Listagem condutores"
        echo "0. Voltar"
        echo
        echo -e -n "Opção: "
        read op1
        if [ $op1 = "2" ]; then
            echo -e -n "Minimo de registos: "
            read mr
            ./stats.sh "registos" "$mr"
        elif [ $op1 = "1" ]; then
            ./stats.sh "listar" 
        elif [ $op1 = "3" ]; then
            stats="condutores"
            ./stats.sh "condutores" 
        elif [ $op1 = "0" ];then
            :
        fi
            
    elif [ $op = "4" ]; then
        ./faturacao.sh
    fi

done
exit