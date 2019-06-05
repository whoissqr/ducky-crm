# CHANGE THIS IMAGE TO THE BASE IMAGE FROM YOUR BUILD TOOL

FROM zenika/alpine-maven:3-jdk8

# DO NOT EDIT BELOW THIS LINE

RUN  apk update \
  && apk add wget \
  && apk add unzip \
  && apk add bash \
  && apk add cherokee --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted\
  && rm -rf /var/lib/apt/lists/*


ENV SWIP_ACCESS_TOKEN=$SWIP_ACCESS_TOKEN
ENV SWIP_SERVER_URL=$SWIP_SERVER_URL
ENV SWIP_HOME /.swip


COPY entrypoint.sh /

RUN dos2unix /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
