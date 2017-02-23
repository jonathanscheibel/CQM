#!/bin/bash

function installAllPackages(){	
	executeSuperUser sysinstall/toolsInstallation.sh
}

function installationCQM(){
	print "Instalando... Por favor aguarde."
	downloadLastFiles
	installAllPackages
	licenca=$(curl -s $HTTP_LICENCE_FILE)
	echo $licenca | grep "Not Found" > /dev/null
	if [ $? -eq 1 ]; then
		wget $HTTP_LICENCE_FILE -q -O $HTTP_LICENCE
	fi
	dialog                       	\
		--title 'Termos de Uso'  	\
		--textbox $HTTP_LICENCE 	\
		0 0	
	dialog --stdout                             		\
		--title 'AVISO'                              	\
		--yesno '\nVoce aceita os termos de uso?\n\n'   \
		0 0
	if [ $? -eq 0 ]; then	
		clear
		serialCliente=$(dialog --stdout --inputbox 'Digite o serial:' 0 0)
		requerimentInstalation $serialCliente		
		read
		sh cqm.sh start
		exit $SUCESS_000000
	else
		clear
		exit $ALERT_000001
	fi
}