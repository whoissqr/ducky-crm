FROM openjdk:8-jdk-alpine

LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="GitHub Actions <support+actions@github.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Synopsys Detect for GitHub Actions"
LABEL "com.github.actions.description"="Runs signature detect"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

# COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

RUN apk --no-cache add curl
RUN apk update
RUN apk upgrade
RUN apk add bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
