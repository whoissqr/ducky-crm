#!/bin/bash
bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.url="$1" \
--blackduck.api.token="$BLACKDUCK_API_TOKEN" \
--detect.project.name="DuckyCrmActions" \
--detect.project.version.name="1.0.2-gautam-actions" \
--blackduck.trust.cert=true \
--detect.report.timeout=900 \
--detect.tools="SIGNATURE_SCAN"
