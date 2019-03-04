ARG jetpack_file
ARG uid
ARG gid
FROM ubuntu:18.04

ARG jetpack_file
ARG uid
ARG gid

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install \
		sudo \
		dialog \
		less \
		x-window-system \
		mesa-utils

# RUN apt-get install 

RUN mkdir -p /home/jetpack && \
    echo "jetpack:x:${uid}:${gid}:Developer,,,:/home/jetpack:/bin/bash" >> /etc/passwd && \
    echo "jetpack:x:${gid}:" >> /etc/group && \
    echo "jetpack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jetpack && \
    chmod 0440 /etc/sudoers.d/jetpack && \
    chown ${uid}:${gid} -R /home/jetpack

USER jetpack
ENV HOME /home/jetpack

COPY bashrc /home/jetpack/.bashrc
COPY bashrc /root/.bashrc
COPY bash_profile /home/jetpack/.bash_profile
COPY bash_profile /root/.bash_profile

COPY jetpack_entrypoint.sh /jetpack_entrypoint.sh
ENTRYPOINT /jetpack_entrypoint.sh
#CMD ["${uid}", "${gid}", "${jetpack_file}"]
