#!/bin/bash
set -e

HOST_REDE_SIMPLES=$(cat /etc/hosts | grep $(cat /etc/hostname) | awk '{print $1}' | uniq)
echo "${HOST_REDE_SIMPLES}  redesimples.prod" >> /etc/hosts

/usr/bin/supervisord