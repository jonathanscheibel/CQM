#!/bin/bash

function login(){
	if [ "$(id -u)" != "0" ]; then			
		echo "Credencial de super usuário: "
		su -c "sh $1"	
	else
		su -c "sh $1"
	fi
}

