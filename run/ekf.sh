#!/usr/bin/env bash

DOCKER_IMAGE="sheaffej/b2-ekf"
LABEL="b2"
CONTAINER_NAME="ekf_odom"

[ -z "$ROS_MASTER_URI" ] && echo "Please set ROS_MASTER_URI env" && exit 1

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run -d --rm \
--name ${CONTAINER_NAME} \
--label ${LABEL} \
--net host \
--env ROS_MASTER_URI \
-v $MYDIR/../b2_ekf:/ros/src/b2_ekf \
$DOCKER_IMAGE roslaunch b2_ekf ekf.launch 


