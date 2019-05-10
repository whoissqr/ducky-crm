FROM tomcat:jre8

MAINTAINER davemeurer@github

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

WORKDIR $CATALINA_HOME

RUN chgrp -R 0 $CATALINA_HOME
RUN chmod -R g+rw $CATALINA_HOME
RUN find $CATALINA_HOME -type d -exec chmod g+x {} +

COPY target/ducky-crm-0.3.0.war /usr/local/tomcat/webapps/ducky-crm.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
