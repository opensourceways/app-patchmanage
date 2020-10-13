FROM swr.ap-southeast-1.myhuaweicloud.com/openeuler/openeuler-x86-20.09:20.09 

MAINTAINER caozhi1214@gmail.com

RUN dnf -y install patch-tracking && dnf clean all 

WORKDIR /etc/patch-tracking
RUN openssl req -x509 -days 3650 -subj "/CN=self-signed" -nodes -newkey rsa:4096 -keyout self-signed.key -out self-signed.crt

CMD ["/usr/bin/patch-tracking"]

