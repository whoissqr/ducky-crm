#!/bin/sh

set -e

sh -c "mvn $*"

find ${HOME}
