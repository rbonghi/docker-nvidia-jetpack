#!/bin/bash

set -e

uid=$HOST_USER_ID
gid=$HOST_USER_GID

# https://unix.stackexchange.com/questions/230238/starting-x-applications-from-the-terminal-and-the-warnings-that-follow
export NO_AT_BRIDGE=1

mkdir -p /home/jetpack
echo "jetpack:x:${uid}:${gid}:Developer,,,:/home/jetpack:/bin/bash" >> /etc/passwd
echo "jetpack:x:${gid}:" >> /etc/group
echo "jetpack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jetpack
chmod 0440 /etc/sudoers.d/jetpack
chown ${uid}:${gid} -R /home/jetpack
cd /jetpack

bash

# Run Jetpack
#chmod +x ${JETPACK_FILE}
#su jetpack ./${JETPACK_FILE} --verbose
