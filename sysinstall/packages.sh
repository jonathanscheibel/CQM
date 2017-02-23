#!/bin/bash

source library/tools.sh

function installPackagesNessessary(){
	print "Instalando pacotes necessários..."
	yum install -q -y dialog
}
installPackagesNessessary
