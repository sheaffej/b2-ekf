FROM ros:melodic-robot-bionic

WORKDIR /root
SHELL [ "bash", "-c"]
ENV ROS_WS /ros

RUN apt-get update \
&& apt-get install -y \
   git \
   vim \
   ros-melodic-robot-localization \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p ${ROS_WS}/src \
&&  cd ${ROS_WS}/src

RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
&& cd ${ROS_WS}/src \
&& catkin_init_workspace \
&& cd ${ROS_WS} \
&& catkin_make 

COPY ./entrypoint.sh /
RUN echo "source /entrypoint.sh" >> .bashrc
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]
