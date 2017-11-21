#!/bin/bash
set -e

psql -h postgrehost -p 5432 -U docker -d urbem-transparencia < /srv/www/urbem/banco-zerado-urbem3.0/transparencia-zerado.sql