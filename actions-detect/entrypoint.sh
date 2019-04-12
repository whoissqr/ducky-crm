#!/bin/bash
bash <(curl -s https://detect.synopsys.com/detect.sh) \
--blackduck.api.token="MDVlYWEyODQtMzc5NS00NzVkLWJhN2MtN2M4YWY3ZmUwMjJiOjRmNjc0OWEyLWFiZjUtNDgwNS05ZjBjLTllNzJmNjVmYmNhNQ==" \
--blackduck.url="https://bizdevhub.blackducksoftware.com" \
"$*"
