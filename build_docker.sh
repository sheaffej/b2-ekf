#!/bin/bash

IMAGE="sheaffej/b2-ekf"

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t ${IMAGE} ${MYDIR}
