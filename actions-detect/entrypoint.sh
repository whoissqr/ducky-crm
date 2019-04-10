#!/bin/bash
bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.url="$1" \
--blackduck.api.token="NWU3NzM4MzQtMWU3Yi00MjVkLThkZTMtNTVlNzQyY2Q0ODFkOjdkOWM5NGJiLTRhZDUtNDk3Yy04NDdlLWMyNmFmMDBkYTg4ZA==" \
--detect.project.name="DuckyCrmActions" \
--detect.project.version.name="1.0.2-gautam-actions" \
--blackduck.trust.cert=true \
--detect.report.timeout=900 \
--detect.tools="SIGNATURE_SCAN"
