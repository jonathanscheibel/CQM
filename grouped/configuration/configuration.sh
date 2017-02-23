#!/bin/bash

source grouped/configuration/options/new.sh
source grouped/configuration/options/open.sh

function configure(){	
		while : ; do
	    resposta=$(
	    dialog --stdout --backtitle "Cross Quick Migration - $VERSION "	              							\
	            --title " Cross Quick Migration ($VERSION) "			\
	            --menu 'Escolha uma das opcoes:' 						\
	            0 0 0                   								\
	            1 'Novo' 												\
	            2 'Escolher')
	            
	    [ $? -ne 0 ] && break
	
	    case "$resposta" in
	    	1) new ;;
	        2) opened ;;
	        0) break; ;;
	    esac
	done
	clear	
}