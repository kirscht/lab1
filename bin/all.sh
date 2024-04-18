#!/usr/bin/env bash

cd ~/lab1/

services=(
ansible
bwapp
dvwa
hackazon
mutillidae
webgoatdn
beef
bodgeit
goatandwolf
heartbleed
juiceshop
Metasploitable
owaspbricks
shellshock
webgoatmain)

if [[ "${1}" == "start" ]]
then
  bash bin/start_container.sh "main"
  for i in "${services[@]}"
  do
    bash bin/start_container.sh "${i}"
  done

fi

if [[ "${1}" == "stop" ]]
then

  for i in "${services[@]}"
  do
    bash bin/stop_container.sh "${i}"
  done
  bash bin/stop_container.sh "main"
fi


#strings=(
#string1
#string2
#"string with spaces"
#stringN
#)
#for i in "${strings[@]}"; do
#echo "$i"
#done