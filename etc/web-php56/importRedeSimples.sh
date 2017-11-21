#!/bin/bash
set -e

mysql -u root -proot -h mysqlhost project_rede_simples < /srv/www/urbem/banco-zerado-urbem3.0/rede-simples.sql