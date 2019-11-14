FROM ubuntu:16.04
MAINTAINER Ryan Mcintosh mcinrl1@stuent.op.ac.nz

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-setuptools python3-pip gunicorn3
RUN update-alternatives --install /use/bin/python python /usr/bin/python3 10

COPY . /flaskapp
WORKDIR /flaskapp
RUN pip3 install -r requirements.txt

EXPOSE 5000
ENTRYPOINT "./startup.sh"
