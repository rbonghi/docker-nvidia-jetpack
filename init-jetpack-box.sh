#!/bin/bash

set -e

current_dir=`pwd -P`
script_dir="$( cd "$(dirname "$0")" ; pwd -P )"

echo $script_dir

if [ "$1" == "" ]
then
	echo
	echo "Builds a docker image to run a Jetpack installer and install a NVIDIA jetson with it"
	echo
	echo "Usage: `basename $0` [jetpack_file]"
	echo "    jetpack_file        The Jetpack run file"
	echo
	exit 1
fi

jetpack_file=$1
image_tag="docker-jetpack-box"
uid=`id -u`
gid=`id -g`
user_name="jetpack"

# Build the docker image
echo "Build the docker image... (This can take some time)"
docker build \
    -t ${image_tag} docker

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
sudo touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

sudo docker run \
        -e DISPLAY=$DISPLAY \
        -e HOST_USER_ID=${uid} \
        -e HOST_USER_GID=${gid} \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume=$script_dir:/jetpack:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --device=/dev/dri/card0:/dev/dri/card0 \
        --name "${container_name}" \
        --rm \
        -it ${image_tag}


