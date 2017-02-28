#!/bin/bash

source library/tools.sh
source library/superUser.sh

source sysinstall/install.sh
source sysinstall/lastFiles.sh
source sysinstall/atualize.sh

source security/model.sh

source grouped/home.sh
source grouped/configuration/configuration.sh

source messages/alert
source messages/error
source messages/sucess

export VERSION="2017.01.04"

export HTTP_PROTOCOL=https://
export HTTP_HOME=www.github.com

HTTP_DIR_CQM=$HTTP_HOME/jonathanscheibel/CQM/releases/download/$VERSION/
HTTP_FILE_COMPACT=cqm.tar.gz
HTTP_LICENCE=licence.lic

HTTP_LAST_FILE=$HTTP_PROTOCOL$HTTP_DIR_CQM$HTTP_FILE_COMPACT
HTTP_LICENCE_FILE=$HTTP_PROTOCOL$HTTP_DIR_CQM$HTTP_LICENCE

function secutitySystemModel(){
	if [ "$(resultSecretText)" != 'Security is in your hands! Not remove this line!' ]; then
		sendEmailTryhacking
		exit $ERROR_000002
	fi			
}

function trySecurity(){	
	verifySystemInstalledModel
	secutitySystemModel
	verifySerialPhysicToFileClient
	verifySystemCompilation 
	verifyDateExpiration
}

function start(){
	if [ "$(isDebug)" == "false" ]; then	
		trySecurity
	fi 
	startingCQM	
}

function install(){	
	installationCQM
}

function reinstall(){
	install
}

function newRelease(){
	gerateNewRelease
}
	
$@