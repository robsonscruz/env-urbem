#!/bin/bash
set -e

pg_restore -h postgrehost -p 5432 -U docker -d urbem -F t /srv/www/urbem/banco-zerado-urbem3.0/urbem-zerado.tar