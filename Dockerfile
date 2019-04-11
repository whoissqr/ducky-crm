From maven:3.6.0-jdk-8-alpine

ENV CATALINA_HOME /usr/local

RUN mkdir $CATALINA_HOME/src
ADD src $CATALINA_HOME/src
COPY pom.xml $CATALINA_HOME

RUN mvn -f $CATALINA_HOME/pom.xml clean package && mkdir ${HOME}/BUILD_OUTPUT && cp -r $CATALINA_HOME/target ${HOME}/BUILD_OUTPUT

RUN find ${HOME}/BUILD_OUTPUT/target/.

#RUN cd $CATALINA_HOME/target && for filename in *; do echo "${filename}"; done && cd ..
