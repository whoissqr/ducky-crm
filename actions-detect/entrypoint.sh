#!/bin/bash
find ${HOME}

cd ${GITHUB_WORKSPACE}
pwd
find ${GITHUB_WORKSPACE}

bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.url="$BLACKDUCK_URL" \
--blackduck.api.token="$BLACKDUCK_API_TOKEN" \
--detect.project.name="DuckyCrmActions-Fixed" \
--blackduck.trust.cert=true \
--detect.report.timeout=900 \
"$*"
