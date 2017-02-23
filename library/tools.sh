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
