FROM fedora:32 

MAINTAINER caozhi1214@gmail.com

RUN dnf install gcc gcc-c++ vim python3-devel openssl-devel -y
RUN pip3 install flask flask-sqlalchemy flask-apscheduler flask-httpauth requests pandas
RUN pip3 install -I uwsgi

WORKDIR /patchmanage

COPY patch-tracking*.rpm ./

RUN dnf install patch-tracking*.rpm -y
RUN openssl req -x509 -days 3650 -subj "/CN=self-signed" -nodes -newkey rsa:4096 -keyout self-signed.key -out self-signed.crt
RUN \cp self-signed.* /etc/patch-tracking/

RUN dnf clean all


