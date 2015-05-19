#!/bin/bash
set -x

APP_NAME="cesium"

docker ps -a | grep $APP_NAME
if [ "$?" == "0" ];then

  docker ps | grep $APP_NAME
  if [ "$?" == "0" ];then
	docker stop $APP_NAME
	if ! [ "$?" == "0" ];then
		echo "could not stop running container $APP_NAME"
		exit -1
	else
		docker rm $APP_NAME
		if ! [ "$?" == "0" ];then
			echo "ERROR: could not remove container $APP_NAME" 	
			exit -1
		fi
	fi
  fi
fi

docker run --name $APP_NAME -d -p 80:80 $APP_NAME

if [ "$?" != "0" ];then
	echo "ERROR:  could not start container $APP_NAME"
	exit -1
fi

echo "exiting..."
