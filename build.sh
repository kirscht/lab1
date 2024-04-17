#!/bin/bash -x

WORKDIR="/tmp/${1}"
TAG="$(date +%F-%H%M)"

cd && mkdir -p ${WORKDIR} && cd ${WORKDIR} || exit 1

function dockerfile ()
{

cat <<dockerfile > ./dockerfile
FROM ${REPO}
dockerfile

}


function kali-rolling-dockerfile ()
{

cat <<dockerfile > ./dockerfile
FROM ${REPO}
RUN apt update && apt install -y net-tools && apt install -y nmap
dockerfile

}

function ansible-dockerfile ()
{

cat <<dockerfile > ./dockerfile
FROM ${REPO}
RUN apk update && apk add ansible
dockerfile

}


case ${1} in

  kali)
    REPO="kalilinux/kali-rolling:latest"
    IMAGE='kali-rolling'
    kali-rolling-dockerfile
    ;;

  juiceshop)
    REPO="chucknelson01/juiceshop:423"
    IMAGE="${1}"
    dockerfile
    ;;

  bwapp)
    REPO="hackersploit/bwapp-docker:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  bodgeit)
    REPO="securecodebox/bodgeit:latest"
    IMAGE="${1}"
    dockerfile
    ;;


  shellshock)
    REPO="vulnerables/cve-2014-6271:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  heartbleed)
    REPO="vulhub/heartbleed:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  dvwa)
    REPO="sagikazarmark/dvwa:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  hackazon)
    REPO="ianwijaya/hackazon:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  mutillidae)
    REPO="santosomar/mutillidae_2:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  webgoatdn)
    REPO="appsecco/owasp-webgoat-dot-net:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  goatandwolf)
    REPO="webgoat/goatandwolf:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  webgoat)
    REPO="webgoat/webgoat:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  owaspbricks)
    REPO="citizenstig/owaspbricks:latest"
    IMAGE="${1}"
    dockerfile
    ;;

  ansible)
    REPO="alpine:latest"
    IMAGE="${1}"
    ansible-dockerfile
    ;;


  *)
    printf "Args must be: kali, juiceshop\n"
    exit 1
    ;;

esac


sudo docker build -t kirscht/${IMAGE}:${TAG} .
sudo docker push kirscht/${IMAGE}:${TAG}
sudo docker tag  kirscht/${IMAGE}:${TAG} kirscht/${IMAGE}:latest
sudo docker push kirscht/${IMAGE}:latest
