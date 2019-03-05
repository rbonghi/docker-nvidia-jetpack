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

RUN useradd -ms /bin/bash jetpack

#RUN mkdir -p /home/jetpack

#RUN mkdir -p /home/jetpack && \
#    echo "jetpack:x:${uid}:${gid}:Developer,,,:/home/jetpack:/bin/bash" >> /etc/passwd && \
#    echo "jetpack:x:${gid}:" >> /etc/group && \
#    echo "jetpack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jetpack && \
#    chmod 0440 /etc/sudoers.d/jetpack && \
#    chown ${uid}:${gid} -R /home/jetpack

RUN apt-get -y install locales
RUN apt-get -y install libcanberra-gtk-module libcanberra-gtk3-module

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

#USER jetpack
ENV HOME /home/jetpack

WORKDIR $HOME

#COPY bashrc /home/jetpack/.bashrc
#COPY bashrc /root/.bashrc
#COPY bash_profile /home/jetpack/.bash_profile
#COPY bash_profile /root/.bash_profile

COPY jetpack_entrypoint.sh /jetpack_entrypoint.sh
ENTRYPOINT /jetpack_entrypoint.sh
#CMD ["${uid}", "${gid}", "${jetpack_file}"]
