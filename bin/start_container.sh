#!/usr/bin/env bash

echo "Script ${0} ${1}"
if [ -d ~/lab1/${1} ]
then
  cd ~/lab1/${1}

  if [[ "${0}" == "start_container.sh" ]] || [[ "${0}" == "bin/start_container.sh" ]]
  then
    sudo docker-compose up -d
    sudo docker-compose ps
  fi

  if [ "${0}" == "stop_container.sh" ]
  then
    sudo docker-compose ${0}
    sudo docker-compose ps
  fi

fi
