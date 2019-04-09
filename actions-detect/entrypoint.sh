#!/bin/sh

bash <(curl -s https://blackducksoftware.github.io/hub-detect/hub-detect.sh) \
--blackduck.url="https://bizdevhub.blackducksoftware.com" \
--blackduck.api.token="MDVlYWEyODQtMzc5NS00NzVkLWJhN2MtN2M4YWY3ZmUwMjJiOjRmNjc0OWEyLWFiZjUtNDgwNS05ZjBjLTllNzJmNjVmYmNhNQ==" \
--detect.project.name="DUCKY-ACTIONS" \
--detect.project.version.name="1" \
--detect.policy.check.fail.on.severities=ALL \
--detect.risk.report.pdf=true \
--blackduck.trust.cert=true \
--detect.api.timeout=900000
