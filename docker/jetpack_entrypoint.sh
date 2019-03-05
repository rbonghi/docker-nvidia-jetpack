#!/bin/bash

set -e

uid=$1
gid=$2

uid=1000
gid=1000

mkdir -p /home/jetpack
echo "jetpack:x:${uid}:${gid}:Developer,,,:/home/jetpack:/bin/bash" >> /etc/passwd
echo "jetpack:x:${gid}:" >> /etc/group
echo "jetpack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jetpack
chmod 0440 /etc/sudoers.d/jetpack
chown ${uid}:${gid} -R /home/jetpack

echo ${uid} > /home/jetpack/test

su jetpack /code/jetpack.run
