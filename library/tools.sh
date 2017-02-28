#!/bin/bash

function print(){
	echo $1
}

function executeSuperUser(){
	login $1
}

function sendMail(){
	echo "$1"
}

function compileAllScripts(){
	print "Compilando todos os scripts..."
}
	
function gerateNewRelease(){
	compileAllScripts	
	rm -rf cqm.tar.gz
	tar -zcf cqm.tar.gz *	
	dirActual=`pwd`
	print "Nova release gerada com sucesso!"
	print "Local: $dirActual/cqm.tar.gz"
	print "Por favor, faça o deploy manualmente!"
	read
}