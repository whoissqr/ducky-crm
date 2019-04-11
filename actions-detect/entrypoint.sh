#!/bin/bash

cd BUILD_OUTPUT
for filename in *; do echo "${filename}"; done
cd ..

pwd

bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.url="$BLACKDUCK_URL" \
--blackduck.api.token="$BLACKDUCK_API_TOKEN" \
--detect.project.name="DuckyCrmActions" \
--blackduck.trust.cert=true \
--detect.report.timeout=900 \
"$*"
