#!/bin/bash

#Lista de scripts que deverao ser executados
function installPackages(){
	./sysinstall/packages.sh
}

#Outras coisas que precisam ser instaladas
function installOther(){
	echo
}

#Tudo que precisa instalar
function installTools(){	
	installPackages
	installOther
}

installTools
