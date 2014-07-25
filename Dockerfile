#
# Base Docker
#
# https://github.com/tarunbhardwaj/my-docker
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Tarun Bhardwaj <mailme@tarunbhardwaj.com>

# Setup environment and UTF-8 locale
ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update and Install.
RUN \
  apt-get update && \
  apt-get -y -q upgrade && \
  apt-get install -y -q build-essential && \
  apt-get install -y -q software-properties-common && \
  apt-get install -y -q curl git htop man unzip vim openssh-server && \
  apt-get install -y -q python-dev libxml2-dev libxslt-dev python-lxml libpq-dev

# Add keys to ssh
RUN mkdir /root/.ssh
RUN curl https://github.com/tarunbhardwaj.keys > /root/.ssh/authorized_keys

# Install PIP
RUN apt-get -y -q install python-pip

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

EXPOSE 22

# Start ssh daemon
CMD /usr/sbin/sshd -D
