#!/bin/bash
pwd
cd ${GITHUB_WORKSPACE}
pwd

bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.api.token="$BLACKDUCK_API_TOKEN" \
"$*"
