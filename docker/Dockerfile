FROM ubuntu:18.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install \
		sudo \
		dialog \
		less \
		x-window-system \
		mesa-utils \
		locales \
		libcanberra-gtk-module \
		libcanberra-gtk3-module

# RUN apt-get install 

RUN useradd -ms /bin/bash jetpack

# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-ubuntu-docker-container/38553499
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

ENV HOME /home/jetpack

WORKDIR $HOME

COPY jetpack_entrypoint.sh /jetpack_entrypoint.sh
ENTRYPOINT /jetpack_entrypoint.sh
