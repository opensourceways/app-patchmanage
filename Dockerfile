FROM fedora:32 

MAINTAINER caozhi1214@gmail.com

RUN dnf install gcc vim python3-devel openssl-devel -y
#RUN dnf install wget gcc python3-devel vim openssl-devel -y
RUN pip3 install flask flask-sqlalchemy flask-apscheduler flask-httpauth requests uwsgi

WORKDIR /patchmanage

COPY patch-tracking*.rpm ./

#RUN pip install -r requirements

RUN dnf install patch-tracking*.rpm -y
RUN openssl req -x509 -days 3650 -subj "/CN=self-signed" -nodes -newkey rsa:4096 -keyout self-signed.key -out self-signed.crt
RUN \cp self-signed.* /etc/patch-tracking/
#RUN dnf clean all


#CMD ["pkgshipd", "start"] 

