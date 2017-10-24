#!/bin/bash
set -e

DEFAULT_PATH_PROJECTS="/opt/tomcat/webapps"
DEFAULT_PATH_BIRT="${DEFAULT_PATH_PROJECTS}/viewer_440"

# BLOCO RESPONSAVEL PELA CONFIGURACAO DO BIRT - URBEM
echo "Install Birt in Project to Urbem..."
cp /birt.xml $DEFAULT_PATH_BIRT/WEB-INF/web.xml

/etc/service/tomcat/run