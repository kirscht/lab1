#!/usr/bin/env bash

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

for i in "${services[@]}"
do
  bash ~/lab1/bin/stop_container.sh "${i}"
done

#strings=(
#string1
#string2
#"string with spaces"
#stringN
#)
#for i in "${strings[@]}"; do
#echo "$i"
#done