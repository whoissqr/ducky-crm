From maven:3.6.0-jdk-8-alpine

ENV CATALINA_HOME /usr/local

RUN mkdir $CATALINA_HOME/src
ADD src $CATALINA_HOME/src
COPY pom.xml $CATALINA_HOME

RUN mkdir ${GITHUB_WORKSPACE}/BUILD_OUTPUT
RUN mvn -f $CATALINA_HOME/pom.xml clean package && cp -r $CATALINA_HOME/target ${GITHUB_WORKSPACE}/BUILD_OUTPUT

RUN find ${GITHUB_WORKSPACE}/BUILD_OUTPUT/target/.

#RUN cd $CATALINA_HOME/target && for filename in *; do echo "${filename}"; done && cd ..
