#
# Base Docker
#
# https://github.com/tarunbhardwaj/my-docker
#

# Pull base image.
FROM ubuntu:12.04

# Update and Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim openssh-server && \
  apt-get install -y python-dev libxml2-dev libxslt-dev python-lxml libpq-dev

# Add keys to ssh
RUN mkdir /root/.ssh
RUN curl https://github.com/tarunbhardwaj.keys > /root/.ssh/authorized_keys

# Install PIP
RUN curl https://bootstrap.pypa.io/get-pip.py | python

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

EXPOSE 22

# Start ssh daemon
CMD /usr/sbin/sshd -D
