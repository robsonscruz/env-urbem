#!/bin/bash
set -e

psql -h postgrehost -p 5432 -U docker -d etl < /srv/www/urbem/banco-zerado-urbem3.0/script_servidor_pentaho_log_controle.sql