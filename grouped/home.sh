#!/bin/bash

function startingCQN(){
	while : ; do
	    resposta=$(
	    dialog --stdout --backtitle "Cross Quick Migration - $VERSION "	\
	            --title " Cross Quick Migration "						\
	            --menu 'Escolha uma das opcoes:' 						\
	            0 0 0                   								\
	            1 'Configurar' 											\
	            2 'Atualizar'  											\
	            0 'Sair'                								)
	            
	    [ $? -ne 0 ] && break
	
	    case "$resposta" in
	    	1) configure ;;
	        2) atualize ;;
	        0) break; ;;
	    esac
	done
	clear
}