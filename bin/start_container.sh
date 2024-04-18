#!/usr/bin/env bash

if [ -d ~/lab1/${1} ]
then
  cd ~/lab1/${1}

  if [ ${0} -eq "start_container.sh" ]
  then
    sudo docker-compose up -d
    sudo docker-compose ps
  fi

  if [ ${0} -eq "stop_container.sh" ]
  then
    sudo docker-compose ${0}
    sudo docker-compose ps
  fi

fi
