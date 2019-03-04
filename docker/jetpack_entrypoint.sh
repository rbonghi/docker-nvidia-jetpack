#!/bin/bash

uid=$1
gid=$2

echo "jetpack:x:${uid}:${gid}:Developer,,,:/home/jetpack:/bin/bash" >> /etc/passwd
echo "jetpack:x:${gid}:" >> /etc/group && \
echo "jetpack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jetpack && \
chmod 0440 /etc/sudoers.d/jetpack && \
chown ${uid}:${gid} -R /home/jetpack

bash
