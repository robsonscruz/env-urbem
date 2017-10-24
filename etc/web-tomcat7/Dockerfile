FROM inovatrend/java7
MAINTAINER Ivan Turcinovic <ivan.turcinovic@inovatrend.com>

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.63
ENV CATALINA_HOME /opt/tomcat

RUN apt-get update && \
    apt-get install -yq --no-install-recommends pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install tomcat
RUN \
    wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

# Add script for creating tomcat admin user and starting tomcat
ADD ./config/create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD ./config/run.sh /run.sh
RUN chmod +x /*.sh

# Add script for starting tomcat as runit service
RUN mkdir /etc/service/tomcat
ADD ./config/tomcat.sh /etc/service/tomcat/run
RUN chmod +x /etc/service/tomcat/run

# Add tomcat roles and users
#ADD tomcat-users.xml ${CATALINA_HOME}/conf/

# Remove unneeded apps
RUN rm -rf ${CATALINA_HOME}/webapps/examples ${CATALINA_HOME}/webapps/docs

# Enabling the insecure key permanently, to be able to login to container using ssh, or docker-ssh
RUN /usr/sbin/enable_insecure_key

ENV PATH $PATH:$CATALINA_HOME/bin

# RUN Script Extra
COPY ./runtime/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

# Config BIRT
COPY ./config/birt.xml /birt.xml

# Dependencies
RUN apt-get update && apt-get install -yq zip unzip postgresql-contrib

# INIT CONFIG BIRT
ENV DEFAULT_PATH_PROJECTS="/opt/tomcat/webapps"
ENV DEFAULT_PATH_BIRT="${DEFAULT_PATH_PROJECTS}/viewer_440"

RUN cd /tmp && wget http://eclipse.c3sl.ufpr.br/birt/downloads/drops/R-R1-4_4_0-201406111043/birt-runtime-4_4_0-20140611.zip -O birt-runtime-4_4_0.zip && unzip birt-runtime-4_4_0.zip \
        && sudo cp -f -r birt-runtime-4_4_0/WebViewerExample $DEFAULT_PATH_BIRT \
        && cd /tmp && wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jre6.jar \
        && cp postgresql-9.4.1212.jre6.jar $DEFAULT_PATH_BIRT/WEB-INF/lib/. \
        && sudo chmod 755 $DEFAULT_PATH_BIRT/WEB-INF/lib/postgresql-9.4.1212.jre6.jar

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]