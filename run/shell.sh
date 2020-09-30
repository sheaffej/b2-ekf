#!/usr/bin/env bash

DOCKER_IMAGE="sheaffej/b2-ekf"
LABEL="b2"

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOWNLOADS_DIR=~/Downloads

docker run -it --rm \
--label ${LABEL} \
--net host \
--env ROS_MASTER_URI \
-v ${DOWNLOADS_DIR}:/root/Downloads \
-v $MYDIR/../b2_ekf:/ros/src/b2_ekf \
$DOCKER_IMAGE $@


