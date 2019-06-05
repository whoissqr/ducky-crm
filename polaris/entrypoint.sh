#!/bin/bash

mkdir /.swip && wget https://polaris.synopsys.com/api/tools/swip_cli-linux64.zip -O /tmp/swip_cli-linux64.zip \
&& unzip /tmp/swip_cli-linux64.zip -d /tmp/swip_cli-linux64 \
&& rm /tmp/swip_cli-linux64.zip && cp /tmp/swip_cli-linux64/**/bin/* /usr/bin

swip_cli analyze -w  
