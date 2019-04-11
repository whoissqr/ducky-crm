#!/bin/sh

set -e

sh -c "mvn $*"

find ${HOME}
find ${GITHUB_WORKSPACE}
