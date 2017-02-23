#!/bin/bash

NAME_FILE_CONFIG=client.conf
FILE_CONFIG_EXCLUSIVE=security/client/$NAME_FILE_CONFIG

if [ -e $FILE_CONFIG_EXCLUSIVE ]; then
	source $FILE_CONFIG_EXCLUSIVE
fi

function pysicalSerial(){
	brute=$(udevadm info --query=all --name=/dev/sda | grep ID_SERIAL=)
	trated=$(echo $brute | sed -e "s/:\ //g")
	echo $trated | sed -e "s/=//g"
}

function sendEmailTryhacking(){
	sendMail "Tentativa de utilização indevida do sistema CQM!"
}

function resultSecretText(){
	echo "Security is in your hands! Not remove this line!"
}

function getSerialCliente(){
	echo $(getSerialClienteConf)
}

function getSerialHD(){
	echo $(getSerialHDConf)
}

function getDateExpiration(){
	echo $(getDateExpirationConf)
}

function verifyDateExpiration(){
	dateNow=$(date +%Y-%m-%d)
	dateExpiration=$(getDateExpiration)
	if [[ "$dateNow" > "$dateExpiration" ]]; then
	    print "Por favor, verifique a instalação do sistema CQM."
	    exit $ERROR_000004
	fi	
}

function verifySystemInstalledModel(){
	if [ ! -e "$FILE_CONFIG_EXCLUSIVE" ] ; then
		print "Falha ao inicializar o sistema. Verifique a instalação do sistema. Caso o problema persista procure o suporte tecnico para solucionar o problema!"
		exit $ERROR_000001
	fi	
}

function verifySerialPhysicToFileClient(){
	if [ "$(getSerialHD)" != "$(pysicalSerial)" ]; then
		print "Falha ao inicializar o sistema. Verifique a instalação do sistema. Caso o problema persista procure o suporte tecnico para solucionar o problema!"
		exit $ERROR_000003
	fi
}

function requerimentInstalation(){
	HTTP_DIR_CQM_CLIENTE=$HTTP_PROTOCOL$HTTP_HOME/clientes/systems/cqm/
	serialCliente=$1
	serialHDCliente=$pysicalSerial
	
	echo "Pedindo ao servidor acesso para esta maquina..."
	destino=$(pwd)/security/client/$NAME_FILE_CONFIG
	wget $HTTP_DIR_CQM_CLIENTE$serialCliente/$NAME_FILE_CONFIG -q -O $destino
}
