#!/bin/bash

function downloadLastFiles(){
	wget $HTTP_LAST_FILE -q -O $HTTP_FILE_COMPACT 
	tar -zxf $HTTP_FILE_COMPACT
	rm -rf $HTTP_FILE_COMPACT
}