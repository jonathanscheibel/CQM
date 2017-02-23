#!/bin/bash

function atualize(){
	dialog --backtitle "Cross Quick Migration - $VERSION "	                                         											\
		--title 'ATENCAO'                              											\
		--yesno "\nDeseja realmente atualizar o sistema CQM?\n\nVersao atual: $VERSION\n\nOs arquivos serao substituidos e a operacao nao podera ser desfeita.\n\n"    \
   		0 0
   	if [ $? -eq 0 ]; then		
		downloadLastFiles	
		installAllPackages	
		print "Rotina de atualização realizada. Precione [ENTER]" 	
		read	
		sh cqm.sh start
		exit $SUCESS_000000
	fi	
}