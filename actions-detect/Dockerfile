FROM openjdk:8-jre

LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="GitHub Actions <support+actions@github.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Synopsys Detect for GitHub Actions"
LABEL "com.github.actions.description"="Runs signature detect"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

# COPY LICENSE README.md THIRD_PARTY_NOTICE.md /
# For ALPINE
# RUN apk update
# RUN apk upgrade
# RUN apk add bash
# RUN apk --no-cache add curl

RUN apt-get update && \
    apt-get install curl -y && \
    apt-get clean -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
