# CHANGE THIS IMAGE TO THE BASE IMAGE FROM YOUR BUILD TOOL

FROM alpine:latest
RUN   apk update \
 &&   apk add ca-certificates wget \
 &&   update-ca-certificates

# DO NOT EDIT BELOW THIS LINE

ENV SWIP_ACCESS_TOKEN=gu7q514gr17qhfo23r0elhiv09ooh8e8ibet1kiuqom614nc8lq0
ENV SWIP_SERVER_URL=https://polaris.synopsys.com
ENV SWIP_HOME /.swip
RUN mkdir /.swip && wget https://polaris.synopsys.com/api/tools/swip_cli-linux64.zip -O /tmp/swip_cli-linux64.zip \
&& mkdir /tmp/swip_cli-linux64 \
&& unzip /tmp/swip_cli-linux64.zip -d /tmp/swip_cli-linux64 \
&& rm /tmp/swip_cli-linux64.zip && cp /tmp/swip_cli-linux64/**/bin/* /usr/bin
ENTRYPOINT [ "swip_cli", "analyze", "-w" ]
